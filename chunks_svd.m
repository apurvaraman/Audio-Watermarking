function [transform, diagonal, inverse_transform] = chunks_svd(input_matrix)
down = size(input_matrix, 1);
across = size(input_matrix, 2);
for i = 1:down
    for j = 1:across
%         chunk = input_matrix(i,j,:,:);
%         size(chunk)
        for n = 1:size(input_matrix,3)
            for m = 1:size(input_matrix,4)
                new_chunk(n,m) = input_matrix(i,j,n,m);
            end
        end
        size(new_chunk);
        [U, S, V] = svd(new_chunk);
        transform(i,j,:,:) = U;
        diagonal(i,j,:,:) = S;
        inverse_transform(i,j,:,:) = V;
    end
end
return    
end