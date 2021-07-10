#! /bin/bash
count=`nvidia-smi --query-gpu=name --format=csv,noheader | wc -l`

echo 'start'
for (( c=$count; c>=1; c-- ))
do
      python benchmark_models.py -b 8 -g $c&& &>/dev/null
done
echo 'end'
