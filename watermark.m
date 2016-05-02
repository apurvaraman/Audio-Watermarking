function watermark(audio_filename, image_filename, new_filename, d)
%% Load files
[signal, frame_rate] = file_loading(audio_filename);
image = image_load(image_filename);
dimensions = size(image);
%% Pre-dither
matrix = break_into_chunks(signal, dimensions);
[U, S, V] = chunks_svd(matrix);
%% Loop de Loop de Loop de Loop
delta = 1;
S_prime = zeros(dimensions(1),dimensions(2),size(S,3),size(S,4));
%d = 1;
for n = 1:dimensions(1)
    for m = 1:dimensions(2)
        for i = 1:size(S,3)
            for j = 1:size(S,4)
                chunk(i,j) = S(n,m,i,j);
            end
        end
         %% start chunk operations here
         [a, lambdas, e_norm] = find_norm(chunk, delta);
         if image(n,m)==1
             a_prime = a+d - (mod(a,2*d));
         else
             a_prime = a+d - (mod(a+d,2*d));
         end
         %take in a prime and lambdas, find e norm prime, and output new lambdas
         S_prime_chunk = reverse_norm(lambdas, a_prime, e_norm, delta);
         %put modified chunk back in new matrix (ugh more loops)
         for i = 1:size(chunk,1)
            for j = 1:size(chunk,2)
                S_prime(n,m,i,j) = S_prime_chunk(i,j);
            end
         end
    end
end
%% Post_dither
new_matrix = inverse_svd(U,S_prime,V);
signal = reassemble(new_matrix);
audiowrite(new_filename,signal, frame_rate)
end