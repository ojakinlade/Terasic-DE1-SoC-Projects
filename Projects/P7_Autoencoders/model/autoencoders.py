import torch
import torch.nn as nn

# Define the autoencoder
class Autoencoder(nn.Module):
    def __init__(self):
        super().__init__()
        self.encoder = nn.Linear(4, 2, bias=False)  # 4 inputs -> 2 hidden
        self.decoder = nn.Linear(2, 4, bias=False)  # 2 hidden -> 4 outputs

    def forward(self, x):
        x = torch.relu(self.encoder(x))  # Simple activation
        x = torch.relu(self.decoder(x))
        return x

# Create model
model = Autoencoder()

# Sample data (binary patterns you care about)
data = torch.tensor([[1,0,1,0], [0,1,0,1], [1,1,1,1], [0,0,0,0]], dtype=torch.float32)

# Training setup
optimizer = torch.optim.SGD(model.parameters(), lr=0.1)
loss_fn = nn.MSELoss()

# Train
for epoch in range(1000):
    optimizer.zero_grad()
    output = model(data)
    loss = loss_fn(output, data)
    loss.backward()
    optimizer.step()
    if epoch % 100 == 0:
        print(f"Epoch {epoch}, Loss: {loss.item()}")

# Extract weights
enc_weights = model.encoder.weight.data
dec_weights = model.decoder.weight.data
print("Encoder Weights (4x2):\n", enc_weights)
print("Decoder Weights (2x4):\n", dec_weights)