function x = fft_helper(signal,sampling_rate)
	Y = fft(signal);
	L = length(signal);
	P2 = abs(Y/L);
	P1 = P2(1:L/2+1);
	P1(2:end-1) = 2*P1(2:end-1);
	f = sampling_rate*(0:(L/2))/L;
	figure ;plot(f,P1);
end