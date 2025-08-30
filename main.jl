using Random
using Plots

# Parameters
n_steps = 200
n_layers = 3
precision = [1.0, 0.8, 0.5]   # precision at each layer
learning_rate = 0.2

# Initialize states
prediction = zeros(n_layers)
prediction_error = zeros(n_layers)
input_signal = randn(n_steps) # sensory input

# Store history
history_pred = zeros(n_layers, n_steps)
history_err  = zeros(n_layers, n_steps)

for t in 1:n_steps
    # Bottom layer receives sensory input
    sensory_input = input_signal[t]
    prediction_error[1] = precision[1] * (sensory_input - prediction[1])

    # Update prediction at layer 1
    prediction[1] += learning_rate * prediction_error[1]

    # Higher layers
    for l in 2:n_layers
        # Error = (lower layer prediction - current prediction)
        prediction_error[l] = precision[l] * (prediction[l-1] - prediction[l])
        prediction[l] += learning_rate * prediction_error[l]
    end

    # Save history
    history_pred[:, t] .= prediction
    history_err[:, t]  .= prediction_error
end

# Plot results
p1 = plot(history_pred', xlabel="Time", ylabel="Prediction", title="Hierarchical Predictions", label=["Layer1" "Layer2" "Layer3"])
p2 = plot(history_err', xlabel="Time", ylabel="Prediction Error", title="Prediction Errors", linestyle=:dash, label=["PE1" "PE2" "PE3"])

plot(p1, p2, layout=(2,1))
savefig("predictive_coding_results.png")
