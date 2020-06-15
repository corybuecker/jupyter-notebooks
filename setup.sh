#!/bin/bash

source .venv/bin/activate

pip freeze | xargs pip uninstall -y
pip install -r requirements.txt --upgrade

# Jupyter widgets extension
jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build

# jupyterlab renderer support
jupyter labextension install jupyterlab-plotly --no-build

# FigureWidget support
jupyter labextension install plotlywidget --no-build

# Build extensions (must be done to activate extensions since --no-build is used above)
jupyter lab build --dev-build=True --minimize=False
