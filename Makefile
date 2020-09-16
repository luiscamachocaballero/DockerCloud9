setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	python3 -m venv ~/.DockerCloud9

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
	pip install -r requirements.txt

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

validate-circleci:
	#esta parte fue añadida despues de descargar circleci.tar.gz
	circleci config process .circleci/config.yml
	
run-circleci-local:
	#esta parte fue añadida despues de descargar circleci.tar.gz
	circleci local execute
	
lint:
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203 app.py

all: install lint test