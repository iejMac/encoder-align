#!/bin/bash

torchrun --nproc_per_node 8 main.py \
        --train-data "pipe:aws s3 cp s3://s-datasets/laion5b/laion2B-data/{000000..231348}.tar -" \
        --train-num-samples 2000000000 \
        --val-data "pipe:aws s3 cp s3://s-datasets/laion5b/laion2B-data/{231349..231349}.tar -" \
        --val-num-samples 10000 \
        --imagenet-val "/fsx/rom1504/imagenetval/imagenetvalv1" \
        --dataset-type "webdataset" \
        --batch-size 256 \
        --lr 1e-4 \
        --beta1 0.9 \
        --beta2 0.98 \
        --eps 1e-6 \
        --wd 0.0 \
        --workers 6 \
        --epochs 1 \
        --zeroshot-frequency 1000 \
        --val-frequency 100 \
        --name "H 256 bs 1e-4 lr long run" \
