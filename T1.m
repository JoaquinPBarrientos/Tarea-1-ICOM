%Pregunta 1
clear all;
close all;
clc;

f1=100;
f2=200;
a1=1;
a2=0.5;
ts=3.3333e-04;
fs=1/ts;
t = [0:1/fs:1];
cte = 1;

vector=1*t;

x1=a1*sin(2*pi*f1*t);
x2=a2*sin(2*pi*f2*t);
st=x1+x2;

figure
plot(t,st);
ylabel("Amplitud [V]");
xlabel("Tiempo [s]");
grid on

mu=0; %media 
sigma=1; %desviacion estandar

y=normrnd(mu,sigma,size(t));



title('Ruido normalmente distribuido (Gaussiano)')
xlabel('Tiempo [s]')
ylabel('Amplitud [V]')
%------------------- Gráfico de la Distribución del Ruido (Histograma)
figure
histogram(y)
%plot(x,q)
title('Distribución del ruido Gaussiano')
xlabel('Voltaje [V]')
ylabel('Amplitudes promedio del ruido por voltaje')
grid on
%.-------------------autocovarianza------------------
figure
rng default
maxlag = 40;
[c,lags] = xcov(y,maxlag,'normalized');
stem(lags,c)
xlabel("Lag")
ylabel("Potencia")
grid on

%------------------------P3---------------
N=2^12;
figure
periodogram(st,[],length(st));
grid on
figure
periodogram(st,[],N);
grid on
%-----------P4----------------
st_ruido=st+y;
figure
plot(t,st_ruido)
title("Señal con ruido");