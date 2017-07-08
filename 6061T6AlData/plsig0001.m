function plsig0001
close all

fig10 = figure;
set(fig10,'Position',[182 150 1131 813]);

marker = ['o';'p';'v';'s';'d';'^';'h';'<';'x';'>';'+';'*'];
color = [[0.90 0.10 0.10];[0.10 0.90 0.10];[0.10 0.10 0.90];...
           [0.75 0.25 1.00];[1.00 0.75 0.25];[0.15 0.30 0.70];...
           [0.10 0.80 0.30];[0.25 0.75 1.00];[0.66 0.60 0.00];...
           [0.60 0.20 0.00];[0.60 0.72 0.00];[0.30 0.55 0.60]];

% 
load SigEpsEp0001s300K01MPaDav.dat.raw
dat = SigEpsEp0001s300K01MPaDav;
p1 = plotSigEp(dat, marker(1,:), color(1,:));

load seq_MTS_iso_0001_300K.dat;
load ep_MTS_iso_0001_300K.dat;
seq1 = seq_MTS_iso_0001_300K;
eps1 = ep_MTS_iso_0001_300K;
e331 = eps1(:,5);
seqv1 = seq1(:,4)/1.0e6;
seqv1 = seqv1;
p2 = plot(e331, seqv1, '--','color', color(1,:), 'LineWidth', 2.5);
hold on;

load SigEpsEp0001s367K01MPaDav.dat.raw
dat = SigEpsEp0001s367K01MPaDav;
p3 = plotSigEp(dat, marker(4,:), color(4,:));
  
load seq_MTS_iso_0001_367K.dat;
load ep_MTS_iso_0001_367K.dat;
seq2 = seq_MTS_iso_0001_367K;
eps2 = ep_MTS_iso_0001_367K;
e332 = eps2(:,5);
seqv2 = seq2(:,4)/1.0e6;
seqv2 = seqv2;
p4 = plot(e332, seqv2, '-.','color',color(4,:), 'LineWidth', 2.5);
% 
% 
load SigEpsEp0001s478K01MPaDav.dat.raw
dat = SigEpsEp0001s478K01MPaDav;
p5 = plotSigEp(dat, marker(3,:), color(3,:));
  

load seq_MTS_iso_0001_478K.dat;
load ep_MTS_iso_0001_478K.dat;
seq3 = seq_MTS_iso_0001_478K;
eps3 = ep_MTS_iso_0001_478K;
e333 = eps3(:,5);
seqv3 = seq3(:,4)/1.0e6;
seqv3 = seqv3;
p6 = plot(e333, seqv3, '-','color',color(3,:), 'LineWidth', 2.5);


load SigEpsEp0001s589KGre.dat.raw
dat = SigEpsEp0001s589KGre;
p7 = plotSigEp(dat, marker(9,:), color(9,:));  
%   

load seq_MTS_iso_0001_589K.dat;
load ep_MTS_iso_0001_589K.dat;

seq4 = seq_MTS_iso_0001_589K;
eps4 = ep_MTS_iso_0001_589K;
e334 = eps4(:,5);
seqv4 = seq4(:,4)/1.0e6;
seqv4 = seqv4;

p8 = plot(e334, seqv4, '--', 'color',color(9,:), 'LineWidth', 2.5);

set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
set(gca, 'XLim',[0 0.13],'YLim',[0 620]);
xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
% title('6061-T6 Al: Comparison of experimental data with simulations using MTS model','FontName', 'bookman', 'FontSize', 14);

     legend([p1 p2 p3 p4 p5 p6 p7 p8], ...
         'Expt. 300K 0.001/s (Davidson))', ...
         'Sim. MTS model 300K 0.001/s',...
         'Expt. 367K 0.001/s (Davidson)', ...
         'Sim. MTS model 367K 0.001/s',...
         'Expt. 478K 0.001/s (Davidson)', ...
         'Sim. MTS model 478K 0.001/s',...
         'Expt. 589K 0.001/s (Green))', ...
         'Sim. MTS model 589K 0.001/s');
%   axis square;


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



