clear; clc; close all;

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
    
    sampling_rate = 125;                             % 125 Hz  
    window   = 8 * sampling_rate;                    % window length is 8 seconds
    jump     = 2 * sampling_rate;                    % jump size is 2 seconds    
    window_number = (length(sig)-window)/jump + 1;  % total number of windows    
%     figure; plot(PPG_average);
%     figure; plot(x_acceleration);
%     figure; plot(y_acceleration);
%     figure; plot(z_acceleration);
    ppg_filtered = []
    for i = 1 : window_number
        window_segment = (i-1)*jump+1 : (i-1)*jump+window;
    	ppg_filtered(i) = piece_filtering(sig(:,window_segment), BPM, sampling_rate);
    end
    peaks = []
    for i = 1 : window_number
	    %Find peaks and BPM without SPT
		[pks , locs]=findpeaks(Y_clean,f);
		[,index]= max (pks);
		peaks = locs(index) ;
    	if(i > 3)
    		peaks(i) = 0.9*peaks(i) + 0.9*peaks(i-2) + 0.9*peaks(i-1);
	   	end
    end
end    