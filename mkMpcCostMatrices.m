function [Omega, Psi] = mkMpcCostMatrices(Q,R,P,N,n)
% For reference, see slide 39 of lectures 1 and 2 of the MPC course 5LMB0
% at the TU/e.

%% First, check whether the matrices are of the correct size.
[rowsQ, colsQ] = size(Q);
[rowsR, colsR] = size(R);
[rowsP, colsP] = size(P);

if N < 0
    error('N must be a positive integer')
end
if rowsQ ~= n || colsQ ~= n
    error('Q is not an nxn matrix')
end
if rowsR ~= colsR
    error('R is not a square matrix')
end
if rowsP ~= n || colsP ~= n
    error('P is not an nxn matrix')
end
m = rowsR;

%% Create the Omega matrix.
Omega = zeros(N*n, N*n);
for i = 1:N
    if i~=N
        Omega(1+(i-1)*n:i*n, 1+(i-1)*n:i*n) = Q;
    else
        Omega(1+(i-1)*n:i*n, 1+(i-1)*n:i*n) = P;
    end
end

%% Create the Psi matrix.
Psi = zeros(N*m, N*m);
for i = 1:N
        Psi(1+(i-1)*m:i*m, 1+(i-1)*m:i*m) = R;
end
