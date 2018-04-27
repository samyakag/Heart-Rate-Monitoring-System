function PPG1 = band_pass(PPG,sample_rate)

%Bandpass Filter: 0.4 to 3.5Hz
%
    ff = fft(PPG);
    n = 0:1023;
    np = n*2*pi/1024;
    ff(np < 2*pi*0.4/sample_rate | np > 2*pi*(1-0.4/sample_rate)) = 0;
    ff(np > 2*pi*3.5/sample_rate & np < 2*pi*(1-3.5/sample_rate)) = 0;
    PPG1 = ifft(ff);
    PPG1 = real(PPG1);
end