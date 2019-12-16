%Edgar Moises Hernandez-Gonzalez
%23/10/19-01/12/19
%Filtro pasa banda de 8hz a 30hz
%Se filtraran todas las señales con un solo comando

clear
clc

load('LimpiosA09E.mat') %cambiar el 01 por el numero de sujeto y revisar si es T o E
fs = 250;

signals_filtradas = bandpass(signals_limpias, [8 30], fs);

save('FiltradasA09E.mat','signals_filtradas'); %cambiar el 01 por el numero de sujeto y revisar si es T o E