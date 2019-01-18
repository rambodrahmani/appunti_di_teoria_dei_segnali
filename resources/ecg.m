%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% File:		ecg.m
% Author:	Rambod Rahmani <rambodrahmani@autistici.org>
% Date:		18/01/2019
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% apertura del file in lettura
fOut = fopen('ecg.dat');

% numeri di campioni da memorizzare
numeroCampioni = 500;

% segnale ECG
x = fread(fOut, numeroCampioni, 'int16');

% spaziatura temporale dei campioni [s]
deltaT = 0.02;

% scala dei tempi
tempo = (1:numeroCampioni)*deltaT;

% rappresentiamo graficamente il segnale
figure
plot(tempo, x);

% lunghezza dei punti su cui calcola la FFT
lunghezzaFft = 2^nextpow2(numeroCampioni);

% serie di Fourier del segnale
X=fft(x, lunghezzaFft);

% rendiamo la serie di Fourier ottenuta simmetrica rispetto all'origine
X=[X(lunghezzaFft/2+1:lunghezzaFft) X(1:lunghezzaFft/2)];

% calcolo del vettore delle frequenze
frequenza = linspace(-0.5, 0.5, length(X))/deltaT;

% rappresentiamo graficamente la serie di Fourier del segnale
figure
plot(frequenza, abs(X));
