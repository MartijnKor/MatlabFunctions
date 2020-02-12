function nCr = mKnCr(n,r)
% Using the definition from https://nl.mathworks.com/matlabcentral/answers/416161-what-is-the-matlab-function-to-evaluate-ncr-value-when-n-is-real
gamma(n+1)/(gamma(r+1)*gamma((n-r)+1))