#!/bin/bash

# Check if namenode dir exists
namedir=`echo $HDFS_CONF_dfs_namenode_name_dir | perl -pe 's#file://##'`
if [ ! -d $namedir ]; then
  echo "Namenode name directory not found: $namedir"
  exit 2
fi

# check whether clustername specified or not
# we setup clustername in docker-compose
if [ -z "$CLUSTER_NAME" ]; then
  echo "Cluster name not specified"
  exit 2
fi

# remove some unused files from namenode directory
echo "remove lost+found from $namedir"
rm -r $namedir/lost+found

# format namenode dir if there is no files or directory exists in it
if [ "`ls -A $namedir`" == "" ]; then
  echo "Formatting namenode name directory: $namedir"
  $HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode -format $CLUSTER_NAME
fi

# kick-off namenode server
$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR namenode
