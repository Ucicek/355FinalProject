function [time, state, torque_t, torque_e] = simulate(T, muscle_model)
% Runs a simulation of the model and plots results.

% Inputs
% T: total time to simulate (seconds)
% muscle_model: The MuscleModel object (inform the simulation parameters)

% TA length at 110 degrees (optimal length for force generation)

l_opt = 0.6*tibialis_length(1.919862177);

% Finding initial conditions
x1_initial = 1.876; % Value obtained from literature (radians)
norm_ta_initial = (0.6*tibialis_length(x1_initial))/l_opt;

initialCondition = [x1_initial, 0, norm_ta_initial, 0]; % (angle, angular velocity, norm TA muscle length, activation)

f = @(t, x) dynamics(x, muscle_model);
tspan = [0 T];

% Integrate
options = odeset('RelTol', 1e-3, 'AbsTol', 1e-8);
[time, state] = ode45(f, tspan, initialCondition, options);

% % Other variables to be plotted
[torque_t, torque_e] = get_torque_vector(state, muscle_model);

end