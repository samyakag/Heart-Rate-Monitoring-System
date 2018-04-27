function [y] = adaptive_filter(PPG,X,Y,Z)
	temp = zeros(1,1000);
    temp;
	P0  = 10*eye(11,11);
	rlsFilt = dsp.RLSFilter(11,'InitialInverseCovariance',P0);
     % disp('HEYYY');
%	rlsFilt= dsp.RLSFilter(11, ’ForgettingFactor’ ,0.99,'InitialInverseCovariance', p0);
	[, err] = rlsFilt(X,PPG);
    temp = temp + err;
	[, err] = rlsFilt(Y,PPG);
	temp = temp + err;
	[, err] = rlsFilt(Z,PPG);
	temp = temp + err;
	y = temp;
end	