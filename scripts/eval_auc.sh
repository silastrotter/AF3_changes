

export LAYERNORM_TYPE=fast_layernorm

N_sample=1
N_step=200
N_cycle=10
seed=101
use_deepspeed_evo_attention=true
input_json_path="/home/fs01/wc648/protenix/examples/eval_2K_screen.csv"
# wget -P /af3-dev/release_model/ https://af3-dev.tos-cn-beijing.volces.com/release_model/model_v1.pt
#load_checkpoint_path="/home/fs01/wc648/protenix/output/protenix_finetune_classifier_2K_screen_2_20250602_080906/checkpoints/799.pt"
load_checkpoint_path="/home/fs01/wc648/protenix/output/protenix_finetune_classifier_diffusion_only_DDP_20250605_025434/checkpoints/199_ema_0.999.pt"
dump_dir="./output"

python3 runner/eval_auc.py \
--classifier true \
--seeds ${seed} \
--load_checkpoint_path ${load_checkpoint_path} \
--dump_dir ${dump_dir} \
--input_json_path ${input_json_path} \
--use_deepspeed_evo_attention ${use_deepspeed_evo_attention} \
--model.N_cycle ${N_cycle} \
--sample_diffusion.N_sample ${N_sample} \
--sample_diffusion.N_step ${N_step} \
--train_classifier_by_inference true