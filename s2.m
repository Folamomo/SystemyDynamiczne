P = [ 1 0; 0 1]; % domyslna macierz P
J = [ 1 0; 0 1 ]; % domyslna macierz J

%Wybieranie uk³adu wartoœci (odkomentowaæ odpowiednie)
% J=[0 0;0 0]; P = [ 1 0; 0 1]; %uk³ad 1
% J=[0 1;0 0]; P = [ 1 0; 0 1]; %uk³ad 2
% J=[0 0;0 -1];  P = [ 1 0; 0 1]; %uk³ad 3
% J=[-1 0;0 -2]; P = [ 1 0; 0 1]; %uk³ad 4
% J=[-1 0;0 -1]; P = [ 1 0; 0 1]; %uk³ad 5
% J=[-1 1;0 -1]; P = [ 1 0; 0 1]; %uk³ad 6
% J=[-1 0;0 1]; P = [ 1 0; 0 1]; %uk³ad 7
% J=[0 -1;1 0]; P = [ 1 0; 0 1]; %uk³ad 8 
 J=[-1 -1;1 -1]; P = [ 1 0; 0 1]; %uk³ad 9

A = P * J / P;

hold on;

xlim([-2 2])
ylim([-2 2])

            %opis wykresu
            title('Wykres zaleznosci x1 x2');           
            xlabel('x1');   % os X
            ylabel('x2');   % os X
    

hold on;

        
        X1 = -2:0.1:2;
        X1 = X1*P(1,1);
        
        Y1 = -2:0.1:2;
        Y1 = Y1*P(2,1);  %rysowanie wektorów w³asnych
        
        plot(X1,Y1);
        
        X2 = -2:0.1:2;
        X2 = X2*P(1,2);
        
        Y2 = -2:0.1:2;
        Y2 = Y2*P(2,2);
        
        plot(X2,Y2);

for I=-pi:1/20*pi:pi  %iteracja po warunkach poczatkowych
              
                figure(1);
               
              p = max(abs(sin(I)),abs(cos(I)));
             
            
             WPCa(:, :,1)=[sin(I) ; cos(I)];
             WPCa(:, :, 2)=[sin(I)/p;cos(I)/p];% ustwienie warunków poczatkowych
            
                  WPC = WPCa(:,:,1);
                  sim('sim2');  %wykonanie zadanej symulacji
                  plot(X(:,1),X(:,2),'.');   % rysowanie wykresu
                  WPC = WPCa(:,:,2);
                  sim('sim2');
                  plot(X(:,1),X(:,2),'.');
                  
end

cls('reset');

hold off;