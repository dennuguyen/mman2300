function [percentage_error] = Q6(w_exp, w_thr)

abs_error = abs(w_exp - w_thr);
percentage_error = 100.*abs_error./w_thr;