% rotatingMassUnbalance.m
% LAB 1: ROTATING MASS UNBALANCE
% 
% CALLS:
% theoreticalNaturalFrequency.m
% freeResponse.m
% experimentalForcedResponse.m
% theoreticalForcedResponse.m

format compact

% Getting the Theoretical Undamped Natural Frequency
fprintf('\nTHEORETICAL UNDAMPED NATURAL FREQUENCY\n')
[theoretical_omega_n] = theoreticalNaturalFrequency;

% Experimental Observation of Free Response of 1 Cycle
cycles1_x_1 = [136 121 116 97 107 61.1];
cycles1_x_2 = [126 114 109 90.3 99.5 57];
cycles1_T_d = [48 48 48 48.4 48.4 48.5];
fprintf('\nFREE RESPONSE OF 1 CYCLE\n')
[exp1_zeta, exp1_omega_d, exp1_omega_n] = freeResponse(1, cycles1_x_1, ...
    cycles1_x_2, cycles1_T_d);

% Experimental Observation of Free Response of 5 Cycles
cycles5_x_1 = [226 271 63.6 62.8 70.3 59.5];
cycles5_x_5 = [177 224 52 51.1 58.6 47.0];
cycles5_T_d = [48 48 48.5 48.25 48.25 48.25];
fprintf('\nFREE RESPONSE OF 5 CYCLES\n')
[exp5_zeta, exp5_omega_n, exp5_omega_d] = freeResponse(5, cycles5_x_1, ...
    cycles5_x_5, cycles5_T_d);

% Experimental Observation of Forced Response
f = [14.00 15.28 16.57 17.46 17.93 18.33 18.57 19.69 26.62 33.30 39.05 42.96 47.04];
X = [26 37 48 66 79 93 107 219 69 47 40 37 35];
fprintf('\nEXPERIMENTAL FORCED RESPONSE\n')
experimentalForcedResponse(f, X, exp1_omega_n);

fprintf('\nTHEORETICAL FORCED RESPONSE\n')
theoreticalForcedResponse(exp1_zeta);