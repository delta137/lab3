function [DY] = Incertitude(x, fct, par, dpar)
% [dy] = Incertitude(x,fct,par,dpar)
% Renvoie un tableau vertical d'erreur pour chaque valeur de y 
% Utilise la propagation des erreurs avec les paramètres

%initialisation 
k = length(par);
dy = zeros(k,1);
DY = zeros(length(x),1);

%boucle pour toutes les valeurs de x
for i = 1: length(x)    
    %boucle sur tout les paramèetres
    for n = 1 : k;        
        %déterminer le paramèetre modifier
        temp_dpar = zeros(k,1);
        temp_dpar(n) = dpar(n);       
        %calculer max et min
        y1 = fct(x(i),par + temp_dpar);
        y2 = fct(x(i),par - temp_dpar);        
        %calculer l'incertitude associé à ce paramètre
        dy(n) = 0.25*(y1-y2).^2; 
    end
    %calculer l'incertitude sur une valeur de y
    DY(i) = sqrt(sum(dy)); 
end


%fin function
end

