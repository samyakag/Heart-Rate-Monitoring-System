function temp = adaptive_filter(PPG,X,Y,Z)
	rlsFilt=dsp.RLSFilter(13, ’ForgettingFactor’ ,0.99,...
		'InitialInverseCovariance', p0);
	[, err] = step(rlsFilt,X,PPG');
    temp = temp + err;
	[, err] = step(rlsFilt,Y,PPG');
	temp = temp + err;
	[, err] = step(rlsFilt,Z,PPG');
	temp = temp + err;
end