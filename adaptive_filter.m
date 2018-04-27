function [y] = adaptive_filter(PPG,X,Y,Z)
	temp = zeros(1,length(PPG)) ;
	rlsFilt = dsp.RLSFilter(69 ,'ForgettingFactor', 0.990) ;
	[, err] = rlsFilt(X,PPG);
    temp = temp + err;
	[, err] = rlsFilt(Y,PPG);
	temp = temp + err;
	[, err] = rlsFilt(Z,PPG);
	temp = temp + err;
	y = temp;
end	