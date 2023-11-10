fs=44100;%frequencia de amostragem
rec = audiorecorder(fs, 16, 1);
record(rec);
duration = 5.0;
pause(duration);
stop(rec);
sinal_de_voz = getaudiodata(rec);
filename = "audio_trab2.wav";
audiowrite(filename,sinal_de_voz, fs);

%%
clear all
clc

tf=5;%duração da amostra
fs=44100;%frequencia de amostragem
Ts=1/fs;
N=fs *tf;
t=(0:N-1)/fs;
% Vetor de frequências
frequencias = linspace(0, fs/2, N/2);
frequencies = (0:(N/2-1)) * (fs / N);
delta_f = fs/N;%discretização da frequencia 0.5Hz
Nyquist=fs/2;

[sinal_de_voz, fs] = audioread('audio_trab2.wav'); %Get the loudness of the sound(amplitude)
n2=length(sinal_de_voz);
X_MEAN=mean(sinal_de_voz);
X_MAX=max(sinal_de_voz);
sinal_de_voz_mean= sinal_de_voz- X_MEAN;
%sinal_de_voz_mean=sinal_de_voz_mean/X_MAX;



f=(0:N-1)*(fs/N); %vetor de frequencias
aux=floor(N/2)+1;
signalfft=fft(sinal_de_voz_mean);
signalfftabs=abs(signalfft)/max(abs(signalfft));

N=length(sinal_de_voz);
t=(0:N-1)/fs;
subplot(3,1,1)
plot(t,sinal_de_voz)
title("gravação de voz")
xlabel('tempo(s)')
ylabel('amplitude')
subplot(3,1,2)
plot(t,sinal_de_voz_mean)
title("gravação de voz sem nível médio")
xlabel('tempo(s)')
ylabel('amplitude')
subplot(3,1,3)
stem(f(1:aux),signalfftabs(1:aux))
title("dominio da frequência")
xlabel('frequência(Hz)')
ylabel('magnitude')
figure

%%
%projeto analogico -> pré-distorção -> transformação bilinear
fd=250;
%wa=(2/ts)*tan(wd*(ts/2)); %pré-distorção de frequência
fa=(fs/pi)*tan(pi*(fd/fs))
%pkg load signal
[sb,sa]= butter(20,2*pi*fa,"high","s")
%numerador b
freqs(sb,sa,0:3000)
%%
%coeficientes do filtro digital
[zb,za]=bilinear(sb,sa,fs);
freqz(zb,za,[],fs)
%%
y=filter(zb,za,sinal_de_voz)
plot(y)
%%
hold 
plot(sinal_de_voz)

%%
fs = 44100; % Frequência de amostragem em Hz
duracao_sinal = 5; % Duração do sinal em segundos
t = 0:1/fs:duracao_sinal-1/fs; % Vetor de tempo
sinal_de_voz = sin(2*pi*1000*t) + 0.5*sin(2*pi*2000*t); % Exemplo de sinal de áudio (1 kHz + 0.5 kHz)
% Calcula a Transformada Rápida de Fourier (FFT)
N = length(sinal_de_voz);
f = linspace(0, fs, N); % Vetor de frequências
sinal_de_voz_fft = fft(sinal_de_voz, N);

% Calcula a magnitude da FFT (representação em frequência)
magnitude_fft = abs(sinal_de_voz_fft) / N;

% Plotagem do espectro de frequência
figure;
subplot(2,1,1);
plot(t, sinal_de_voz);
title('Sinal de Áudio no Domínio do Tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(f, 20*log10(magnitude_fft));
title('Espectro de Frequência');
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');
grid on;
%%
fd=250;
%wa=(2/ts)*tan(wd*(ts/2)); %pré-distorção de frequência
fa=(fs/pi)*tan(pi*(fd/fs))
%pkg load signal
[sb,sa]= butter(20,2*pi*fa,"high","s")
%fvtool(sb,sa);                 % Visualize filter
%numerador b
freqs(sb,sa,0:3000)
%%
%coeficientes do filtro digital
[zb,za]=bilinear(sb,sa,fs);
fvtool(zb,za)                   % Visualize the filter
freqz(zb,za,[],fs)
%%
y=filter(zb,za,sinal_de_voz)
plot(y)

%%
hold 
plot(sinal_de_voz)

%%
fs=44100;
t=0:(1/fs):10/60;
x1=sin(2*pi*60*t);
plot(x1)
stem(x1)
x=x1+ sin(2*pi*400*t)

%projeto analogico -> pré-distorção -> transformação bilinear
fd=2000;
%wa=(2/ts)*tan(wd*(ts/2)); %pré-distorção de frequência
fa=(fs/pi)*tan(pi*(fd/fs))
[sb,sa]= butter(20,2*pi*fa,"high","s")
freqs(sb,sa,0:1000)
[zb,za]=bilinear(sb,sa,fs);
freqz(zb,za,[],fs)
y=filter(zb,za,x)
plot(y)
hold 
plot(x)

