function spectral_radius = mKspectral_radius(A)
% A = sym(A);
spectral_radius = max(eig(A'*A));