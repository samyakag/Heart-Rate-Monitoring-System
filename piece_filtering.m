function y = piece_filtering(sig, BPM, sampling_rate)
    x_acceleration = band_pass(sig(3,:),sampling_rate);
    y_acceleration = band_pass(sig(4,:),sampling_rate);
	z_acceleration = band_pass(sig(5,:),sampling_rate);
	PPG_average = .5*(band_pass(sig(1,:),sampling_rate)+band_pass(sig(2,:),sampling_rate)); %averaging both channels	

	samples_filtered = length(BPM);
	filtered_signal = adaptive_filter(PPG_average,x_acceleration,y_acceleration,z_acceleration);
	N = 60 * sampling_rate;
	Y_clean = abs (fft(filtered_signal ,N)).^2;	
end
