function Q5(delta, w_exp, w_thr)

figure(1)

% Plotting Experimental Values
plot(delta, w_exp, '+r');

% Plotting Theoretical Values
hold on
plot(delta, w_thr, '+b');
hold off

% By Lagrange Polynomial Interpolation to approximate w vs delta
L = zeros(length(delta), length(delta));
for m = 1:length(delta)
    P = 1;
    for n = 1:length(delta)
        if m ~= n
            P = conv(P, poly(delta(n)))/(delta(m) - delta(n));
        end
    end
    L(m,:) = P;
end

% Experimental Curve of Best Fit
hold on
y1 = DocPolynom(w_exp*L);
plot(delta, y1(delta), 'r')
hold off

% Theoretical Curve of Best Fit
hold on
y2 = DocPolynom(w_thr*L);
plot(delta, y2(delta), 'b')
hold off

% Decorating Figure
grid on;
xlabel("Deflection of Water Jet (cm)");
ylabel("Angular Speed of Nozzle (rad/s)");
title("Angular Speed vs Deflection Graph");
legend('Experimental Data', 'Theoretical Data', ...
    'Experimental Curve of Best Fit', 'Theoretical Curve of Best Fit');
legend('Location', 'southeast');