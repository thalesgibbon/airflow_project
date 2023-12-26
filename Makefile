
create-user:
	airflow users create --username airflow --password airflow --firstname airflow --lastname airflow --role Admin --email seu_email@example.com

run-server:
	airflow webserver -p 8081

print-server:
	echo http://localhost:8081/home

run-schedule:
	airflow scheduler

set-airflow-project:
	export AIRFLOW_HOME=~/projects/airflow_project/airflow

airflow-init:
	airflow db init

setup:
	make set-airflow-project
	make airflow-init
	make create-user
	make print-server