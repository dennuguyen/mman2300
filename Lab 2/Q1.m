function [delta, w_exp] = Q1

% Experimental Results for Angular Speed
delta = [0:7];     % cm
w_exp1 = [0 8.8 19.1 29.2 36.3 43.6 47.0 51.6]; % rpm
w_exp2 = [0 9.5 18.7 26.7 35.5 43.4 49.6 52.2]; % rpm
w_exp3 = [0 8.8 19.0 27.7 35.6 42.2 49.5 52.8]; % rpm

% Get Mean of Experimental Angular Speeds
mean_w_exp = mean([w_exp1; w_exp2; w_exp3]);

% Convert RPM to rad/s
w_exp = mean_w_exp*2*pi/60;
