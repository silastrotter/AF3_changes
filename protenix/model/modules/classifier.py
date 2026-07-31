import torch
import torch.nn as nn

class ConfidenceClassifier(nn.Module):
    def __init__(
        self,
        ligand_length,
        n_token=506,
        hidden_units=1024,
        output_units=1,
        number_of_chains=2,
        use_intersted_atom_mask=False,
    ):
        super(ConfidenceClassifier, self).__init__()
        self.number_of_chains = number_of_chains
        self.n_token = n_token
        pair_feat_dim = (
            ligand_length * n_token + ligand_length * (n_token - ligand_length)
        ) * 3
        if use_intersted_atom_mask:
            self.input_dim = pair_feat_dim + 4 + self.number_of_chains * 3 + 1
        else:
            self.input_dim = pair_feat_dim + 4 + self.number_of_chains * 3
        self.hidden_units = hidden_units
        self.output_units = output_units

        self.fc1 = nn.Linear(self.input_dim, self.hidden_units)
        self.ln1 = nn.LayerNorm(self.hidden_units)
        self.fc2 = nn.Linear(self.hidden_units, self.hidden_units)
        self.ln2 = nn.LayerNorm(self.hidden_units)
        self.fc3 = nn.Linear(self.hidden_units, self.output_units)
        self.relu = nn.ReLU()

    def forward(self, x):
        x = self.ln1(self.fc1(x))
        x = self.relu(x)
        x = self.ln2(self.fc2(x))
        x = self.relu(x)
        x = self.fc3(x)
        return x


