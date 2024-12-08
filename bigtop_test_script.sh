#!/bin/bash

# Hadoop Services Validation Script

# Check Hadoop version
echo "Checking Hadoop Version:"
hadoop version

# Test HDFS functionality
echo -e "\nTesting HDFS Basic Functionality:"
hdfs dfs -mkdir -p /test-data
hdfs dfs -put /etc/hosts /test-data/hosts
hdfs dfs -ls /test-data

# Check Hadoop Services Status
echo -e "\nChecking Hadoop Services Status:"
systemctl status hadoop-hdfs-namenode
systemctl status hadoop-hdfs-datanode
systemctl status hadoop-yarn-resourcemanager
systemctl status hadoop-yarn-nodemanager

# Simple MapReduce Test
echo -e "\nRunning Sample MapReduce Job:"
hadoop jar /usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar pi 10 100

# Check installed Bigtop ecosystem components
echo -e "\nInstalled Bigtop Components:"
dpkg -l | grep bigtop

# Spark Version Check
echo -e "\nSpark Version:"
spark-submit --version

# Hive Version Check
echo -e "\nHive Version:"
hive --version

# Final Summary
echo -e "\nHadoop Ecosystem Validation Complete!"
