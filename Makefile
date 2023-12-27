
create-user:
	airflow users create --username airflow --password airflow --firstname airflow --lastname airflow --role Admin --email seu_email@example.com

run-server:
	make set-airflow-project
	echo checking AIRFLOW_HOME=$AIRFLOW_HOME
	airflow webserver -p 8081

print-server:
	echo http://localhost:8081/home

run-schedule:
	make set-airflow-project
	echo checking AIRFLOW_HOME=$AIRFLOW_HOME
	airflow scheduler

set-airflow-project:
	export AIRFLOW_HOME=~/projects/airflow_project/airflow

airflow-init:
	airflow db init

airflow-check-dags:
	airflow dags list

clean-trash-airflow:
	rm -r ~/airflow/

check-port:
	sudo lsof -t -i :8081 | xargs sudo kill -9

resync:
	make set-airflow-project
	echo checking AIRFLOW_HOME=$AIRFLOW_HOME
	airflow dags resync

deploy:
	cp -r ./dev/dags/ ./airflow/dags/

setup:
	make set-airflow-project
	make airflow-init
	make create-user
	make print-server