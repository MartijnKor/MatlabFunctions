function [gain ,arg] = mkComplexAmpArg(Re, Im, Bode)
%Given a complex number, this function returns the amplitude and phase. The
%values will be returned as amplification and angle in radians. An additional
%argument can be passed as a 1 to get these values returned. Make that a 2
%to have the degrees subtracted with 360.
%as dB and degrees.

gain = sqrt(Re^2+Im^2);
arg = atan(Im/Re);

if Re < 0 && Im > 0
    arg = arg + pi;
end

if Re < 0 && (Im < 0)
    arg = arg + pi;
end

if nargin > 2
    if Bode == 1
        gain = 20*log10(gain);
        arg = (arg/(2*pi))*360;
    end
    if Bode == 2
        gain = 20*log10(gain);
        arg = (arg/(2*pi))*360;
        arg = arg - 360;
    end
end

end

