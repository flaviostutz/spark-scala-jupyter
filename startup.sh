#!/bin/bash

echo "Starting Jupyter Notebook..."

export SPARK_HOME=/spark/
export SPARK_OPTS="--master=$SPARK_MASTER"

/usr/bin/jupyter-notebook "$@" --ip 0.0.0.0 \
          --no-browser \
          --allow-root \
          --NotebookApp.allow_password_change=False \
          --NotebookApp.token="$JUPYTER_TOKEN" \
          --NotebookApp.password='' \
          --NotebookApp.notebook_dir='/notebooks'

