# Protenix - AF3 Finetuning Branch

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Python 3.10+](https://img.shields.io/badge/python-3.10+-blue.svg)](https://www.python.org/downloads/)
[![PyTorch](https://img.shields.io/badge/PyTorch-2.1+-ee4c2c.svg)](https://pytorch.org/)

This branch of **Protenix** is dedicated to the finetuning of AlphaFold 3 (AF3) architectures. Protenix is an open-source project by ByteDance that aims to reproduce the high-accuracy biomolecular structure prediction capabilities of AlphaFold 3.

This specific branch contains modified scripts and configurations optimized for downstream adaptation (finetuning) on custom structural datasets, such as specific protein-ligand complexes, nucleic acid interactions, or mutated sequences.

## 🌟 Key Features
- **Diffusion-based Finetuning:** Leverage the AF3 diffusion module for refined structure prediction.
- **Custom Data Pipelines:** Scripts to process mmCIF/PDB files and MSAs for training.
- **All-Atom Support:** Handles proteins, DNA, RNA, and small molecules (ligands).
- **Optimized Configurations:** Pre-set YAML configs for low-learning-rate finetuning.

---

## ⚙️ Installation

To get started, clone this specific branch and set up the environment:

```bash
# Clone the repository
git clone [https://github.com/wenzhe-chen/Protenix.git](https://github.com/wenzhe-chen/Protenix.git)
cd Protenix

# Switch to the finetuning branch
git checkout AF3_finetune

# Create environment (Mamba/Conda recommended)
conda create -n protenix python=3.10 -y
conda activate protenix

# Install dependencies
pip install -r requirements.txt
