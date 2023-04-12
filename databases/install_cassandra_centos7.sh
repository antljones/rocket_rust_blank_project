#!/bin/bash
cd ../..
cd binary_project
echo 'cassandra-cpp = { version = "2.0.0" }' >> ../Cargo.toml
sudo yum -y install java
sudo echo "[cassandra]" >> /etc/yum.repos.d/cassandra.repo
sudo echo "name=Apache Cassandra" >> /etc/yum.repos.d/cassandra.repo
sudo echo "baseurl=https://redhat.cassandra.apache.org/41x/" >> /etc/yum.repos.d/cassandra.repo
sudo echo "gpgcheck=1" >> /etc/yum.repos.d/cassandra.repo
sudo echo "repo_gpgcheck=1" >> /etc/yum.repos.d/cassandra.repo
sudo echo "gpgkey=https://downloads.apache.org/cassandra/KEYS" >> /etc/yum.repos.d/cassandra.repo
sudo yum update
sudo yum -y install cassandra
sudo service cassandra start
cd ..
git clone https://github.com/datastax/cpp-driver.git
sudo yum -y install libuv libuv-devel openssl-devel zlib-devel
cd cpp-driver
mkdir build
cd build
cmake ..
make
make install
cd ../..
sudo ln -s /usr/local/lib64/libcassandra.so.2 /usr/lib64/libcassandra.so.2
