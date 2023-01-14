# Learn Hadoop Using Docker
This is just for learning intention, not recomended for production. Use Hortonworks or Cloudera for production instead or you can just setup using cloud service. In GCP there is Dataproc or in AWS there is EMR (Elastic Map Reduce).

#### Have fun !

# Download hadoop binary
https://archive.apache.org/dist/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz


# This Repos contains
- `hadoop.env` This is the all in one place to store Hadoop settings, consists : Core Hadoop setting, Map Reduce Setting, YARN Setting and HDFS Settings
- `docker-compose.yml` The file where we compose all services into one Hadoop framework
- ``

# How to run MapReduce Job

1. There is `ratings_breakdown.py` python file in `map_reduce` directory, we can run this file on a local python mode or in Hadoop world
2. For python mode local run command `python3 map_reduce/ratings_breakdown.py input/u.data`
3. To run this file in Hadoop run this command `python3 map_reduce/ratings_breakdown.py -r hadoop --hadoop-streaming-jar /opt/hadoop-3.3.1/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar input/u.data`
4. Path `/opt/hadoop-3.3.1/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar` might be different for users or if you are using different version of Hadoop, run command `find / hadoop-streaming-$(HADOOP_VERSION).jar` to find it


hadoop fs -mkdir -p input
hdfs dfs -put ./input/* input

hadoop jar /opt/hadoop-3.3.1/share/hadoop/tools/lib/hadoop-streaming-3.3.1.jar \
-file mapper.py    -mapper mapper.py \
-file reducer.py   -reducer reducer.py \
-input input -output output

credit to : https://github.com/wxw-matt/docker-hadoop
That inspired me, and i make it less complicated to make it simple to learn

