function plsig2000
% % close all

fig10 = figure;
set(fig10,'Position',[182 150 1131 813]);

marker = ['o';'p';'v';'s';'d';'^';'h';'<';'x';'>';'+';'*'];
color = [[0.90 0.10 0.10];[0.10 0.90 0.10];[0.10 0.10 0.90];...
           [0.75 0.25 1.00];[1.00 0.75 0.25];[0.15 0.30 0.70];...
           [0.10 0.80 0.30];[0.25 0.75 1.00];[0.66 0.60 0.00];...
           [0.60 0.20 0.00];[0.60 0.72 0.00];[0.30 0.55 0.60]];

sig0 = [325 270 260 315 340 310 240 230];
% 
load SigEpsEp1500s77KOga.dat.raw
dat = SigEpsEp1500s77KOga;
p1 = plotSigEp(dat, marker(1,:), color(1,:), sig0(1));

load seq_MTS_adi_1500_77K.dat;
load ep_MTS_adi_1500_77K.dat;
seq1 = seq_MTS_adi_1500_77K;
eps1 = ep_MTS_adi_1500_77K;
e331 = eps1(:,5);
seqv1 = seq1(:,4)/1.0e6;
seqv1 = seqv1;
p2 = plot(e331, seqv1, '-','color', color(1,:), 'LineWidth', 2.5);
hold on;

load SigEpsEp2000s298KLee.dat.raw
dat = SigEpsEp2000s298KLee;
p6 = plotSigEp(dat, marker(6,:), color(6,:), sig0(6));
  
load seq_MTS_adi_2000_298K.dat;
load ep_MTS_adi_2000_298K.dat;
seq2 = seq_MTS_adi_2000_298K;
eps2 = ep_MTS_adi_2000_298K;
e332 = eps2(:,5);
seqv2 = seq2(:,4)/1.0e6;
seqv2 = seqv2;
p7 = plot(e332, seqv2, '--','color',color(6,:), 'LineWidth', 2.5);


load SigEpsEp1500s473KOga.dat.raw
dat = SigEpsEp1500s473KOga;
p8 = plotSigEp(dat, marker(8,:), color(8,:), sig0(8));
  
load seq_MTS_adi_1500_473K.dat;
load ep_MTS_adi_1500_473K.dat;
seq3 = seq_MTS_adi_1500_473K;
eps3 = ep_MTS_adi_1500_473K;
e333 = eps3(:,5);
seqv3 = seq3(:,4)/1.0e6;
seqv3 = seqv3;

p9 = plot(e333, seqv3, '-.', 'color',color(8,:), 'LineWidth', 2.5);

set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.25],'YLim',[0 750]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
%   title('6061-T6 Al: Comparison of experimental data with simulations using MTS model','FontName', 'bookman', 'FontSize', 14);

  legend([p1 p2 p6 p7 p8 p9], ...
         'Expt. 77 K 1500/s (Lee et al.)', ...
         'Simu. 77 K 1500/s (MTS model)', ...       
         'Expt. 298 K 2000/s (Lee et al.)', ...
         'Simu. 298 K 2000/s (MTS model)', ...         
         'Expt. 373 K 1500/s (Ogawa)', ...                  
         'Simu. 373 K 1500/s (MTS model)');         
    
     
%      legend([p1 p6 p8], ...
%          '77 K 1500/s (Ogawa)', ...
%          '298 K 2000/s (Yadav et al.)', ...
%          '473 K 1500/s (Ogawa)',1);
%   axis square;


function [p] = plotSigEp(dat, marker, color , sig0)

  P = dat(1,1);
  T = dat(1,2);
  edot = dat(1,3);
  epEx = dat(:,5);
  seqEx = dat(:,6);
  p = plot(epEx, seqEx, 'p-', 'LineWidth', 2.5); hold on;
  set(p,'LineWidth',2.5,'Color',color,'MarkerSize',8,'Marker',marker);

  ep = 0.0;
%   p1 = plot(ep, sig0,'x','MarkerSize', 13, 'LineWidth', 2);
%   set(p1, 'Color', color);



