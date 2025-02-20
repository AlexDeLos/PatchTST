#!/bin/sh
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH -o out/%j.out # STDOUT
#SBATCH -e err/%j.err # STDERR


source /opt/insy/miniconda/3.9/etc/profile.d/conda.sh
conda activate myenv
srun weather.sh