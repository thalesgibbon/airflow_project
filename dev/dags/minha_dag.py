from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime, timedelta


class JinjaTemplates:
    def __init__(self):
        self.run_id = '{{ run_id }}'

    def get_template(self, name):
        return getattr(self, name, None)
templates = JinjaTemplates()

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2023, 1, 1),
}
dag = DAG(
    'minha_dag_com_jinja',
    default_args=default_args,
    schedule_interval=timedelta(days=1),
    start_date=datetime(2023, 1, 1),
)


def print_run_id(run_id):
    print(f"Run ID: {run_id}")


tarefa_print_run_id = PythonOperator(
    task_id='tarefa_print_run_id',
    python_callable=print_run_id,
    op_kwargs={'run_id': templates.run_id},
    dag=dag,
)
