#!/bin/bash
java -version > /dev/null 2>&1 && echo "Java is running [OK]" || echo "Java is not running [ERROR]"
hadoop version > /dev/null 2>&1 && echo "Hadoop is running [OK]" || echo "Hadoop is not running [ERROR]"
hdfs dfs -ls / > /dev/null 2>&1 && echo "HDFS is running [OK]" || echo "HDFS is not running [ERROR]"
yarn application -list > /dev/null 2>&1 && echo "YARN is running [OK]" || echo "YARN is not running [ERROR]"
spark-shell --version > /dev/null 2>&1 && echo "Spark is running [OK]" || echo "Spark is not running [ERROR]"
hive --version > /dev/null 2>&1 && echo "Hive is running [OK]" || echo "Hive is not running [ERROR]"
echo "status" | hbase shell > /dev/null 2>&1 && echo "HBase is running [OK]" || echo "HBase is not running [ERROR]"
$KAFKA_HOME/bin/kafka-topics.sh --list --bootstrap-server localhost:9092 > /dev/null 2>&1 && echo "Kafka is running [OK]" || echo "Kafka is not running [ERROR]"
zkServer.sh status > /dev/null 2>&1 && echo "ZooKeeper is running [OK]" || echo "ZooKeeper is not running [ERROR]"
systemctl status mongod | grep "active (running)" > /dev/null 2>&1 && echo "MongoDB is running [OK]" || echo "MongoDB is not running [ERROR]"
nodetool status > /dev/null 2>&1 && echo "Cassandra is running [OK]" || echo "Cassandra is not running [ERROR]"
$FLINK_HOME/bin/flink --version > /dev/null 2>&1 && echo "Flink is running [OK]" || echo "Flink is not running [ERROR]"
ss -tuln | grep ":9000" > /dev/null 2>&1 && echo "HDFS port 9000 is running [OK]" || echo "HDFS port 9000 is not running [ERROR]"
ss -tuln | grep ":8088" > /dev/null 2>&1 && echo "YARN ResourceManager port 8088 is running [OK]" || echo "YARN ResourceManager port 8088 is not running [ERROR]"
ss -tuln | grep ":9092" > /dev/null 2>&1 && echo "Kafka port 9092 is running [OK]" || echo "Kafka port 9092 is not running [ERROR]"