function [average_zeta, omega_d, average_omega_n] = freeResponse(n, x_i, x_f, T_d)

% CALCULATING EXPERIMENTAL UNDAMPED NATURAL FREQUENCY OF FREE RESPONSE

% Standardising Units
x_i = x_i.*10^-3;
x_f = x_f.*10^-3;
T_d = T_d.*10^-3;

% Calculating Experimental Logarithmic Decrement
delta = 1/n*log(x_i./x_f)

% Calculating Experimental Damping Ratio
zeta = delta./sqrt(4*pi^2 + delta.^2)
average_zeta = mean(zeta);

% Calculating Experimental Damped Natural Frequency
omega_d = 2*pi./(T_d)

% Calculating Experimental Undamped Natural Frequency
omega_n = omega_d./sqrt(1 - zeta.^2)
average_omega_n = mean(omega_n) % Requires Average

