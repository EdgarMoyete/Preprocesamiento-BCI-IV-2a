%Edgar Moises Hernandez-Gonzalez
%16/10/19-01/12/19
%Subconjuntos de datos para BCI-IV-2a
%Obtenemos los 4seg se MI del segundo 2 al 6
%Fs=250Hz, por lo tanto en 4seg son 1000 datos

clear
clc

%cargar los datos
[s, h] = sload('A09E.gdf'); %cambiar el 01 por el numero de sujeto y revisar si es T o E
%Asi para que no existan NaN (no sirve)
%[s, h] = sload('A01T.gdf', 0, 'OVERFLOWDETECTION:OFF'); %cambiar el 01 por el numero de sujeto

signals = zeros(288000, 22);

for columna=1:22 %22 canales
	contador = 1;
    for i=1:288 %288 muestras
        %s(2seg : 6seg, numColumna)
        signals(contador:contador+999, columna) = s(h.TRIG(i)+500 : h.TRIG(i)+1499, columna);
        contador = contador + 1000;
    end
end
save('MotorImageryA09E.mat','signals'); %cambiar el 01 por el numero de sujeto y revisar si es T o E