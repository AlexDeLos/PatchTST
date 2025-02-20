#!/bin/sh
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH -o out/%j.out # STDOUT
#SBATCH -e err/%j.err # STDERR


source /opt/insy/miniconda/3.9/etc/profile.d/conda.sh
conda activate myenv
seq_len=336
model_name=PatchTST

root_path_name=./dataset/
data_path_name=weather.csv
model_id_name=weather
data_name=custom

random_seed=2021
pred_len=96
srun python -u run_longExp.py \
    --random_seed 2021 \
    --is_training 1 \
    --root_path ./dataset/ \
    --data_path weather.csv \
    --model_id weather_336_96 \
    --model PatchTST \
    --data custom \
    --features M \
    --seq_len 336 \
    --pred_len 96 \
    --enc_in 21 \
    --e_layers 3 \
    --n_heads 16 \
    --d_model 128 \
    --d_ff 256 \
    --dropout 0.2\
    --fc_dropout 0.2\
    --head_dropout 0\
    --patch_len 16\
    --stride 8\
    --des 'Exp' \
    --train_epochs 100\
    --patience 20\
    --itr 1 --batch_size 128 --learning_rate 0.0001 >logs/LongForecasting/PatchTST_weather_336_96.log 