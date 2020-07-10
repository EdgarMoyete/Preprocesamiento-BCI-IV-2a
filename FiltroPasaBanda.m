%Edgar Moises Hernandez-Gonzalez
%23/10/19-09/07/20
%Filtro pasa banda de 8-30hz
%Se filtraran todas las señales con un solo comando

clear
clc

%cambiar el 01 por el numero de sujeto y revisar si es T o E
load('LaplaceA09E.mat');
fs = 250;

signals_filtradas = bandpass(laplace_c3_c4, [8 30], fs);

%cambiar el 01 por el numero de sujeto y revisar si es T o E
save('FiltraLaplaceA09E.mat','signals_filtradas');

% % Esto es para graficar la diferencia de la senal y sus espectros con FFT
% subplot(2,1,1);
% c4 = car(2000:3000,12);
% plot(c4,'LineWidth',1);
% hold on
% c4_filtradas = signals_filtradas(2000:3000,12);
% plot(c4_filtradas,'LineWidth',1);
% grid;
% xlabel('Time');
% ylabel('Amplitude');
% legend('C4 CAR','C4 Pasa Banda 8Hz-30Hz');
% hold off
% 
% % FFT
% [P1_1, f_1] = transformadaFourier(c4', fs);
% [P1_2, f_2] = transformadaFourier(c4_filtradas', fs);
% 
% subplot(2,1,2);
% plot(f_1, P1_1,'LineWidth',1);
% hold on
% plot(f_2, P1_2,'LineWidth',1);
% title('Fast Fourier Transform');
% xlabel('Frequency');
% ylabel('Power');
% legend('C4 CAR','C4 Pasa Banda 8Hz-30Hz');
% axis([0 35 0 1.5]);
% grid;
% %--------------------------------------------------
% % Funciones
% %--------------------------------------------------
% function [P1, f] = transformadaFourier(senal, fs)
%     [f, tamanoSenal]=size(senal);
%     Y = fft(senal);
%     %Calcule el espectro bilateral P2. A continuación, calcule el espectro
%     %unilateral P1 basado en P2 y la longitud de la señal de valor uniforme L
%     P2 = abs(Y/tamanoSenal);
%     P1 = P2(1:floor(tamanoSenal/2+1));
%     P1(2:end-1) = 2*P1(2:end-1);
%     f = fs*(0:(tamanoSenal/2))/tamanoSenal;
% end