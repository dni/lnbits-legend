.PHONY: test

all: format check requirements.txt

format: prettier isort black

check: mypy checkprettier checkblack

prettier: $(shell find lnbits -name "*.js" -name ".html")
	./node_modules/.bin/prettier --write lnbits/static/js/*.js lnbits/core/static/js/*.js lnbits/extensions/*/templates/*/*.html ./lnbits/core/templates/core/*.html lnbits/templates/*.html lnbits/extensions/*/static/js/*.js

black:
	poetry run black .

mypy:
	poetry run mypy

isort:
	poetry run isort .

checkprettier: $(shell find lnbits -name "*.js" -name ".html")
	./node_modules/.bin/prettier --check lnbits/static/js/*.js lnbits/core/static/js/*.js lnbits/extensions/*/templates/*/*.html ./lnbits/core/templates/core/*.html lnbits/templates/*.html lnbits/extensions/*/static/js/*.js

checkblack:
	poetry run black --check .

checkisort:
	poetry run isort --check-only .

test:
	LNBITS_BACKEND_WALLET_CLASS="FakeWallet" \
	FAKE_WALLET_SECRET="ToTheMoon1" \
	LNBITS_DATA_FOLDER="./tests/data" \
	PYTHONUNBUFFERED=1 \
	poetry run pytest

test-real-wallet:
	LNBITS_DATA_FOLDER="./tests/data" \
	PYTHONUNBUFFERED=1 \
	poetry run pytest

test-pipenv:
	LNBITS_BACKEND_WALLET_CLASS="FakeWallet" \
	FAKE_WALLET_SECRET="ToTheMoon1" \
	LNBITS_DATA_FOLDER="./tests/data" \
	PYTHONUNBUFFERED=1 \
	poetry run pytest

bak:
	# LNBITS_DATABASE_URL=postgres://postgres:postgres@0.0.0.0:5432/postgres
