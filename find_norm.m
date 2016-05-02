function [a, lambdas, e_norm] = find_norm(S, delta)
lambdas = diag(S);
e_norm = norm(lambdas);
a = floor(e_norm/delta);
end