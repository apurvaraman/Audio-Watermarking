function result_matrix = break_into_chunks(signal, dimensions) %dimensions corresponds to the dimensions of the watermark image
across = dimensions(1);
down = dimensions(2);
audio_length = length(signal);
chunk = audio_length/(across*down);
chunk_size = sqrt(chunk);
chunk_size = ceil(chunk_size);
master_matrix = zeros(across, down, chunk_size, chunk_size);
signal_place = 1;
for n = 1:down
    for m = 1:across
        for i = 1:chunk_size
            for j = 1:chunk_size
                master_matrix(n,m,i,j) = signal(signal_place);
                signal_place = signal_place+1;
                if signal_place>audio_length
                    result_matrix=master_matrix;
                    return
                end
            end
        end
        
    end
    
end
result_matrix = master_matrix;
end
