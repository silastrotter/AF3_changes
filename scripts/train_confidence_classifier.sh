#!/bin/bash

# Example feature and label paths (replace with your actual .pt files)
feat_paths=(
    "/home/fs01/wc648/protenix/output/feats_2K_screen_0.pt"
    "/home/fs01/wc648/protenix/output/feats_2K_screen_1.pt"
    "/home/fs01/wc648/protenix/output/feats_2K_screen_2.pt"
    "/home/fs01/wc648/protenix/output/feats_2K_screen_3.pt"
    "/home/fs01/wc648/protenix/output/feats_2K_screen_4.pt"
    "/home/fs01/wc648/protenix/output/feats_2K_screen_5.pt"
    # Add more as needed
)
label_paths=(
    "/home/fs01/wc648/protenix/output/labels_2K_screen_0.pt"
    "/home/fs01/wc648/protenix/output/labels_2K_screen_1.pt"
    "/home/fs01/wc648/protenix/output/labels_2K_screen_2.pt"
    "/home/fs01/wc648/protenix/output/labels_2K_screen_3.pt"
    "/home/fs01/wc648/protenix/output/labels_2K_screen_4.pt"
    "/home/fs01/wc648/protenix/output/labels_2K_screen_5.pt"
    # Add more as needed
)

# Convert arrays to space-separated strings
feat_paths_str="${feat_paths[@]}"
label_paths_str="${label_paths[@]}"

ligand_length=8  # Set this to your actual ligand length

python3 runner/train_MLP_classifier.py \
    --run_name 03182026_MLP_classifier_2K_screen_Repeat \
    --feat_path $feat_paths_str \
    --label_path $label_paths_str \
    --ligand_length $ligand_length \
    --batch_size 1024 \
    --epochs 10000 \
    --lr 0.0005 \
    --output ./output/03182026_MLP_classifier_2K_screen_Repeat.pt \
    --number_of_chains 2 \
    --patience 1000 \

