% numero di campioni per periodo
N = 51;

% numero di armoniche da utilizzare
K = 30000;

% limite inferiore della scala dei tempi
tempoNormalizzatoMin = -1.0;

% limite superiore della scala dei tempi
tempoNormalizzatoMax = +1.0;

% vettore tempo
tempoNormalizzato = linspace(tempoNormalizzatoMin, tempoNormalizzatoMax, N*(tempoNormalizzatoMax - tempoNormalizzatoMin));

% X_0 = 1/2
componentContinua = 0.5;

% vettore degli indici k
k = (1:2:K);

% vettore dei coefficienti X_k per ciascun valore di k
coefficienti = 2/pi*(-1).^((k-1)/2)./k;

% vettore dei coseni per ciascun valore di k
coseni = cos(2*pi*tempoNormalizzato'*k);

% equazione di sintesi
xApprossimante = componentContinua + sum(coseni*coefficienti', 2);

% rappresentazione grafica dei coefficienti
plot(xApprossimante);