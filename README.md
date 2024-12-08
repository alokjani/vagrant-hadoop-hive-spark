# Bigtop Hadoop Lab Vagrant Setup

## Prerequisites
- Vagrant (2.3.4 or later)
- VirtualBox (6.1 or later)

## Setup Instructions
1. Clone this repository
2. Place `provision_bigtop.sh` and `bigtop_test_script.sh` in the same directory as the Vagrantfile
3. Run `chmod +x provision_bigtop.sh bigtop_test_script.sh`
4. Execute `vagrant up`

## Post-Installation
- The test script will automatically run during provisioning
- You can manually run it later with `vagrant ssh -c "/vagrant/bigtop_test_script.sh"`

## Troubleshooting
- Ensure you have the latest Vagrant and VirtualBox
- Check system requirements (4GB RAM recommended)
- Verify internet connection for repository downloads

## Components Installed
- Hadoop (HDFS, YARN)
- Zookeeper
- HBase
- Hive
- Spark
- Tez
