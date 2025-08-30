Predictive Coding Project:

This project implements a simple Hierarchical Predictive Coding simulation in Julia.

 Concept:
Predictive Coding is a modern theory in cognitive neuroscience that suggests:
- The brain continuously generates predictions about sensory input.
- Lower layers provide sensory data, while higher layers provide predictions.
- The difference between prediction and reality is the prediction error.
- Each layer updates its predictions to minimize these errors.

In psychiatric conditions (e.g., schizophrenia), the weighting of prediction errors may be disrupted.

How It Works:
- Three hierarchical layers are simulated.
- Each layer updates its prediction based on the error from the layer below.
- A precision parameter controls how strongly each error influences updates.
- The simulation runs over time and tracks both predictions and prediction errors.

Output:
The code produces two plots:
1. Predictions at each layer over time.
2. Prediction errors at each layer over time.


Run:
1. Install [Julia](https://julialang.org/downloads/).
2. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/PredictiveCodingProject.git
   cd PredictiveCodingProject
