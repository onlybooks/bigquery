from airflow import models
from airflow.operators.bash_operator import BashOperator
from airflow.operators.python_operator import PythonOperator
from datetime import datetime, timedelta
import time

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2020, 9, 18), 
    'end_date': datetime(2020, 9, 20), 
    'email': ['airflow@airflow.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5)}

def print_hello(**kwargs):
    print("hello")

def my_sleeping_function(random_base):
    time.sleep(random_base)

# dag 객체 생성
with models.DAG(
        dag_id='airflow_first_dag', description='First DAG', 
        schedule_interval = '0 0 * * *',  # 한국 시간으로 09시 
        default_args=default_args) as dag:

    task1 = BashOperator(
        task_id='print_date',
        bash_command='date',
        dag=dag)
  
    task2 = BashOperator(
        task_id='sleep',
        bash_command='sleep 5',
        retries=3,
        dag=dag)

    task3 = PythonOperator(
        task_id='print_hello',
        python_callable=print_hello,
        dag=dag,
    )
  
    task1 >> task2
    task2 >> task3

    for i in range(5):
        multiple_task = PythonOperator(
            task_id='sleep_for_' + str(i),
            python_callable=my_sleeping_function,
            op_kwargs={'random_base': float(i) / 10},
            dag=dag,
        )

        task3 >> multiple_task
