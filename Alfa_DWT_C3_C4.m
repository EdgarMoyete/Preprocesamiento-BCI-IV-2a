%Edgar Moises Hernandez-Gonzalez
%27/11/19
%Alfa de C3 y C4 con DWT de dos niveles de descomposicion

clear
clc

load('MI-EEG-A01E.mat');
[f, c] = size(nuevo);

alfas = [];
for i=1:f
    c3 = nuevo(i,7001:8000); %selecciona la fila i (muestra num i)
    c4 = nuevo(i,11001:12000); %selecciona la fila i (muestra num i)
    alfaC3 = alfa_dwt(c3);
    alfaC4 = alfa_dwt(c4);
    alfas = [alfas; alfaC3 alfaC4]; %guardar alfa de c3 y c4
end

csvwrite('MI-EEG-Alfa-A01E.csv', alfas);

% plot(alfaC3);
% title('Alpha C3');
% xlabel('Time');
% ylabel('Amplitude');
% grid;
% 
% figure;
% plot(alfaC4);
% title('Alpha C4');
% xlabel('Time');
% ylabel('Amplitude');
% grid

function alfa = alfa_dwt(senal)
	[C, L] = wavedec(senal, 2, 'db4');
	alfa = appcoef(C, L, 'db4', 2);
end