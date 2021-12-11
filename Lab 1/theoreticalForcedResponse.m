function theoreticalForcedResponse(zeta)

% GIVEN INFORMATION

% Mass of Rotating Mass (kg)
m = 4*10^-3;

% Radius of Rotating Mass (m)
e = 30*10^-3;

% Combined mass of motor, disc, unbalanced mass (kg)
M = 248*10^-3;

% Theoretical Equation of Forced Response of Rotational Unbalance
r = linspace(0, 2.5, 1001);
y = @(r) (m*e/M)*r.^2./sqrt((1 - r.^2).^2 + (2*zeta*r).^2);

% GRAPHING
fig = figure;
plot(r, y(r));

% Plotting Asymptote
hold on
asymptote = @(r) m*e/M + 1e-100*r;   % BUG: Figure does not show horizontal plot
plot(r, asymptote(r), 'k--');
hold off

% Title, Label Axes, Sizing
grid on;
xlabel('w/w_n');
ylabel('X (m)');
legend('Location', 'northeast');
legend('Curve of Best Fit');
title('Theoretical Forced Response Graph');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.1, 0.4, 0.4]);

% Resonant Amplitude (m)
theoretical_resonant_amplitude = y(1)