.PHONY: all
all: format lint cov

.PHONY: format
format:
	$(info Formating Python code)
	black --exclude '/\.venv/' .
	isort --profile black .

.PHONY: lint
lint:
	$(info Running Python linters)
	flake8 --exclude=.venv/ --max-line-length 88 --ignore=E203,E501,E704
	isort --check-only --profile black .
	black --check --exclude '/\.venv/' .

.PHONY: test
test:
	$(info Running test suite)
	python -Wall manage.py test

.PHONY: cov
cov:
	$(info Generating coverage report)
	coverage run --source='.' --omit '.venv/*' manage.py test
	coverage report -m

.PHONY: upgrade
upgrade:
	$(info Running pip-compile -U)
	pip-compile -U requirements.in
	pip install --upgrade pip
	pip install -r requirements.txt
