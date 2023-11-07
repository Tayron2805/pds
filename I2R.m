ts=44100
fs=1/ts;
t=0:(1/fs):10/ts;
x1=sin(2*pi*60*t);
plot(x1)
stem(x1)
x=x1+ sin(2*pi*400*t)
%%
%projeto analogico -> pré-distorção -> transformação bilinear
fd=250;
%wa=(2/ts)*tan(wd*(ts/2)); %pré-distorção de frequência
fa=(fs/pi)*tan(pi*(fd/fs))
%pkg load signal
[sb,sa]= butter(20,2*pi*fa,"s")
%numerador b
%%
freqs(sb,sa,0:3000)
%coeficientes do filtro digital
[zb,za]=bilinear(sb,sa,fs);
freqz(zb,za,[],fs)
y=filter(zb,za,x)
%%
plot(y)
hold 
plot(x)

%%
fs=1000;
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













