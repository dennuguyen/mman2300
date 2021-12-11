function [theta, t, w_thr] = Q4(delta, v_WrelN)

% Unknowns to Solve
theta = sym('theta', [1 8]);
t = sym('t', [1 8]);
w = sym('w', [1 8]);

% Radius of Disc
R = 134*10^-3;  % m

% Standardise Units
delta = delta*10^-2; % m

% Equation 1
eqn1 = delta.*cos(theta) == R.*theta;

% Solving for theta
theta = struct2array(vpasolve(eqn1, theta));

% Equation 2
eqn2 = R + delta.*sin(theta) == v_WrelN.*t;

% Solving for t
t = struct2array(vpasolve(eqn2, t));

% Equation 3
eqn3 = w == theta./t;

% Solving for w
w_thr = double(struct2array(vpasolve(eqn3, w)));