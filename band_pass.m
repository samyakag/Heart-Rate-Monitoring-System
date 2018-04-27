function x = band_pass(PPG,sample_rate)

% Bandpass Filter: 0.4 to 3.5Hz
%
    ff = fft(PPG);
    n = 0:1023;
    np = n*2*pi/1024;
    ff(np < 2*pi*0.4/sample_rate | np > 2*pi*(1-0.4/sample_rate)) = 0;
    ff(np > 2*pi*3.5/sample_rate & np < 2*pi*(1-3.5/sample_rate)) = 0;
    PPG1 = ifft(ff);
    x = real(PPG1);
	% disp('Text');
	% order_filter    = 10;
	% fcutlow  = 0.4;
	% fcuthigh = 3.5;
	% [b,a]    = butter(order_filter,[fcutlow,fcuthigh]/(sample_rate/2), 'bandpass');
	% x        = filter(b,a,PPG);
end