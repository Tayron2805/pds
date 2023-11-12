fs = 44100;  % Sampling rate
fc = 0;  % Cutoff frequency
fstop = 250;  % stop-band at 1000
ripple = 1;  % we'll allow 3 dB ripple in the passband
attenuation = 60 ; % we'll require 60 dB attenuation in the stop band
tf=5;%duração da amostra
Ts=1/fs;
N=fs *tf;
t=(0:N-1)/fs;
%[sinal_de_voz, fs] = audioread('audio_trab2.wav'); %Get the loudness of the sound(amplitude)
[sinal_de_voz, fs2] = audioread('audio_trab2.wav'); %Get the loudness of the sound(amplitude)
n2=length(sinal_de_voz);
aux=floor(N/2)+1;
signalfft=fft(sinal_de_voz);
signalfftabs=abs(signalfft)/max(abs(signalfft));
f=(0:N-1)*(fs/N); %vetor de frequencias
N=length(sinal_de_voz);
t=(0:N-1)/fs;
subplot(2,1,1)
plot(t,sinal_de_voz)
title("gravação de voz")
xlabel('tempo(s)')
ylabel('amplitude')

subplot(2,1,2)
stem(f(1:aux),signalfftabs(1:aux))
title("dominio da frequência")
xlabel('frequência(Hz)')
ylabel('magnitude')
figure
%%
filter(Hd,sinal_de_voz)
%%
%projeto analogico -> pré-distorção -> transformação bilinear
fd=2000;
%wa=(2/ts)*tan(wd*(ts/2)); %pré-distorção de frequência
fa=(fs/pi)*tan(pi*(fd/fs))
[sb,sa]= butter(7,2*pi*fa,"high","s")
freqs(sb,sa,0:1000)

 
%%
[zb,za]=bilinear(sb,sa,fs);
figure
freqz(zb,za,[],fs)
h = fvtool(zb,za);                 % Visualize filter
y=filter(zb,za,sinal_de_voz)
plot(sinal_de_voz)
hold on
plot(y)
hold off

soundsc(y, fs);



