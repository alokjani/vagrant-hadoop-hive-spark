#!/bin/bash

echo 'Acquire::http::Proxy "http://192.168.56.3:3142";' | sudo tee /etc/apt/apt.conf.d/02proxy > /dev/null

# Update system packages
apt-get update -y
apt-get upgrade -y

# Install required dependencies
apt-get install -y wget software-properties-common apt-transport-https gnupg openjdk-11-jre-headless

# Add Apache Bigtop repository
wget -O - https://downloads.apache.org/bigtop/stable/repos/GPG-KEY-bigtop | tee /etc/apt/trusted.gpg.d/bigtop.asc
wget -O - https://mirrors.advancedhosters.com/apache/bigtop/stable/repos/ubuntu-22.04/bigtop.list | tee /etc/apt/sources.list.d/bigtop.list
#echo 'deb http://repos.bigtop.apache.org/releases/3.3.0/ubuntu/22.04/$(ARCH) bigtop contrib' | tee /etc/apt/sources.list.d/bigtop.list

# Update package lists again
apt-get update -y

# Install Hadoop ecosystem packages
apt-get install -y \
  hadoop \
  hadoop-hdfs \
  hadoop-mapreduce \
  hadoop-yarn \
  hadoop-client \
  zookeeper \
  hbase \
  hive \
  ranger \
  spark-core \
  tez 

# Create Hadoop directories
mkdir -p /hadoop/hdfs/namenode
mkdir -p /hadoop/hdfs/datanode
chown -R hdfs:hdfs /hadoop

# Configure core-site.xml
cat << EOF > /etc/hadoop/conf/core-site.xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://localhost:9000</value>
    </property>
</configuration>
EOF

# Configure hdfs-site.xml
cat << EOF > /etc/hadoop/conf/hdfs-site.xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
    <property>
        <name>dfs.namenode.name.dir</name>
        <value>/hadoop/hdfs/namenode</value>
    </property>
    <property>
        <name>dfs.datanode.data.dir</name>
        <value>/hadoop/hdfs/datanode</value>
    </property>
</configuration>
EOF

# Format HDFS
sudo -u hdfs hdfs namenode -format
sudo -u hdfs hdfs --daemon start namenode
sudo -u hdfs hdfs --daemon start datanode
sudo -u hdfs hdfs dfsadmin -report

# Check hadoop fs
sudo hdfs dfs -ls /