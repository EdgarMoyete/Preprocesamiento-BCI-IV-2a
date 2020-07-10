%Edgar Moises Hernandez-Gonzalez
%09/07/20
%Filtro Laplaciano para usar solo dos canales (C3 y C4)
%Input shape: 288000x22
%Output shape: 288000x2
%canal C3 = 8
%canal C4 = 12
%muestra 3 es derecha para el sujeto 1

clear
clc

%cambiar el 01 por el numero de sujeto y revisar si es T o E
load('LimpiosA09E.mat');

c3_vecinos = [signals_limpias(:, 2) signals_limpias(:, 7) ...
    signals_limpias(:, 9) signals_limpias(:, 14)];
c4_vecinos = [signals_limpias(:, 6) signals_limpias(:, 11) ...
    signals_limpias(:, 13) signals_limpias(:, 18)];

c3_laplace = signals_limpias(:, 8) - mean(c3_vecinos, 2);
c4_laplace = signals_limpias(:, 12) - mean(c4_vecinos, 2);

laplace_c3_c4 = [c3_laplace c4_laplace];

%cambiar el 01 por el numero de sujeto y revisar si es T o E
%save('LaplaceA09E.mat','laplace_c3_c4');

% % Esto es para graficar la diferencia de la senal
% c4 = signals_limpias(2000:3000,12);
% plot(c4,'LineWidth',1);
% hold on
% c4_nuevo = c4_laplace(2000:3000);
% plot(c4_nuevo,'LineWidth',1);
% grid;
% xlabel('Time');
% ylabel('Amplitude');
% legend('C4','C4 Filter Laplacian');
% hold off