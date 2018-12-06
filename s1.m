C=0.1; %Ustawienie zmiennych
R=10;
K=1/(R*C);
WPC=4;
sim('Sim1'); %przeprowadzenie symulacji

plot(tout,x) %stworzenie wykresu x(t)
xlabel('t') %podpisanie osi
ylabel('u') 
grid on %dodanie siatki
title('Wykres sterowania i napi�cia od czasu') %dodanie tytu�u
hold on %dodanie sterowania
plot(tout,u) 
hold off