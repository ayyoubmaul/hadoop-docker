from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.dummy import DummyOperator
from airflow.contrib.operators.spark_submit_operator import SparkSubmitOperator
from datetime import datetime, timedelta


default_args = {
    'owner' : 'ayyoub',
    'depend_on_past' : False,
    'start_date' : datetime(2023, 1, 20),
    'email_on_failure' : False,
    'email_on_retry' : False,
    'retries' : 1,
    'retry_delay' : timedelta(minutes=5)
}

with DAG('lowest_rated_movies', default_args=default_args, schedule_interval=None, catchup=False) as dag:

    start = DummyOperator(
        task_id='start',
    )

    spark_submit = SparkSubmitOperator(
        task_id='spark_submit',
        conn_id='spark-hadoop',
        application="/hadoop-data/map_reduce/spark/lowest-rated-movies-spark.py"
    )

    end = DummyOperator(
        task_id='end',
    )

    start >> spark_submit >> end
