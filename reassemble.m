function result_signal = reassemble(matrix) %dimensions corresponds to the dimensions of the watermark image
down = size(matrix,1);
across = size(matrix,2);
chunk_down = size(matrix,3);
chunk_across = size(matrix,4);
signal_place = 1;
for n = 1:down
    for m = 1:across
        for i = 1:chunk_down
            for j = 1:chunk_across
                signal(signal_place) = matrix(n,m,i,j);
                signal_place = signal_place+1;
      
            end
        end
        
    end
    
end
result_signal = signal;
end
