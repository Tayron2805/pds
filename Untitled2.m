% Example 1:
    %   Design a highpass IIR filter with order 8, passband frequency of 
    %   75 KHz, and a passband ripple of 0.2 dB. Sample rate is 200 KHz.
    %   Visualize the filter response and apply the filter to a vector of
    %   random data. 
 
    hpFilt = designfilt('highpassiir', 'FilterOrder', 100, ...
             'PassbandFrequency', 250, 'PassbandRipple', 1,...
             'SampleRate', 44100);
    fvtool(hpFilt) % visualize filter response

    data = randn(1000,1);
    y = filter(hpFilt,data); % apply filter to your data
    plot(y)
    hold
    plot(data)
    %freqz(hpFilt)
  %%
    % Example 2:
    %   Design a lowpass FIR filter with normalized passband frequency of
    %   0.25*pi rad/s, stopband frequency of 0.35*pi rad/s, passband ripple
    %   of 0.5 dB, and stopband attenuation of 65 dB. Use a Kaiser window 
    %   design method. Apply the filter to a vector of random data. 
    
    fs=44100;
    Fpass=250/(fs/2);
    Fstop=500/(fs/2);
    lpFilt = designfilt('lowpassfir','FilterOrder', 600, 'PassbandFrequency', 250,...
             'StopbandFrequency', 500, 'SampleRate',fs);
 
    data = randn(1000,1);
    y = filter(lpFilt,data); % apply filter to your data
    plot(y)
    hold
    plot(data)
    %freqz(lpFilt)
    fvtool(lpFilt) % visualize filter response
 %%
    % Example 3:
    %   Design a bandpass FIR filter with a lower cutoff frequency of 500
    %   Hz and a higher cutoff frequency of 560 Hz. The sample rate is 1500
    %   Hz. Visualize the filter response using freqz. 
    
    bpFilt = designfilt('bandpassfir', 'FilterOrder', 600, ...
             'CutoffFrequency1', 250, 'CutoffFrequency2', 2000,...
             'SampleRate', 44100);
  
    %freqz(bpFilt)
    fvtool(bpFilt) % visualize filter response
    
     bpFilt = designfilt('bandpassiir', 'FilterOrder', 600, ...
             'CutoffFrequency1', 250, 'CutoffFrequency2', 2000,...
             'SampleRate', 44100);