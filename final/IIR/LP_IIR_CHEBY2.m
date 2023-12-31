function Hd = LP_IIR_CHEBY2
%GETFILTER Returns a discrete-time filter System object.

% MATLAB Code
% Generated by MATLAB(R) 9.8 and DSP System Toolbox 9.10.
% Generated on: 12-Nov-2023 16:37:46

Fpass = 125;    % Passband Frequency
Fstop = 250;    % Stopband Frequency
Apass = 1;      % Passband Ripple (dB)
Astop = 60;     % Stopband Attenuation (dB)
Fs    = 44100;  % Sampling Frequency

h = fdesign.lowpass('fp,fst,ap,ast', Fpass, Fstop, Apass, Astop, Fs);

Hd = design(h, 'cheby2', ...
    'MatchExactly', 'passband', ...
    'SystemObject', true);


