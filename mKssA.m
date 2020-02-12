function sys = mKssA(A)
% This function creates a state space model with just the A matrix.
B = zeros(length(A),1);
C = zeros(1, length(A));
D = 0;
sys = ss(A, B, C, D);