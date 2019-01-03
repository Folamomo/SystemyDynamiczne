%Igor Noga
%Sprawozdanie 4
%Zadanie 1

sim('s4_1.slx');
figure
title('Odpowiedü uk≥adu na wymuszenia sinusoidalne');
xlabel('Czas [s]');
ylabel('Stan uk≥adu');
plot(tout,x);

%Zadanie 2

G1 = tf([1],[1 1 2]);
G2 = tf(1,[1 -0.1 1]);
A = nyquist(G1);
B = nyquist(G2);

%Zadanie 3

GD = tf([1],[4 1]);
GG = tf([0.4 0],[0.4 1]);
GP = tf([1 0], [1 2 1]);
G2 = tf([1], [1 0.1 1]);

figure
hold on
bode(GD)
bode(GG)
bode(GP)
bode(G2)
legend({'GD','GG','GP','G2'},'Location','southwest')

hold off

sim('s4_3.slx');
figure
hold on
plot(tout,out1);
plot(tout,out2);
plot(tout,out3);
plot(tout,out4);
legend({'GD','GG','GP','G2'},'Location','northwest')
hold off

%Zadanie 4

f = 1;
Rc = 1/(2*pi*f);
filtr = tf([5],[Rc 1]);
bode(filtr);
