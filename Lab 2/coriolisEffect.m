% coriolisEffect.m
% LAB 2: CORIOLIS EFFECT
% 
% CALLS:
% Q1.m
% Q3.m
% Q4.m
% Q5.m
% Q6.m

format compact

% N = Nozzle
% W = Water Particle
fprintf("\n")

fprintf("Q1\n\n")
[delta, w_exp] = Q1;

fprintf("Q3\n\n")
[v_WrelN] = Q3;

fprintf("Q4\n\n")
[theta, t, w_thr] = Q4(delta, v_WrelN);

fprintf("Q5\n\n")
Q5(delta, w_exp, w_thr);

fprintf("Q6\n\n")
[percentage_error] = Q6(w_exp, w_thr);

% Relevant Answers to 4 Significant Figures
delta = vpa(delta, 4), fprintf("\n")
w_exp = vpa(w_exp, 4), fprintf("\n")
v_WrelN = vpa(v_WrelN, 4), fprintf("\n")
theta = vpa(theta, 4), fprintf("\n")
t = vpa(t, 4), fprintf("\n")
w_thr = vpa(w_thr, 4), fprintf("\n")
percentage_error = vpa(percentage_error, 2), fprintf("\n")