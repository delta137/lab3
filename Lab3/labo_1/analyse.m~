for ajustement=1:1
close all; clear all;clc; format shortE;
% Change default axes fonts.

end

for n=1:1
    
    
    
% [courant x.808 y.808 dy.808 x.1064 y.1064 dy.1064 bckgrnd t_intgr]
fct_courant = [ 325 805.16  63  1   1063.65 6   0.5 1250    160e-6
                350 805.35  64  1   1063.81 21  1   1250    180e-6
                375 805.35  65  1   1063.81 35  1   1250    70e-6
                390 805.91  64  1   1063.81 27  7   1300    150e-6
                400 805.53  55  3   1063.81 17  1   1300    100e-6
                410 805.91  64  1   1063.97 45  1   1300    150e-6
                425 805.53  62  1   1063.81 52  1   1300    140e-6
                450 805.53  48  1   1063.81 60  3   1350    140e-6
                470 805.91  43  1   1063.81 65  1   1400    110e-6];
            
% [ position y.808 dy.808 y.1064 y.dy.1064]
fct_position = [ 11     61  1   50  2   1450    80e-6
                 12     47  1   61  1   1550    80e-6
                 13     14  0.5 31  2   1650    25e-6
                 14     40  1   36  1   1400    80e-6
                 14.5   61  1   18  2   1200    120e-6];

% [ position y.808 dy.808 y.1064 y.dy.1064]
fct_spectro = [ 17      61  1   50  2   1450    300e-6
                18.5    61  1   63  2   1500    80e-6
                20      64  1   46  4   1500    70e-6
                21.5    55  0.5 63  2   1500    80e-6
                23      64  1   25  2   1300    60e-6
                24.5    60  1   11  2   1250    80e-6
                26      59  1   7   0.5 1250    80e-6];

% [ courant y.808 dy.808 y.1064 dy.1064 bckgrnd]
fct_filtre = [ 150  60  1   1.8     0.1 1200
               200  65  1   1.7     0.1 1200
               250  64  1   1.75    0.1 1200
               300  62  1   1.7     0.1 1200
               400  61  1   1.5     0.1 1200];
        
           
           
end% donnees

for n=1:1
    
    
    
facteur_filtre = zeros(length(fct_filtre(:,1)),2);
for i=1:length(fct_filtre(:,1))
tab  = fct_filtre;
par  = [tab(i,2),   tab(i,4),   tab(i,6)]';
dpar = [tab(i,3),   tab(i,5),   0       ]';
fun  = @(x,par,y)((par(2)-par(3)/1000)/(par(1)-par(3)/1000)^-1);
facteur_filtre(i,1) = fun(1,par);
facteur_filtre(i,2) = Incertitude(1,fun,par,dpar);
end    
    
facteur_filtre;
%calcul moy%
facteur_de_reduction_moyen=mean(facteur_filtre(:,1))
sig_f_d_r_m=std(facteur_filtre(:,1))
sig_f_d_r_m=mean(facteur_filtre(:,2))
binc(fct_filtre(:,1),0.1*ones(size(fct_filtre(:,1))),facteur_filtre(:,1),facteur_filtre(:,2))


end% calcul du facteur du filtre densite neutre

for n=1:1
    
    
    
Q_courant = zeros(length(fct_courant(:,1)),2);
for i=1:length(fct_courant(:,1))
tab  = fct_courant;
par  = [tab(i,3),   tab(i,6),   tab(i,8)]';
dpar = [tab(i,4),   tab(i,7),   0       ]';
fun  = @(x,par,y)((par(2)-par(3)/1000)/(par(1)-par(3)/1000));
Q_courant(i,1) = fun(1,par);
Q_courant(i,2) = Incertitude(1,fun,par,dpar);
end
%Q_courant(5:length(fct_courant(:,1)),1)=Q_courant(5:length(fct_courant(:,1)),1)*1.75
Q_position = zeros(length(fct_position(:,1)),2);
for i=1:length(fct_position(:,1))
tab  = fct_position;
par  = [tab(i,2),   tab(i,4),   tab(i,6)]';
dpar = [tab(i,3),   tab(i,5),   0       ]';
fun  = @(x,par,y)((par(2)-par(3)/1000)/(par(1)-par(3)/1000));
Q_position(i,1) = fun(1,par);
Q_position(i,2) = Incertitude(1,fun,par,dpar);
end

Q_spectro = zeros(length(fct_spectro(:,1)),2);
for i=1:length(fct_spectro(:,1))
tab  = fct_spectro;
par  = [tab(i,2),   tab(i,4),   tab(i,6)]';
dpar = [tab(i,3),   tab(i,5),   0       ]';
fun  = @(x,par,y)((par(2)-par(3)/1000)/(par(1)-par(3)/1000));
Q_spectro(i,1) = fun(1,par);
Q_spectro(i,2) = Incertitude(1,fun,par,dpar);
end

%Q_courant
%Q_position
%Q_spectro




end% calcul des rapports Q


for m=1:1   % graphiques
%donnees=[Q_courant Q_position Q_spectro];
figure;
binc(fct_courant(:,1),ones(size(fct_courant(:,1))),Q_courant(:,1),Q_courant(:,2))
xlabel('Puissance dans la diode (mA)');
ylabel('Rapport des amplitudes des raies [A(1064)/A(808)]')
figure;
binc(fct_position(:,1),0.1*ones(size(fct_position(:,1))),Q_position(:,1),Q_position(:,2))

figure;
binc(fct_spectro(:,1),0.1*ones(size(fct_spectro(:,1))),Q_spectro(:,1),Q_spectro(:,2))

% for ii=1:3
%     figure(ii);
%     %errorbar()
%     
% end
end

