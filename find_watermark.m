function find_watermark(audio_filename, new_filename)
%% Load files
[signal, frame_rate] = file_loading(audio_filename);
%% Pre-dither
dimensions = [20, 20];
matrix = break_into_chunks(signal, dimensions);
[U, S, V] = chunks_svd(matrix);
%% Loop de Loop de Loop de Loop
delta = 1;
image = zeros(size(S,1),size(S,2));
d = 1;
for n = 1:size(S,1)
    for m = 1:size(S,2)
        for i = 1:size(S,3)
            for j = 1:size(S,4)
                chunk(i,j) = S(n,m,i,j);
            end
        end
         %% start chunk operations here
         [a, lambdas, e_norm] = find_norm(chunk, delta);
         if mod(a,2)==0
             image(n,m) = 1;
         else
             image(n,m) = 0;
         end
    end
end
%% Post_dither
create_image(image, new_filename)
end