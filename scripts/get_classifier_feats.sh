

export LAYERNORM_TYPE=fast_layernorm

N_sample=1
N_step=200
N_cycle=10
seed=101
use_deepspeed_evo_attention=true

# Map SLURM_ARRAY_TASK_ID to a specific input_json_path
# Usage: . train_classifier_only.sh $SLURM_ARRAY_TASK_ID
# Define your input files here, one per array task
input_json_paths=(
    "/home/fs01/wc648/protenix/examples/2K_screen_0.csv"
    "/home/fs01/wc648/protenix/examples/2K_screen_1.csv"
    "/home/fs01/wc648/protenix/examples/2K_screen_2.csv"
    "/home/fs01/wc648/protenix/examples/2K_screen_3.csv"
    "/home/fs01/wc648/protenix/examples/2K_screen_4.csv"
    "/home/fs01/wc648/protenix/examples/2K_screen_5.csv"
)

# Get the array task ID from the first argument (default to 0 if not set)
TASK_ID=${1:-0}
input_json_path="${input_json_paths[$TASK_ID]}"

# wget -P /af3-dev/release_model/ https://af3-dev.tos-cn-beijing.volces.com/release_model/model_v1.pt
load_checkpoint_path="/home/fs01/wc648/protenix/af3-dev/release_model/model_v1.pt"
dump_dir="./output"

python3 /home/fs01/wc648/protenix/runner/get_classifier_feats.py \
--seeds ${seed} \
--load_checkpoint_path ${load_checkpoint_path} \
--dump_dir ${dump_dir} \
--input_json_path ${input_json_path} \
--use_deepspeed_evo_attention ${use_deepspeed_evo_attention} \
--model.N_cycle ${N_cycle} \
--sample_diffusion.N_sample ${N_sample} \
--sample_diffusion.N_step ${N_step} \
--train_classifier_by_inference true \
--model.confidence_classifier.ligand_length 9 \
--model.confidence_classifier.number_of_chains 3 \
--data.train_sets classifier_table \
