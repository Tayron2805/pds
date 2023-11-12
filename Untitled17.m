[sinal_de_voz, fs] = audioread('audio_trab2.wav'); %Get the loudness of the sound(amplitude)
N=218112;
y_BP_FIR = filter(BP_FIR,sinal_de_voz); % apply filter to your data
y_HP_FIR = filter(hP_FIR,sinal_de_voz); % apply filter to your data
y_LP_FIR = filter(LP_FIR,sinal_de_voz); % apply filter to your data

y_BP_IIR = filter(BP_IIR,sinal_de_voz); % apply filter to your data
y_HP_IIR = filter(HP_IIR,sinal_de_voz); % apply filter to your data
y_LP_IIR = filter(LP_IIR,sinal_de_voz); % apply filter to your data

t=(0:N-1)/fs;

%%
plot(t,y_BP_FIR,'-blue')
%soundsc(y,fs)
title("audio com filtro BP FIR")
xlabel('tempo(s)')
ylabel('amplitude')
hold
plot(t,y_BP_IIR,'red')
%soundsc(y,fs)
title("audio com filtro BP IIR")
xlabel('tempo(s)')
ylabel('amplitude')
legend('show');
%%
% Plotagem do sinal com filtro BP FIR
figure;
plot(t, y_BP_FIR, '-b', 'DisplayName', 'FIR');
title('Áudio com Filtro BP FIR e IIR');
xlabel('Tempo (s)');
ylabel('Amplitude');
hold on;

% Plotagem do sinal com filtro BP IIR
plot(t, y_BP_IIR, '-r', 'DisplayName', 'IIR');
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;

% Adicionando a legenda
legend('show');

hold off;
%%
% Plotagem do sinal com filtro BP FIR
figure;
plot(t, y_HP_FIR, '-b', 'DisplayName', 'FIR');
title('Áudio com Filtro HP FIR e IIR');
xlabel('Tempo (s)');
ylabel('Amplitude');
hold on;

% Plotagem do sinal com filtro BP IIR
plot(t, y_HP_IIR, '-r', 'DisplayName', 'IIR');
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;

% Adicionando a legenda
legend('show');

hold off;
%%
figure
plot(t,y_HP_FIR,'-blue')
%soundsc(y,fs)
title("audio com filtro HP FIR")
xlabel('tempo(s)')
ylabel('amplitude')
figure
plot(t,y_HP_IIR,'-blue')
%soundsc(y,fs)
title("audio com filtro HP IIR")
xlabel('tempo(s)')
ylabel('amplitude')
figure
plot(t,y_LP_FIR,'-blue')
%soundsc(y,fs)
title("audio com filtro LP FIR")
xlabel('tempo(s)')
ylabel('amplitude')
figure
plot(t,y_LP_IIR,'-blue')
%soundsc(y,fs)
title("audio com filtro LP IIR")
xlabel('tempo(s)')
ylabel('amplitude')

%%
audiowrite('audio_filtro_passabanda_FIR.wav',y_BP_FIR,fs)
audiowrite('audio_filtro_passaaltas_FIR.wav',y_HP_FIR,fs)
audiowrite('audio_filtro_passabaixas_FIR.wav',y_LP_FIR,fs)
audiowrite('audio_filtro_passabanda_IIR.wav',y_BP_IIR,fs)
audiowrite('audio_filtro_passaaltas_IIR.wav',y_HP_IIR,fs)
audiowrite('audio_filtro_passabaixas_IIR.wav',y_LP_IIR,fs)

