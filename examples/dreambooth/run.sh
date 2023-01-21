export MODEL_NAME="CompVis/stable-diffusion-v1-4"
export CLASS_DIR="path-to-class-images"
export CLASS_PROMPT="class prompt"
export OUTPUT_DIR="path-to-save-model"

accelerate launch train_dreambooth.py \
  --pretrained_model_name_or_path=$MODEL_NAME  \
  --instance_data_dirs_file="instances_dirs.txt" \
  --class_data_dir=$CLASS_DIR \
  --output_dir=$OUTPUT_DIR \
  --with_prior_preservation --prior_loss_weight=1.0 \
  --instance_prompts_file="instances_prompts.txt" \
  --class_prompt=CLASS_PROMPT \
  --resolution=512 \
  --train_batch_size=1 \
  --gradient_accumulation_steps=2 --gradient_checkpointing \
  --use_8bit_adam \
  --learning_rate=5e-6 \
  --lr_scheduler="constant" \
  --lr_warmup_steps=0 \
  --num_class_images=500 \
  --max_train_steps=1600 \
  --push_to_hub \
  --hub_token=HUB_SECRET_TOKEN