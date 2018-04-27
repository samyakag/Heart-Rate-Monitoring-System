clear all; clc; close all;

addpath(genpath('Data'));
% Test Dataset IDs
ID = [ "DATA_01_TYPE01", "DATA_02_TYPE02", "DATA_03_TYPE02", "DATA_04_TYPE02", ...
       "DATA_05_TYPE02", "DATA_06_TYPE02", "DATA_07_TYPE02", "DATA_08_TYPE02",...
       "DATA_09_TYPE02", "DATA_10_TYPE02", "DATA_11_TYPE02", "DATA_12_TYPE02"]; 

for itr = 1:1
	ppg_data = '.mat';
	ground_data = '_BPMtrace.mat';
    load(strcat(ID(itr), ppg_data));
    load(strcat(ID(itr), ground_data));
    sig = sig(2:end,:);
    % disp('HEYyasdsa'); 
    sampling_rate = 125;							% 125 Hz
    N = 60 * sampling_rate;                               
	f = 60*sampling_rate * [ 0 : 1 :N- 1 ]./N;
    window_length   = 8 * sampling_rate;                    % window length is 8 seconds
    jump     = 2 * sampling_rate;
    % disp('Ysad');                    % jump size is 2 seconds    
    window_number = (length(sig)-window_length)/jump + 1;  % total number of windows    
%     figure; plot(PPG_average);
%     figure; plot(x_acceleration);
%     figure; plot(y_acceleration);
%     figure; plot(z_acceleration);
    peaks_all = [];
    for i = 1 : window_number
    	last_value = (i-1) * jump + window_length;
    	if ((i-1)*jump+window_length > length(sig(2,:)))
    		last_value = length(sig(2,:));
    	end
        window_segment = round((i-1)*jump+1 : last_value);
    	peaks_all(i) = piece_filtering(sig(:,window_segment), sampling_rate, peaks_all);
    end
    % peaks = []
%     for i = 1 : window_number
% % 	    Find peaks and BPM without SPT
% 		[pks , locs]=findpeaks(peaks_all(i),f);
% 		[,index]= max (pks);
% 		peaks = locs(index) ;
%     	if(i > 3)
%     		peaks(i) = 0.9*peaks(i) + 0.05*peaks(i-2) + 0.05*peaks(i-1);
% 	   	end
%     end
end    