#!/bin/bash

# Hadoop Services Validation Script

# Check Hadoop version
echo "Checking Hadoop Version:"
hadoop version

# Check installed Bigtop ecosystem components
echo -e "\nInstalled Bigtop Components:"
dpkg-query -W -f='${Package} ${Version} ${Source}\n' | grep -E 'hadoop|hive|spark|bigtop'

# Check Hadoop Services Status
echo -e "\nChecking Hadoop Services Status:"
systemctl status hadoop-hdfs-namenode
systemctl status hadoop-hdfs-datanode
systemctl status hadoop-yarn-resourcemanager
systemctl status hadoop-yarn-nodemanager

# Test HDFS functionality
echo -e "\nTesting HDFS Basic Functionality:"
sudo -u hdfs hdfs dfs -mkdir -p /test-data
sudo -u hdfs hdfs dfs -put /etc/hosts /test-data/hosts
sudo -u hdfs hdfs dfs -ls /test-data

# Test MapReduce functionality 
echo -e "\nRunning Sample MapReduce Job:"
hadoop jar /usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar pi 10 100

# Check Spark Version
echo -e "\nSpark Version:"
spark-submit --version

# Check Hive Version 
echo -e "\nHive Version:"
hive --version

java -version > /dev/null 2>&1 && echo "Java is running [OK]" || echo "Java is not running [ERROR]"
hadoop version > /dev/null 2>&1 && echo "Hadoop is running [OK]" || echo "Hadoop is not running [ERROR]"
hdfs dfs -ls / > /dev/null 2>&1 && echo "HDFS is running [OK]" || echo "HDFS is not running [ERROR]"
yarn application -list > /dev/null 2>&1 && echo "YARN is running [OK]" || echo "YARN is not running [ERROR]"
hive --version > /dev/null 2>&1 && echo "Hive is running [OK]" || echo "Hive is not running [ERROR]"
spark-shell --version > /dev/null 2>&1 && echo "Spark is running [OK]" || echo "Spark is not running [ERROR]"
ss -tuln | grep ":9000" > /dev/null 2>&1 && echo "HDFS port 9000 is running [OK]" || echo "HDFS port 9000 is not running [ERROR]"
ss -tuln | grep ":8088" > /dev/null 2>&1 && echo "YARN ResourceManager port 8088 is running [OK]" || echo "YARN ResourceManager port 8088 is not running [ERROR]"


# Final Summary
echo -e "\nHadoop Ecosystem Validation Complete!"

