clear
clc

load('LimpiosA09E.mat');
%nan_canal = sum(isnan(signals_limpias))
nan_total = sum(sum(isnan(signals_limpias)))