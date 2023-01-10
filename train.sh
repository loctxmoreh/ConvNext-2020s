#!/bin/bash

if [[ $HOSTNAME =~ ^haca100[0-9] ]]; then
    # on A100 machines,
    # somehow tensorflow cannot find the right cuda & cudnn lib to load at runtime,
    # so set some env vars to correct it
    export PATH=/usr/local/cuda-11.2/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/usr/local/cuda-11.2/lib64:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=/usr/local/cuda-11.2/include:$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-11.2/extras/CUPTI/lib64
fi

# prepare a mini cats-and-dogs dataset
if [[ ! -d data ]]; then
    curl https://storage.googleapis.com/mledu-datasets/cats_and_dogs_filtered.zip \
        --output dataset.zip
    unzip dataset.zip
    mv cats_and_dogs_filtered data
    rm dataset.zip
fi

/usr/bin/env python3 train.py \
        --train-folder ./data/train \
        --valid-folder ./data/validation \
        --num-classes 2 \
        --image-size 224 \
        --lr 0.0001 \
        --batch-size 32 \
        --model base \
        --epochs 2
