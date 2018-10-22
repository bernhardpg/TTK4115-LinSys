%% With integral effect

[~, index] = max(abs(eigs_controller_i));
min_eig_i = eigs_controller_i(index);
spacing_i = spacing;
eigs_gain_factor_i = eigs_gain_factor;
eigs_estimator_i = 1:spacing_i:(1 + spacing_i*(size(A_se) - 1));
eigs_estimator_i = eigs_estimator_i * min_eig_i * eigs_gain_factor_i;
L = place(A_se', C_se', eigs_estimator_i)';