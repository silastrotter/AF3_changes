# AF3 Finetune

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Python 3.10+](https://img.shields.io/badge/python-3.10+-blue.svg)](https://www.python.org/downloads/)
[![PyTorch](https://img.shields.io/badge/PyTorch-2.1+-ee4c2c.svg)](https://pytorch.org/)

This repository provides an optimized pipeline for fine-tuning AlphaFold 3 (AF3) architectures on custom biomolecular datasets. Built upon ByteDance's open-source [Protenix](https://github.com/bytedance/Protenix) implementation, this standalone toolkit is designed to adapt AF3 for specialized structural biology tasks, such as predicting enzyme-substrate interactions, modeling non-canonical protein recognition, and exploring specific protein-ligand interfaces.

## 🌟 Key Features
- **Diffusion-based Finetuning:** Leverage the AF3 diffusion module to refine complex structure predictions.
- **Custom Data Pipelines:** Streamlined scripts to process mmCIF/PDB files and MSAs for custom training regimens.
- **All-Atom Support:** Handles proteins, DNA, RNA, and small molecules (ligands).
- **Optimized Configurations:** Pre-set YAML configs tailored for low-learning-rate finetuning and confidence score extraction.

---

## ⚙️ Installation

To get started, clone the repository and set up the environment:

```bash
# Clone the repository
git clone [https://github.com/wenzhe-chen/AF3_finetune.git](https://github.com/wenzhe-chen/AF3_finetune.git)
cd AF3_finetune

# Create environment (Mamba/Conda recommended)
conda create -n protenix python=3.10 -y
conda activate protenix

# Install dependencies
pip install -r requirements.txt
