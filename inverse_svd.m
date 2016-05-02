function matrix = inverse_svd(transform, diag, inverse_transform)
down = size(diag, 1);
across = size(diag, 2);
U = zeros(size(diag,3), size(diag,4));
S = zeros(size(diag,3), size(diag,4));
V = zeros(size(diag,3), size(diag,4));
matrix = zeros(across, down, size(diag,3), size(diag,4));
for i = 1:down
    for j = 1:across
         for n = 1:size(diag,3)
            for m = 1:size(diag,4)
                U(n,m) = transform(i,j,n,m);
                S(n,m) = diag(i,j,n,m);
                V(n,m) = inverse_transform(i,j,m,n);
            end
         end
         chunk = U*S*V;
         matrix(i,j,:,:) = chunk;
    end
end
return    
end