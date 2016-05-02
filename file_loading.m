function [res_signal, res_delta] = file_loading(filename)
[signal, delta] = audioread(filename); %read file. file has delta samples per second
left_signal=signal(:,1);
%right_signal=signal(:,2);
%soundsc(road,fs)
res_signal = left_signal;
res_delta = delta;
end