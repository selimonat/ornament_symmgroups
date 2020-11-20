setup:  
	rm -rf .env
	which python
	python --version
	python -m venv .env
	.env/bin/pip install --upgrade pip
	.env/bin/pip install -r requirements.txt
nbextensions:
	jupyter contrib nbextension install --user
	jupyter nbextensions_configurator enable --user
