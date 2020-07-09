%Edgar Moises Hernandez-Gonzalez
%19/11/19-29/04/20
%RWE con DWT de dos niveles de descompisicion usando DWT-db4

clear
clc

load('MI-EEG-ID-A01E.mat');
[f, c] = size(binarios);
todoRWE = []; %aqui guardaremos las señales filtradas
for i=1:f
    muestra = binarios(i,:); %selecciona la fila i (muestra num i)
    muestraRWE = [];
    indiceInicio = 1;
	indiceFin = 1000;
    for j=1:22 %numero de canales
        canal = muestra(indiceInicio:indiceFin);
        rwe = rwe_dwt(canal);
        muestraRWE = [muestraRWE rwe];
        indiceInicio = indiceInicio + 1000;
        indiceFin = indiceFin + 1000;
    end
    todoRWE = [todoRWE; muestraRWE]; %se van concatenando las muestras filtradas
    if mod(i,100)==0 %imprimir el contador cada 100 iteraciones para observar el avance
        disp(i);
    end
end

csvwrite('MI-EEG-ID-RWE-A01E.csv',todoRWE);

function rwe = rwe_dwt(senal)
	[C,L] = wavedec(senal,2,'db4');
	[Ea,Ed] = wenergy(C,L);
    Et = Ea + (sum(Ed));
    RWE_1 = Ea/Et;
    RWE_2 = Ed/Et;
    rwe = [RWE_1 RWE_2];
end