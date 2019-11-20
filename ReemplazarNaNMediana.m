%Edgar Moises Hernandez-Gonzalez
%05/11/19
%Reemplazar NaN por mediana de todo el canal

clear
clc

load('MotorImageryA01E.mat') %cambiar el 01 por el numero de sujeto y revisar si es T o E

signals_limpias = zeros(288000, 22);

for i=1:22
	%sum(isnan(A)) = cuenta los NaN
    if sum(isnan(signals(:, i))) ~= 0 %si existe NaN
        disp(i); %imprime el num de canal que tiene NaN
        canalCopiaMedian = signals(:, i); %copia del canal
        canalCopiaMedian(isnan(canalCopiaMedian))...
            = median(canalCopiaMedian); %reemplazar NaN por mediana de todo el canal
        signals_limpias(:, i) = canalCopiaMedian;
    else %si no existe NaN copia el canal tal cual
        signals_limpias(:, i) = signals(:, i);
    end
end
%save('LimpiosA01E.mat','signals_limpias'); %cambiar el 01 por el numero de sujeto y revisar si es T o E