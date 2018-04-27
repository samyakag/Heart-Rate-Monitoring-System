function [peakY,peakX] = fft_helper(signal,sampling_rate)
	Y = fft(signal);
	L = length(signal);
	P2 = abs(Y/L);
	P1 = P2(1:L/2+1);
	P1(2:end-1) = 2*P1(2:end-1);
	f = sampling_rate*(0:(L/2))/L;
	[peakY, peakX] = findpeaks(P1(1:L/2), 'sortstr', 'descend');
	% [peakY,peakX] = findpeaks(p1(1:L/2),f,'MinPeakHeight',4000);
	% figure ;plot(f,P1);
end