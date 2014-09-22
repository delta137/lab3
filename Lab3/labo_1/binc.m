function binc(x,dx,y,dy)
% FONCTION BINC: trace des barres d'incertitudes hor. et vert.
% 
% binc(x,dx,y,dy) trace des barres de longueur dx(i) et dy(i)
% respectivement à gauche et à droite et  au-dessus et 
% en-dessous du point (x(i),y(i)). 
% x, et y  sont des vecteurs ligne ou colonne de même taille.
% dx et/ou dy sont des constantes si les incertitudes le sont ou des vecteurs.

[m,n]= size(x);
if n == 1
 x=x'; dx=dx';
 y=y'; dy=dy';
end
% si vecteurs colonne, transformer en vecteurs ligne
hold on
% après un appel à plot(x,y,'{\em symbole}'), pour permettre
% aux barres de s'ajouter au graphique
plot([x-dx; x+dx],[y; y],'k-')
plot([x; x],[y-dy; y+dy],'k-')
hold off

