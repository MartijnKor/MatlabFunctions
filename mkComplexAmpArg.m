function [gain ,arg] = mkComplexAmpArg(Re, Im, Type)
%Given a complex number, this function returns the amplitude and phase. As standard, the
%values will be returned as amplification and angle in radians.
%An additional argument can be given in as a string:
%dB: Returns the gain in dB.
%Deg: Returns the argument in degrees.
%Bode: Returns gain in dB and the argument in degrees - 360.

gain = sqrt(Re^2+Im^2);
arg = atan(Im/Re);

if Re < 0 && Im > 0
    arg = arg + pi;
end

if Re < 0 && (Im < 0)
    arg = arg + pi;
end

if nargin > 2
    if strcmpi(Type, 'db')
        gain = 20*log10(gain);
    	
	elseif strcmpi(Type, 'Deg')
		arg = ((arg)/2*pi)*360;
	
    elseif strcmpi(Type, 'Bode') || strcmpi(Type, 'bode')
        gain = 20*log10(gain);
        arg = (arg/(2*pi))*360;
        arg = arg - 360;
	
	else
		msg = 'No correct type given. Use HELP for input arguments.';
		error(msg)
	end
end

end

