%Edgar Moises Hernandez-Gonzalez
%16/10/19-05/11/19
%Acomodar los datos para que queden concatenados los canales
%Input shape 288000x22
%Output shape 288*22000

clear
clc

load('FiltradasA01T.mat') %cambiar el 01 por el numero de sujeto

nuevo = zeros(288,22000);
contador2 = 1;

for i=1:288
    contador1=1;
    for j=1:22
        nuevo(i, contador1:contador1+999)...
            = signals_filtradas(contador2:contador2+999, j);
        contador1 = contador1 + 1000;
    end
    contador2 = contador2 + 1000;
end
%csvwrite('MI-EEG-A01T.csv',nuevo); %cambiar el 01 por el numero de sujeto