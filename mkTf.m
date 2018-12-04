function mkTf(C, G)
L1 = C*G;
T1 = L1/(1+L1);
S1 = 1/(1+L1);

assignin('base', 'C', C);
assignin('base', 'G', G);
assignin('base', 'L', L1);
assignin('base', 'T', T1);
assignin('base', 'S', S1);

figure('Name', 'Bode Plots', 'Position', [10 10 980 980])
subplot(3,1,1)
bode(L1); grid
title('Open loop L')
subplot(3,1,2)
bode(T1); grid
title('Closed loop T')
subplot(3,1,3)
bode(S1); grid
title('Sensitivity S')
figure('Name', 'Nyquist plot open loop L')
nyquist(L1);
title('Nyquist open loop L')
movegui('east');

end