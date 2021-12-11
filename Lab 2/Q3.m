function  [v_WrelN] = Q3

% Water Flow
Q = 0.35*10^(-3)/60;    % m^3/s

% Area of Nozzle
A = pi*(10^-3)^2;       % m^2

% Velocity of Water Jet Relative to Nozzle
v_WrelN = Q/A;