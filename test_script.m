[test_signal, delta] = file_loading('toms_diner.wav');
% for n = 1:18
%     test_signal(n) = n;
% end
test_dimension = [20, 20];
matrix = break_into_chunks(test_signal, test_dimension);
[U, S, V] = chunks_svd(matrix);
new_matrix = inverse_svd(U,S,V);
signal = reassemble(new_matrix);
audiowrite('toms_diner_new.wav',signal, delta)