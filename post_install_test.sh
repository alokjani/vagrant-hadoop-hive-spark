#!/bin/bash
java -version > /dev/null 2>&1 && echo "Java is running [OK]" || echo "Java is not running [ERROR]"
hadoop version > /dev/null 2>&1 && echo "Hadoop is running [OK]" || echo "Hadoop is not running [ERROR]"
hdfs dfs -ls / > /dev/null 2>&1 && echo "HDFS is running [OK]" || echo "HDFS is not running [ERROR]"
yarn application -list > /dev/null 2>&1 && echo "YARN is running [OK]" || echo "YARN is not running [ERROR]"
hive --version > /dev/null 2>&1 && echo "Hive is running [OK]" || echo "Hive is not running [ERROR]"
spark-shell --version > /dev/null 2>&1 && echo "Spark is running [OK]" || echo "Spark is not running [ERROR]"
ss -tuln | grep ":9000" > /dev/null 2>&1 && echo "HDFS port 9000 is running [OK]" || echo "HDFS port 9000 is not running [ERROR]"
ss -tuln | grep ":8088" > /dev/null 2>&1 && echo "YARN ResourceManager port 8088 is running [OK]" || echo "YARN ResourceManager port 8088 is not running [ERROR]"
