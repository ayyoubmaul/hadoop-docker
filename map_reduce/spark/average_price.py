from pyspark import SparkConf, SparkContext
from pyspark.sql import SQLContext


def calculate_avg():
    df_load = sqlContext.read.option("header",True).csv('hdfs://namenode:8020/user/root/input/Sales.csv')

    df_avg = df_load.groupBy("Product").agg({'Price Each':'avg'})

    # Write into HDFS
    df_avg.write.option("header",True).csv('hdfs://namenode:8020/user/root/output/average_price.csv')

if __name__ == '__main__':
    conf = SparkConf()
    conf.setAppName('average_product_price')
    sc = SparkContext.getOrCreate(conf = conf)

    sqlContext = SQLContext(sc)

    calculate_avg()
