%Edgar Moises Hernandez-Gonzalez
%01/12/19
%DWT de dos niveles, coeficientes concatenados, la variable C o L

clear
clc

load('MI-EEG-A01E.mat');
[f, c] = size(nuevo);
todoCoef = []; %aqui guardaremos todo
for i=1:f
    muestra = nuevo(i,:); %selecciona la fila i (muestra num i)
    muestraCoef = [];
    indiceInicio = 1;
	indiceFin = 1000;
    for j=1:22 %numero de canales
        canal = muestra(indiceInicio:indiceFin);
        [C,L] = wavedec(canal, 2, 'db4');
        muestraCoef = [muestraCoef C];
        indiceInicio = indiceInicio + 1000;
        indiceFin = indiceFin + 1000;
    end
    todoCoef = [todoCoef; muestraCoef]; %se van concatenando las muestras
end

%csvwrite('MI-EEG-DWT-Coef-A01E.csv',todoCoef);