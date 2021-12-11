function [theoretical_omega_n] = theoreticalNaturalFrequency

% GIVEN THEORETICAL INFORMATION

% Dimension of aluminium beam (m)
b = 40*10^-3;
h = 3*10^-3;
l = 570*10^-3;

% Density of aluminium (kg/m^3)
rho = 2750;

% Combined mass of motor, disc, unbalanced mass (kg)
M = 248*10^-3;

% Mass of beam (kg)
m_beam = rho*(b*h*l)


% CALCULATING THEORETICAL NATURAL FREQUENCY

% Calculating Theoretical Spring Constant
I = b*h^3/12                % Second Moment of Inertia of Beam Cross-Section
E = 7.1*10^10;              % Young's Modulus
k_eq = 192*E*I/l^3          % Spring Constant Formula is given

% Calculating Theoretical Equivalent Mass
m_eq = M + 13/35*m_beam     % Equivalent Mass Formula is given

% Calculating Theoretical Natural Frequency
theoretical_omega_n = sqrt(k_eq/m_eq)