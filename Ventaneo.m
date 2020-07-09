%Edgar Moises Hernandez-Gonzalez
%15/04/20-17/05/20
%Ventanas de 2 seg superpuestas al 95% (0.1 seg)
%Input shape 288x22000
%Output shape 6048*11000

clear
clc

%cambiar el 01 por el numero de sujeto y revisar si es T o E
load('MI-EEG-A04E.mat');

signals = zeros(6048, 11000);
c = 1;
for i=1:288 %muestras
    a = 1;
    b = 1;
    for j=1:22 %canales
        una_muestra = nuevo(i, a:a+999);
        signals(c:c+20, b:b+499) = ventaneo(una_muestra);
        a = a + 1000;
        b = b + 500;
    end
    c = c + 21;
end

%cambiar el 01 por el numero de sujeto y revisar si es T o E
csvwrite('Ventaneo-A04E.csv',signals);

function ventaneadas = ventaneo(una_muestra)
    ventaneadas = zeros(21, 500);
    contador = 1;
    for i=1:21
        ventaneadas(i, :) = una_muestra(contador:contador + 499);
        contador = contador + 25;
    end
end