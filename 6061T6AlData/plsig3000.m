function plsig3000
close all

fig10 = figure;
set(fig10,'Position',[182 150 1131 813]);

marker = ['o';'p';'v';'s';'d';'^';'h';'<';'x';'>';'+';'*'];
color = [[0.90 0.10 0.10];[0.10 0.90 0.10];[0.10 0.10 0.90];...
           [0.75 0.25 1.00];[1.00 0.75 0.25];[0.15 0.30 0.70];...
           [0.10 0.80 0.30];[0.25 0.75 1.00];[0.66 0.60 0.00];...
           [0.60 0.20 0.00];[0.60 0.72 0.00];[0.30 0.55 0.60]];

% 
load SigEpsEp3000s298KLee.dat.raw
dat = SigEpsEp3000s298KLee;
p1 = plotSigEp(dat, marker(1,:), color(1,:));

load seq_MTS_adi_3000_298K.dat;
load ep_MTS_adi_3000_298K.dat;
seq1 = seq_MTS_adi_3000_298K;
eps1 = ep_MTS_adi_3000_298K;
e331 = eps1(:,5);
seqv1 = seq1(:,4)/1.0e6;
seqv1 = seqv1;
p2 = plot(e331, seqv1, '--','color', color(1,:), 'LineWidth', 2.5);
hold on;

% load SigEpsEp4000s298KLee.dat.raw
% dat = SigEpsEp4000s298KLee;
% p3 = plotSigEp(dat, marker(6,:), color(6,:));
%   
% load seq_MTS_adi_4000_298K.dat;
% load ep_MTS_adi_4000_298K.dat;
% seq2 = seq_MTS_adi_4000_298K;
% eps2 = ep_MTS_adi_4000_298K;
% e332 = eps2(:,5);
% seqv2 = seq2(:,4)/1.0e6;
% seqv2 = seqv2;
% p4 = plot(e332, seqv2, '--','color',color(6,:), 'LineWidth', 2.5);
% 

% load SigEpsEp8000s298KLes.dat.raw
% dat = SigEpsEp8000s298KLes;
% p8 = plotSigEp(dat, marker(1,:), color(1,:));
%   
% load seq_MTS_adi_8000_298K.dat;
% load ep_MTS_adi_8000_298K.dat;
% seq3 = seq_MTS_adi_8000_298K;
% eps3 = ep_MTS_adi_8000_298K;
% e333 = eps3(:,5);
% seqv3 = seq3(:,4)/1.0e6;
% seqv3 = seqv3;
% p9 = plot(e333, seqv3, '--','color',color(1,:), 'LineWidth', 2.5);

% load SigEpsEp29000s298KRam.dat.raw
% dat = SigEpsEp29000s298KRam;
% p7 = plotSigEp(dat, marker(9,:), color(9,:));  
% %   
% seq4 = seq_MTS_adi_29000_298K.dat;
% eps4 = ep_MTS_adi_29000_298K.dat;
% e334 = eps4(:,5);
% seqv4 = seq4(:,4)/1.0e6;
% seqv4 = seqv4;
% 
% plot(e334, seqv4, '--', 'color',color(8,:), 'LineWidth', 2.5);

set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
set(gca, 'XLim',[0 0.26],'YLim',[0 600]);
xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
title('6061-T6: Comparison of experimental data with simulations using MTS model','FontName', 'bookman', 'FontSize', 16);

%   legend([p1], '298 K 3000/s (Lee et al.)',1);
%   legend([p1,p2,p3,p4], ...
%          'Expt. Data 298 K 3000/s (Lee et al.)',...
%          'Sim. 298 K 3000/s (MTS model)',...
%          'Expt. Data 298 K 4000/s (Lee et al.)',...
%          'Sim. 298 K 4000/s (MTS model)');         
     
     legend([p1,p2], ...
         'Expt. Data 298 K 3000/s (Lee et al.)',...
         'Sim. 298 K 3000/s (MTS model)');

     


function [p] = plotSigEp(dat, marker, color )

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



