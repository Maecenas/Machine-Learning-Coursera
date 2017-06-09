function [J_history, theta] = gradientDescentMulti(X, y, theta, alpha, num_iters)
% function [theta_b, J_history, theta] = gradientDescentMulti(X, y, theta, alpha, num_iters)

%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %

%batch gradient descent
     h = X*theta;
     theta_b = theta - ((alpha/m)*(X'*(h-y)));

%stochastic gradient descent
for iter = 1:num_iters
  A = ( X * theta - y )';
  for j = 1:m
    theta = theta - alpha * ( A(1, j) * X(j, :) )';
  end
end  


    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
