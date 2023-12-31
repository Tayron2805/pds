function Hd = LP492-HAMMING
%LP492-HAMMING Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.8 and DSP System Toolbox 9.10.
% Generated on: 12-Nov-2023 10:29:46

% FIR Window Bandpass filter designed using the FIR1 function.

% All frequency values are in Hz.
Fs = 44100;  % Sampling Frequency

N    = 492;      % Order
Fc1  = 250;      % First Cutoff Frequency
Fc2  = 2000;     % Second Cutoff Frequency
flag = 'scale';  % Sampling Flag
% Create the window vector for the design algorithm.
win = hamming(N+1);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, [Fc1 Fc2]/(Fs/2), 'bandpass', win, flag);
Hd = dsp.FIRFilter( ...
    'Numerator', b);

% [EOF]
