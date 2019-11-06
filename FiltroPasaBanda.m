%Edgar Moises Hernandez-Gonzalez
%23/10/19-05/11/19
%Filtro pasa banda de 8hz a 30hz
%Se debe importar el archivo 'MotorImageryA01.mat' y se creara la variable
%signals
%Se filtraran todas las señales con un solo comando

clear
clc

load('LimpiosA01T.mat') %cambiar el 01 por el numero de sujeto
fs = 250;

signals_filtradas = bandpass(signals_limpias, [8 30], fs);

%save('FiltradasA01T.mat','signals_filtradas'); %cambiar el 01 por el numero de sujeto