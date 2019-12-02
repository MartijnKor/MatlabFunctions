function RGA = mKRGA(G)
% This function computes the RGA according to the definition defined on
% Wikipedia: https://en.wikipedia.org/wiki/Relative_Gain_Array
RGA = G.*(inv(G).');