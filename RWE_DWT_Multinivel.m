%Edgar Moises Hernandez-Gonzalez
%19/11/19
%RWE con DWT de dos niveles de descompisicion usando DWT-db4

clear
clc

load('MI-EEG-A01E.mat');
[f, c] = size(nuevo);
todoRWE = []; %aqui guardaremos las señales filtradas
for i=1:f
    muestra = nuevo(i,:); %selecciona la fila i (muestra num i)
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
    todoRWE = [todoRWE; muestraRWE]; %se van concatenando las muestras filtradas y la etiqueta
    
    if mod(i,100)==0 %imprimir el contador cada 100 iteraciones para observar el avance
        disp(i);
    end
    
end
csvwrite('MI-EEG-RWE-5-A01E.csv',todoRWE);

function rwe = rwe_dwt(senal)
	[C,L] = wavedec(senal,5,'db4');
	[Ea,Ed] = wenergy(C,L);
    Et = Ea + (sum(Ed));
    RWE_1 = Ea/Et;
    RWE_2 = Ed/Et;
    rwe = [RWE_1 RWE_2];
end