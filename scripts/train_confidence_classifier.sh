#!/bin/bash

# Example feature and label paths (replace with your actual .pt files)
# can we make this a one step thing instead of replace everywhere? low priority
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

ligand_length=9  # Set this to your actual ligand length
n_token=825      # Total token count (receptor + ligand)

python3 /home/fs01/wc648/protenix/runner/train_MLP_classifier.py \
    --run_name 07162026_MLP_classifier_FTase \
    --feat_path $feat_paths_str \
    --label_path $label_paths_str \
    --ligand_length $ligand_length \
    --n_token $n_token \
    --batch_size 1024 \
    --epochs 10000 \
    --lr 0.0005 \
    --output ./output/07162026_MLP_classifier_FTase.pt \
    --number_of_chains 3 \
    --patience 1000 \



