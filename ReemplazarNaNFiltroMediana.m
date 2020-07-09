%Edgar Moises Hernandez-Gonzalez
%05/11/19-28/06/20
%Reemplazar NaN por mediana de todo el canal
%Input Shape: 288000x22
%Output Shape: 288000x22

clear
clc

%cambiar el 01 por el numero de sujeto y revisar si es T o E
load('MotorImageryA09E.mat');

signals_limpias = zeros(size(signals));
contador = 1;
n_muestras_nan = 0;
for i=1:288
    muestra = signals(contador:contador+999,:);
    % si hay un NaN
    if sum(sum(isnan(muestra))) > 0
        % filtro mediana
        y = medfilt1(muestra,255,'omitnan');
%         figure;
%         plot(muestra);
%         grid;
        % reemplazar NaN por los valores del filtro mediana
        muestra(isnan(muestra)) = y(isnan(muestra));
%         figure;
%         plot(muestra);
%         grid;
        signals_limpias(contador:contador+999, :) = muestra;
        n_muestras_nan = n_muestras_nan + 1;
        disp('Muestra numero');
        disp(i);
    else
        signals_limpias(contador:contador+999, :) = signals(contador:contador+999, :);
    end
    contador = contador + 1000;
end
disp('Numero de muestras NaN');
disp(n_muestras_nan);
%cambiar el 01 por el numero de sujeto y revisar si es T o E
save('LimpiosA09E.mat','signals_limpias');