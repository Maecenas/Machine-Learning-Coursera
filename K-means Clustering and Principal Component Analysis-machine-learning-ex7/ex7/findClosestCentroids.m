function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% Note:
% For distances in Octave
% sqrt(sum(C1-C2).^2))
% V = C1-C2; sqrt(V * V');
% norm(C1-C2)

% Solution 1-
Ones = ones(K,1);
for i = 1:length(idx)
  T = centroids.- Ones * X(i, :);
  dist = diag(T*T');  % try pdist2 in Matlab
  [~, idx(i)] = min(dist);
end

% Solution 2-
%for i = 1:length(idx)
%  T = [];
%  for j = 1:K
%    T = [T; X(i, :)];
%  end
%  [~, idx(i)] = min(sum((T-centroids).^2, 2));
%end

% Solution 3-
%for i = 1:length(idx)
%  for j = 1:K
%    T = X(i, :) - centroids(j, :);
%    dist(i, j) = T * T';
%  end
%end
%[~, idx] = min(dist,[],2);

% =============================================================

end

