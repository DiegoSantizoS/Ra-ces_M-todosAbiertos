clc; clear; close all;

% Modified Newton-Raphson Method for f(x) = x^3 - 5x^2 + 7x - 3 = 0 (multiple root)

% Define the function f(x) and its derivative f'(x)
f = @(x) x^3 - 5*x^2 + 7*x - 3;          % f(x) = x^3 - 5x^2 + 7*x - 3
df = @(x) 3*x^2 - 10*x + 7;              % f'(x) = 3x^2 - 10*x + 7

% Initial guess
x0 = 0.5;           % Starting point for the iteration

% Tolerance (desired precision)
tol = 1e-6;       % Stop when the approximate relative error is less than 1e-6

% Maximum number of iterations
max_iter = 100;   % To prevent infinite loops

% Initialize variables
x = x0;           % Current value of x
iter = 0;         % Iteration counter
error_approx = 100; % Initialize approximate relative error (start with 100%)

% Display table header
fprintf('Iteration\t x_i\t\t f(x_i)\t\t f''(x_i)\t x_{i+1}\t\t Approx. Relative Error (%%)\n');
fprintf('----------------------------------------------------------------------------------------\n');

% Modified Newton-Raphson iteration loop
while error_approx > tol && iter < max_iter
    % Evaluate f(x_i) and f'(x_i)
    fx = f(x);
    dfx = df(x);
    
    % Check if the derivative is zero to avoid division by zero
    if dfx == 0
        fprintf('Derivative is zero. The method cannot proceed.\n');
        break;
    end
    
    % Compute the next approximation: x_{i+1} = x_i - m * f(x_i) / f'(x_i)
    % Here, m is the multiplicity of the root. Assuming m = 2 for a double root.
    m = 2;
    x_new = x - m * (fx / dfx);
    
    % Calculate the approximate relative error
    error_approx = abs((x_new - x) / x_new) * 100;
    
    % Display the current iteration results
    fprintf('%d\t\t %.6f\t %.6f\t %.6f\t %.6f\t %.6f\n', iter, x, fx, dfx, x_new, error_approx);
    
    % Update x for the next iteration
    x = x_new;
    
    % Increment the iteration counter
    iter = + 1;
end

% Display the final result
fprintf('\nApproximate root: %.6f\n', x);
fprintf('Iterations: %d\n', iter);
