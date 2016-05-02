function S_prime = reverse_norm(lambdas, a_prime, e_norm, delta)
n_prime = delta*a_prime+(delta/2);
new_lambdas = zeros(length(lambdas),1);
for i = 1:length(lambdas)
    new_lambdas(i)= lambdas(i) * (n_prime/e_norm);
    S_prime(i,i) = new_lambdas(i);
end
end