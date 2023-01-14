#!/bin/bash

# Check if datanode data dir exists
datadir=`echo $HDFS_CONF_dfs_datanode_data_dir | perl -pe 's#file://##'`
if [ ! -d $datadir ]; then
  echo "Datanode data directory not found: $datadir"
  exit 2
fi

# if yes run this code to kick-off datanode
$HADOOP_HOME/bin/hdfs --config $HADOOP_CONF_DIR datanode
