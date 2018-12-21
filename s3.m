%Igor Noga

%Zad. 1
% WPC=0.2;
% l=[-1.5, -1, -.5, 0, .5, 1, 1.5];
% for(lambda=l) %dla wszystkich wartoœci lambdy z polecenia
%     figure; 
%     hold on;
%     title(strcat('lambda = ',num2str(lambda),' WPC = ',num2str(WPC)));
%     lambda;
%     sim('modl3'); %obliczam rozwi¹zanie dyskretne
%     for(i=1:11)
%         plot(i,x(i),'*r'); %rysujê wykres
%     end;
% end;


% Zadanie 2

h=1;
WPC=5;

A=[0,1;-4,-4];
B=[1;0];

C=[1, 0; 0, 1];
D=zeros(size(B));

Adys = expm(h*A);
Bdys = double( int(expm(s*A)*B,s,0,h));
Cdys = C;

sim('sim3');

figure;
hold on;
grid on;
plot(continous);
for(i=1:11)
       plot(i-1,discrete(i,1),'*r');
       plot(i-1,discrete(i,2:end),'*c');
end;
title('Rozwi¹zania ci¹g³e i dysretne');


%Zadanie 3
%Odsetki 10% w skali roku

figure;
WPC = 1000; %1000z³
hold on
for m = 1:365
   WK = WPC * ( 1 + 0.1/m) ^ m;
    plot(m, WK, '*r'f);
end  

% Zadanie 4
a = -2;
b = -5;
epsilon = 1e-10;
max_iter = 10000;

syms x
f = @(x) x.^3 - 3*x.^2 -11*x +12;
f_prime = matlabFunction( diff(f(x)) );

result = Newton(f, a, b, epsilon, max_iter, f_prime);
result

function [x_0, iterations] = Newton(f, a, b, epsilon, max_iter, f_prime)
    if(f(a) == 0)           % sprawdzenie, czy lewy koniec przedzialu nie jest m. zerowym
        x_0 = a;
        iterations = 0;
        return;
    end  
    if(f(b) == 0)           % sprawdzenie, czy lewy koniec przedzialu nie jest m. zerowym
        x_0 = b;
        iterations = 0;
        return;
    end
    % sprawdzenie warunkow poczatkowych
    if (f(a) * f(b)> 0) || (max_iter <= 0)
       x_0 = NaN;
       iterations = -1;
       return;
    end
    
    cur_x = a;  
    count = 0;
    prev_x = cur_x;

    while (count < max_iter)
        count = count + 1;
        cur_x = prev_x - f(prev_x)/f_prime(prev_x);
        
        if(f(cur_x) == 0.0 || abs(cur_x - prev_x) <= epsilon || abs(f(cur_x)) <= epsilon)
            x_0 = cur_x;
            iterations = count;
            return;
        end
        prev_x = cur_x;
    end
    x_0 = cur_x;
    iterations = count;   
end 