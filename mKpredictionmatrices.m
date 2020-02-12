function [Phi, Gamma] = mKpredictionmatrices(A, B, N)
[rowsA, colsA] = size(A);
if rowsA ~= colsA
    error('Matrix A is not a square matrix.')
else
    n = rowsA;
end
[rowsB, colsB] = size(B);
if rowsB ~= n
    error('The number of rows of the B matrix does not match the number of rows of the A matrix.')
end

Phi = zeros(N*n, n);
for i = 1:N
    Phi((i-1)*n+1:i*n,:) = A^i;
end

Gamma = zeros(N*n,N*colsB);
for i = 1:N
    for j = 1:N
        if j<=i
            Gamma((i-1)*n+1:i*n,(j-1)*colsB+1:j*colsB) = A^(i-j)*B;
        end
    end
end