%Edgar Moises Hernandez-Gonzalez
%29/04/20-10/07/20
%Solo usar los de mano izquierda y derecha para clasificacion binaria
%Input shape 288*22000
%Output shape 144*22000

clear
clc

%cambiar el 01 por el numero de sujeto y revisar si es T o E
load('MI-EEG-A09E.mat')
load('Datos\Labels\A09E.mat')

binarios = zeros(144,22000);
%etiquetas = zeros(144,1);

contador = 1;
for i=1:288
    if classlabel(i) == 1 || classlabel(i) == 2
        binarios(contador,:) = nuevo(i,:);
        %etiquetas(contador) = classlabel(i) - 1;
        contador = contador + 1;
    end
end
%cambiar el 01 por el numero de sujeto y revisar si es T o E
csvwrite('MI-EEG-ID-A09E.csv', binarios);
%csvwrite('Etiquetas-ID-A09E.csv', etiquetas);
%save('MI-EEG-ID-A01E.mat','binarios');