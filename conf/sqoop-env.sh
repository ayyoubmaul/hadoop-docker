# Set Hadoop-specific environment variables here.

#Set path to where bin/hadoop is available
export HADOOP_VERSION=3.2.1
export HADOOP_COMMON_HOME=/opt/hadoop-$HADOOP_VERSION

#Set path to where hadoop-*-core.jar is available
export HADOOP_MAPRED_HOME=/opt/hadoop-$HADOOP_VERSION

#Set the path to where bin/hive is available
export HIVE_HOME=/opt/hive