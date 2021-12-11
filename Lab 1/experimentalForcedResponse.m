function experimentalForcedResponse(f, X, experimental_omega_n)

% Standardising Data
omega = 2*pi*f
X = X*10^-3;

% Frequency Ratio
r = omega./experimental_omega_n

% PLOTTING EXPERIMENTAL DATA
fig = figure;
plot(r, X, 'o', 'MarkerEdgeColor', 'black');
axis([0 2.5 0 0.5]);

% GRAPHING CURVE OF BEST FIT
hold on

% Getting the Coefficients to (m*e/M)*r.^2./(sqrt((1 - r.^2).^2 + (2*zeta*r).^2);
r_guess = linspace(0, 2, length(X));
a = lsqcurvefit(@(a, r) a(1)*r.^2./sqrt((1 - r.^2).^2 + (2*a(2)*r).^2), r_guess, r, X);
% a(1) = m*e/M, a(2) = zeta

% Fitting to the Data Set
x = linspace(0, 2.2, length(X));
y = @(r) a(1)*r.^2./sqrt((1 - r.^2).^2 + (2*a(2)*r).^2);
log_fit_type = fittype('a1*r.^2/sqrt((1 - r.^2).^2 + (2*a2*r).^2)', ...
    'dependent', {'y'}, 'independent', {'r'}, 'coefficients', {'a1', 'a2'});
best_fit = fit(x', X', log_fit_type, 'StartPoint', [0, 0]);
plot(best_fit, 'r');
hold off

% Plotting Asymptote
hold on
asymptote = @(x) a(2) + 1e-100*x;   % BUG: Figure does not show horizontal plot
plot(x, abs(asymptote(x)), 'k--');   % Unexpected plotting behaviour requires abs()
hold off

% Title, Label Axes, Sizing
grid on;
xlabel('w/w_n');
ylabel('X (V)');
legend('Location', 'northeast');
legend('Data Point', 'Curve of Best Fit');
title('Experimental Forced Response Graph');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.1, 0.4, 0.4]);

% Resonant Amplitude (m)
experimental_resonant_amplitude = y(1)