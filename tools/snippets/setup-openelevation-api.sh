#!/bin/bash
#

ROOT=/mnt/Store-unsafe/Projects/open-elevation

mkdir -p $ROOT
cd $ROOT

docker run -t -i -v $(pwd)/data:/code/data openelevation/open-elevation /code/create-dataset.sh

