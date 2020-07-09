%Edgar Moises Hernandez-Gonzalez
%26/06/20
%Filtro de mediana para remplazar los valores NaN
%Creo que es mejor que el orden sea impar y que sea un numero pequeno

clear
clc

% Generamos una senal seno con valores nulos entre los indices 16 al 20
t = linspace(-pi,pi,50)';
x_1 = sin(t);
x_2 = cos(t);
x = [x_1 x_2];
a = 11;
b = 20;
disp(x(a:b,:));
x(a:b,:)=NaN;

% Filtro de mediana de orden n y omitir los NaN para 
y_1 = medfilt1(x,9,'omitnan');
y_2 = medfilt1(x,11,'omitnan');

subplot(2,1,1)
plot(x);
grid;
title('Signal Original');
subplot(2,1,2)
plot(y_2);
grid;
title('Filtro Mediana 2');

x2=x;
x2(a:b,:)=y_1(a:b,:);
x3=x;
x3(a:b,:)=y_2(a:b,:);

figure;
subplot(2,1,1)
plot(x2);
grid;
title('Remplazar por filtro mediana 1');
subplot(2,1,2)
plot(x3);
grid;
title('Remplazar por filtro mediana 2');

disp(x2(a:b,:));
disp(x3(a:b,:));