function calcVoceTheta0Theta1
  close all;
  marker = ['o';'p';'v';'s';'d';'^';'h';'<';'x';'>';'+';'*'];
  color = [[0.90 0.10 0.10];[0.10 0.90 0.10];[0.10 0.10 0.90];...
           [0.75 0.25 1.00];[1.00 0.75 0.25];[0.15 0.30 0.70];...
           [0.10 0.80 0.30];[0.25 0.75 1.00];[0.66 0.60 0.00];...
           [0.60 0.20 0.00];[0.60 0.72 0.00];[0.30 0.55 0.60]];

  fid = fopen('AlDataVoce.dat', 'w');
  plot0000Edot(fid, marker, color);
  plot0001Edot(fid, marker, color);
  plot0002Edot(fid, marker, color);
  plot01Edot(fid, marker, color);
  plot1Edot(fid, marker, color);
  plot10Edot(fid, marker, color);
  plot25Edot(fid, marker, color);
  plot55Edot(fid, marker, color);
  plot350Edot(fid, marker, color);
  plot1000Edot(fid, marker, color);
  plot2000Edot(fid, marker, color);
  plot4000Edot(fid, marker, color);
  fclose(fid);

%====================================================================
%
% Load experimental data for strain rate of 1.0e-5/s, 4.8e-5/s, 5.7e-4/s
%
function plot0000Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);
 
  siges = [161 96 75 92 80 34 94 48];

  load SigeEp000057s77KOga.dat
  dat = SigeEp000057s77KOga;
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), fid, siges(1));

  load SigeEp000057s201KOga.dat
  dat = SigeEp000057s201KOga;
  p2 = plotTangSigeSiges(dat, color(2,:), marker(2,:), fid, siges(2));

  load SigeEp000057s289KOga.dat
  dat = SigeEp000057s289KOga;
  p3 = plotTangSigeSiges(dat, color(3,:), marker(3,:), fid, siges(3));

  load SigeEp0000048s297KHog.dat
  dat = SigeEp0000048s297KHog;
  p4 = plotTangSigeSiges(dat, color(4,:), marker(4,:), fid, siges(4));

  load SigeEp000057s373KOga.dat
  dat = SigeEp000057s373KOga;
  p5 = plotTangSigeSiges(dat, color(5,:), marker(5,:), fid, siges(5));

  load SigeEp000057s473KOga.dat
  dat = SigeEp000057s473KOga;
  p6 = plotTangSigeSiges(dat, color(6,:), marker(6,:), fid, siges(6));

  load SigeEp0000010s533KHog.dat
  dat = SigeEp0000010s533KHog;
  p7 = plotTangSigeSiges(dat, color(7,:), marker(7,:), fid, siges(7));

  load SigeEp0000010s644KHog.dat
  dat = SigeEp0000010s644KHog;
  p8 = plotTangSigeSiges(dat, color(8,:), marker(8,:), fid, siges(8));

  
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
%   set(gca, 'XLim',[0 0.3], 'YLim', [-50 150]);
  set(gca, 'XLim',[-0.2 1]);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha)', 'FontName','bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p2 p3 p4 p5 p6 p7 p8], ...
         '77 K 5.7e-4/s (Ogawa)', ...
         '201 K 5.7e-4/s (Ogawa)', ...
         '289 K 5.7e-4/s (Ogawa)', ...
         '297 K 4.8e-5/s (Hoge)', ...
         '373 K 5.7e-4/s (Ogawa)', ...
         '473 K 5.7e-4/s (Ogawa)', ...
         '533 K 1.0e-5/s (Hoge)', ...
         '644 K 1.0e-5/s (Hoge)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 1.0e-3/s
%
function plot0001Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [0 120 170 116 117 113 0 78 99 0 0 8];

  load SigeEp0001s294KEle.dat
  dat = SigeEp0001s294KEle;
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), fid, siges(1));

  load SigeEp0001s295KFis.dat
  dat = SigeEp0001s295KFis;
  p2 = plotTangSigeSiges(dat, color(1,:), marker(2,:), fid, siges(2));

  load SigeEp0001s298KCad.dat
  dat = SigeEp0001s298KCad;
  p3 = plotTangSigeSiges(dat, color(1,:), marker(3,:), fid, siges(3));

  load SigeEp0001s300K01MPaDav.dat
  dat = SigeEp0001s300K01MPaDav;
  p4 = plotTangSigeSiges(dat, color(1,:), marker(4,:), fid, siges(4));

  load SigeEp0001s367K01MPaDav.dat
  dat = SigeEp0001s367K01MPaDav;
  p5 = plotTangSigeSiges(dat, color(5,:), marker(5,:), fid, siges(5));

  load SigeEp0001s422K01MPaDav.dat
  dat = SigeEp0001s422K01MPaDav;
  p6 = plotTangSigeSiges(dat, color(6,:), marker(6,:), fid, siges(6));

  load SigeEp0001s422KEle.dat
  dat = SigeEp0001s422KEle;
  p7 = plotTangSigeSiges(dat, color(6,:), marker(7,:), fid, siges(7));

  load SigeEp0001s422KGre.dat
  dat = SigeEp0001s422KGre;
  p8 = plotTangSigeSiges(dat, color(6,:), marker(8,:), fid, siges(8));

  load SigeEp0001s478K01MPaDav.dat
  dat = SigeEp0001s478K01MPaDav;
  p9 = plotTangSigeSiges(dat, color(9,:), marker(9,:), fid, siges(9));

  load SigeEp0001s478KEle.dat
  dat = SigeEp0001s478KEle;
  p10 = plotTangSigeSiges(dat, color(9,:), marker(10,:), fid, siges(10));

  load SigeEp0001s561KEle.dat
  dat = SigeEp0001s561KEle;
  p11 = plotTangSigeSiges(dat, color(11,:), marker(11,:), fid, siges(11));

  load SigeEp0001s589KGre.dat
  dat = SigeEp0001s589KGre;
  p12 = plotTangSigeSiges(dat, color(12,:), marker(12,:), fid, siges(12));

  
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.3], 'YLim', [-75 150]);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha)', 'FontName','bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12], ...
         '294 K 1.0e-3/s (Green)', ...
         '295 K 1.0e-3/s (Fish)', ...
         '298 K 1.0e-3/s (Cady)', ...
         '300 K 1.0e-3/s (Davidson)', ...
         '367 K 1.0e-3/s (Davidson)', ...
         '422 K 1.0e-3/s (Davidson)', ...
         '422 K 1.0e-3/s (Green)', ...
         '422 K 1.0e-3/s (Green)', ...
         '478 K 1.0e-3/s (Davidson)', ...
         '478 K 1.0e-3/s (Green)', ...
         '561 K 1.0e-3/s (Green)', ...
         '589 K 1.0e-3/s (Green)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 2.0e-3/s
%
function plot0002Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [115 33 17 37 0 24 0 28 0 53 30];

  load SigeEp0002s295KGre.dat
  dat = SigeEp0002s295KGre;
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), fid, siges(1));

  load SigeEp0002s298KASM.dat
  dat = SigeEp0002s298KASM;
  p2 = plotTangSigeSiges(dat, color(1,:), marker(2,:), fid, siges(2));

  load SigeEp0002s373KASM.dat
  dat = SigeEp0002s373KASM;
  p3 = plotTangSigeSiges(dat, color(2,:), marker(3,:), fid, siges(3));

  load SigeEp0002s422KASM.dat
  dat = SigeEp0002s422KASM;
  p4 = plotTangSigeSiges(dat, color(3,:), marker(4,:), fid, siges(4));

  load SigeEp0002s422KEle.dat
  dat = SigeEp0002s422KEle;
  p5 = plotTangSigeSiges(dat, color(3,:), marker(5,:), fid, siges(5));

  load SigeEp0002s477KASM.dat
  dat = SigeEp0002s477KASM;
  p6 = plotTangSigeSiges(dat, color(4,:), marker(6,:), fid, siges(6));

  load SigeEp0002s478KEle.dat
  dat = SigeEp0002s478KEle;
  p7 = plotTangSigeSiges(dat, color(4,:), marker(7,:), fid, siges(7));

  load SigeEp0002s535KASM.dat
  dat = SigeEp0002s535KASM;
  p8 = plotTangSigeSiges(dat, color(5,:), marker(8,:), fid, siges(8));

  load SigeEp0002s561KEle.dat
  dat = SigeEp0002s561KEle;
  p9 = plotTangSigeSiges(dat, color(6,:), marker(9,:), fid, siges(9));

  load SigeEp0002s589KASM.dat
  dat = SigeEp0002s589KASM;
  p10 = plotTangSigeSiges(dat, color(7,:), marker(10,:), fid, siges(10));

  load SigeEp0002s644KASM.dat
  dat = SigeEp0002s644KASM;
  p11 = plotTangSigeSiges(dat, color(8,:), marker(11,:), fid, siges(11));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.1], 'YLim', [-50 100]);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha)', 'FontName','bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11], ...
         '295 K 2.0e-3/s (Green)', ...
         '298 K 2.0e-3/s (ASMH)', ...
         '373 K 2.0e-3/s (ASMH)', ...
         '422 K 2.0e-3/s (ASMH)', ...
         '422 K 2.0e-3/s (Green)', ...
         '477 K 2.0e-3/s (ASMH)', ...
         '478 K 2.0e-3/s (Green)', ...
         '535 K 2.0e-3/s (ASMH)', ...
         '561 K 2.0e-3/s (Green)', ...
         '589 K 2.0e-3/s (ASMH)', ...
         '644 K 2.0e-3/s (ASMH)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 0.02 - 0.10 /s
%
function plot01Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [0 0 0 0 0 0 0];

  load SigeEp002s422KEle.dat
  dat = SigeEp002s422KEle;
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), fid, siges(1));

  load SigeEp0085s422KEle.dat
  dat = SigeEp0085s422KEle;
  p2 = plotTangSigeSiges(dat, color(1,:), marker(2,:), fid, siges(2));

  load SigeEp005s478KEle.dat
  dat = SigeEp005s478KEle;
  p3 = plotTangSigeSiges(dat, color(2,:), marker(3,:), fid, siges(3));

  load SigeEp002s561KEle.dat
  dat = SigeEp002s561KEle;
  p4 = plotTangSigeSiges(dat, color(3,:), marker(4,:), fid, siges(4));

  load SigeEp006s561KEle.dat
  dat = SigeEp006s561KEle;
  p5 = plotTangSigeSiges(dat, color(3,:), marker(5,:), fid, siges(5));

  load SigeEp0085s561KEle.dat
  dat = SigeEp0085s561KEle;
  p6 = plotTangSigeSiges(dat, color(3,:), marker(6,:), fid, siges(6));

  load SigeEp015s561KEle.dat
  dat = SigeEp015s561KEle;
  p7 = plotTangSigeSiges(dat, color(3,:), marker(7,:), fid, siges(7));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.1], 'YLim',[0 150]);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha)', 'FontName','bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p2 p3 p4 p5 p6 p7], ...
         '422 K 2.0e-2/s (Green)', ...
         '422 K 8.5e-2/s (Green)', ...
         '478 K 5.0e-2/s (Green)', ...
         '561 K 2.0e-2/s (Green)', ...
         '561 K 6.0e-2/s (Green)', ...
         '561 K 8.5e-2/s (Green)', ...
         '561 K 15.0e-2/s (Green)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 1.0/s
%
function plot1Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [0 0 0 0];

  load SigeEp11s422KEle.dat
  dat = SigeEp11s422KEle;
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), fid, siges(1));

  load SigeEp075s478KEle.dat
  dat = SigeEp075s478KEle;
  p2 = plotTangSigeSiges(dat, color(2,:), marker(2,:), fid, siges(2));

  load SigeEp070s561KEle.dat
  dat = SigeEp070s561KEle;
  p3 = plotTangSigeSiges(dat, color(3,:), marker(3,:), fid, siges(3));

  load SigeEp12s561KEle.dat
  dat = SigeEp12s561KEle;
  p4 = plotTangSigeSiges(dat, color(3,:), marker(4,:), fid, siges(4));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.1], 'YLim', [0 150]);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha)', 'FontName','bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p2 p3 p4], ...
         '422 K 1.10/s (Green)', ...
         '478 K 0.75/s (Green)', ...
         '561 K 0.70/s (Green)', ...
         '561 K 1.20/s (Green)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 10.0/s
%
function plot10Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [0 66 0 31];

  load SigeEp85s422KEle.dat
  dat = SigeEp85s422KEle;
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), fid, siges(1));

  load SigeEp9s422KGre.dat
  dat = SigeEp9s422KGre;
  p2 = plotTangSigeSiges(dat, color(1,:), marker(2,:), fid, siges(2));

  load SigeEp5s478KEle.dat
  dat = SigeEp5s478KEle;
  p3 = plotTangSigeSiges(dat, color(2,:), marker(3,:), fid, siges(3));

  load SigeEp10s589KGre.dat
  dat = SigeEp10s589KGre;
  p4 = plotTangSigeSiges(dat, color(3,:), marker(4,:), fid, siges(4));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.1]);
    xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha)', 'FontName','bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p2 p3 p4], ...
         '422 K 8.5/s (Green)', ...
         '422 K 9.0/s (Green)', ...
         '478 K 5.0/s (Green)', ...
         '589 K 10.0/s (Green)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 25.0/s
%
function plot25Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [120 92 0 0 125 100];

  load SigeEp18s295KGre.dat
  dat = SigeEp18s295KGre;
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), fid, siges(1));

  load SigeEp28s297KHog.dat
  dat = SigeEp28s297KHog;
  p2 = plotTangSigeSiges(dat, color(1,:), marker(2,:), fid, siges(2));

  load SigeEp30s422KEle.dat
  dat = SigeEp30s422KEle;
  p3 = plotTangSigeSiges(dat, color(2,:), marker(3,:), fid, siges(3));

  load SigeEp30s478KEle.dat
  dat = SigeEp30s478KEle;
  p4 = plotTangSigeSiges(dat, color(3,:), marker(4,:), fid, siges(4));

  load SigeEp18s533KHog.dat
  dat = SigeEp18s533KHog;
  p5 = plotTangSigeSiges(dat, color(4,:), marker(5,:), fid, siges(5));

  load SigeEp23s644KHog.dat
  dat = SigeEp23s644KHog;
  p6 = plotTangSigeSiges(dat, color(5,:), marker(6,:), fid, siges(6));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.1], 'YLim', [0 150]);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha)', 'FontName','bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p2 p3 p4 p5 p6], ...
         '295 K 18/s (Green)', ...
         '297 K 28/s (Hoge)', ...
         '422 K 30/s (Green)', ...
         '478 K 30/s (Green)', ...
         '533 K 18/s (Hoge)', ...
         '644 K 23/s (Hoge)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 55.0/s
%
function plot55Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [75 0 85];

  load SigeEp65s297KHog.dat
  dat = SigeEp65s297KHog;
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), fid, siges(1));

  load SigeEp50s561KEle.dat
  dat = SigeEp50s561KEle;
  p2 = plotTangSigeSiges(dat, color(2,:), marker(2,:), fid, siges(2));

  load SigeEp54s644KHog.dat
  dat = SigeEp54s644KHog;
  p3 = plotTangSigeSiges(dat, color(3,:), marker(3,:), fid, siges(3));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.1], 'YLim', [0 100]);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha)', 'FontName','bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p2 p3], ...
         '297 K 65/s (Hoge)', ...
         '561 K 50/s (Green)', ...
         '644 K 54/s (Hoge)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 350.0/s
%
function plot350Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [205 245 115];

  load SigeEp380s298KYad.dat
  dat = SigeEp380s298KYad;
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), fid, siges(1));

  load SigeEp500s298KYad.dat
  dat = SigeEp500s298KYad;
  p2 = plotTangSigeSiges(dat, color(1,:), marker(2,:), fid, siges(2));

  load SigeEp130s533KHog.dat
  dat = SigeEp130s533KHog;
  p3 = plotTangSigeSiges(dat, color(2,:), marker(3,:), fid, siges(3));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.2], 'YLim', [0 200]);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha)', 'FontName','bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p2 p3], ...
         '298 K 380/s (Yadav)', ...
         '298 K 500/s (Yadav)', ...
         '644 K 130/s (Hoge)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 1000.0/s
%
function plot1000Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [0 125 130 0 134 0 0 0 0 131];

  load SigeEp1000s294KEle.dat
  dat = SigeEp1000s294KEle;
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), fid, siges(1));

  load SigeEp1000s298KLee.dat
  dat = SigeEp1000s298KLee;
  p2 = plotTangSigeSiges(dat, color(1,:), marker(2,:), fid, siges(2));

  load SigeEp1000s298KRos.dat
  dat = SigeEp1000s298KRos;
  p3 = plotTangSigeSiges(dat, color(1,:), marker(3,:), fid, siges(3));

  load SigeEp1000s422KEle.dat
  dat = SigeEp1000s422KEle;
  p4 = plotTangSigeSiges(dat, color(2,:), marker(4,:), fid, siges(4));

  load SigeEp1000s463KRos.dat
  dat = SigeEp1000s463KRos;
  p5 = plotTangSigeSiges(dat, color(3,:), marker(5,:), fid, siges(5));

  load SigeEp900s478KEle.dat
  dat = SigeEp900s478KEle;
  p6 = plotTangSigeSiges(dat, color(4,:), marker(6,:), fid, siges(6));

  load SigeEp1000s478KEle.dat
  dat = SigeEp1000s478KEle;
  p7 = plotTangSigeSiges(dat, color(4,:), marker(7,:), fid, siges(7));

  load SigeEp1000s561KEle.dat
  dat = SigeEp1000s561KEle;
  p8 = plotTangSigeSiges(dat, color(5,:), marker(8,:), fid, siges(8));

  load SigeEp1150s561KEle.dat
  dat = SigeEp1150s561KEle;
  p9 = plotTangSigeSiges(dat, color(5,:), marker(9,:), fid, siges(9));

  load SigeEp1000s618KRos.dat
  dat = SigeEp1000s618KRos;
  p10 = plotTangSigeSiges(dat, color(6,:), marker(10,:), fid, siges(10));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.26], 'YLim', [0 150]);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha)', 'FontName','bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p2 p3 p4 p5 p6 p7 p8 p9 p10], ...
         '294 K 1000/s (Green)', ...
         '298 K 1000/s (Lee)', ...
         '298 K 1000/s (Rosenberg)', ...
         '422 K 1000/s (Green)', ...
         '463 K 1000/s (Rosenberg)', ...
         '478 K 900/s (Green)', ...
         '478 K 1000/s (Green)', ...
         '561 K 1000/s (Green)', ...
         '561 K 1150/s (Green)', ...
         '618 K 1000/s (Rosenberg)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 2000.0/s
%
function plot2000Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [195 131 87.5 175 112 180 97 80];

  load SigeEp1500s77KOga.dat
  dat = SigeEp1500s77KOga;
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), fid, siges(1));

  load SigeEp1500s201KOga.dat
  dat = SigeEp1500s201KOga;
  p2 = plotTangSigeSiges(dat, color(2,:), marker(2,:), fid, siges(2));

  load SigeEp1500s289KOga.dat
  dat = SigeEp1500s289KOga;
  p3 = plotTangSigeSiges(dat, color(3,:), marker(3,:), fid, siges(3));

  load SigeEp2500s295KFis.dat
  dat = SigeEp2500s295KFis;
  p4 = plotTangSigeSiges(dat, color(4,:), marker(4,:), fid, siges(4));

  load SigeEp2000s298KLee.dat
  dat = SigeEp2000s298KLee;
  p5 = plotTangSigeSiges(dat, color(4,:), marker(5,:), fid, siges(5));

  load SigeEp2000s298KYad.dat
  dat = SigeEp2000s298KYad;
  p6 = plotTangSigeSiges(dat, color(4,:), marker(6,:), fid, siges(6));

  load SigeEp1500s373KOga.dat
  dat = SigeEp1500s373KOga;
  p7 = plotTangSigeSiges(dat, color(5,:), marker(7,:), fid, siges(7));

  load SigeEp1500s473KOga.dat
  dat = SigeEp1500s473KOga;
  p8 = plotTangSigeSiges(dat, color(6,:), marker(8,:), fid, siges(8));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.25], 'YLim', [-50 200]);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha)', 'FontName','bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p2 p3 p4 p5 p6 p7 p8], ...
         '77 K 1500/s (Ogawa)', ...
         '201 K 1500/s (Ogawa)', ...
         '289 K 1500/s (Ogawa)', ...
         '295 K 2500/s (Fish)', ...
         '298 K 2000/s (Lee)', ...
         '298 K 2000/s (Yadav)', ...
         '373 K 1500/s (Ogawa)', ...
         '473 K 1500/s (Ogawa)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 4000.0/s
%
function plot4000Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [120 170 99 110 127 166 97];

  load SigeEp3000s298KLee.dat
  dat = SigeEp3000s298KLee;
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), fid, siges(1));

  load SigeEp3600s298KYad.dat
  dat = SigeEp3600s298KYad;
  p2 = plotTangSigeSiges(dat, color(2,:), marker(2,:), fid, siges(2));

  load SigeEp4000s298KCad.dat
  dat = SigeEp4000s298KCad;
  p3 = plotTangSigeSiges(dat, color(3,:), marker(3,:), fid, siges(3));

  load SigeEp4000s298KLee.dat
  dat = SigeEp4000s298KLee;
  p4 = plotTangSigeSiges(dat, color(3,:), marker(4,:), fid, siges(4));

  load SigeEp4000s298KLes.dat
  dat = SigeEp4000s298KLes;
  p5 = plotTangSigeSiges(dat, color(3,:), marker(5,:), fid, siges(5));

  load SigeEp8000s298KLes.dat
  dat = SigeEp8000s298KLes;
  p6 = plotTangSigeSiges(dat, color(4,:), marker(6,:), fid, siges(6));

  load SigeEp29000s298KRam.dat
  dat = SigeEp29000s298KRam;
  p7 = plotTangSigeSiges(dat, color(5,:), marker(7,:), fid, siges(7));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.5], 'YLim', [-50 200]);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha)', 'FontName','bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p2 p3 p4 p5 p6 p7], ...
         '298 K 3000/s (Lee)', ...
         '298 K 3600/s (Yadav)', ...
         '298 K 4000/s (Cady)', ...
         '298 K 4000/s (Lee)', ...
         '298 K 4000/s (Lesuer)', ...
         '298 K 8000/s (Lesuer)', ...
         '298 K 29000/s (Ramesh)');
  %axis square;
  grid on;

%=======================================================================
% Plot stress-strain curves 
% and write intersection point 
%
function [p] = plotTangSigeSiges(dat, color, marker, fid, sig_es)

  %
  % Load data
  %
  ep = dat(:,1);
  sige = dat(:,2);
  Tall = dat(:,3);
  edot = dat(1,4);
  T0 = dat(1,5);
  P = dat(1,6);
  alpha = 2;

  %
  %  Get rid of the data points where sig_e <= 0
  %
  count = 1;
%   eplas(count) = 0.0;
%   sig_e(count) = 0.0;
%   T(count) = T0;
  for i=1:length(ep)
    if (sige(i) > 0)
      eplas(count) = ep(i);
      sig_e(count) = sige(i);
      T(count) = Tall(i);
      count = count + 1;
    end
  end

  %
  % If we can't figure out sigma_es just take the last point
  % on the sigma_e vs ep curve
  %
  if (sig_es == 0)
    sig_es = sige(length(sige));
 end
  
  
  %
  % Compute tangent modulus
  %
  for i=1:length(eplas)-1
    dep = eplas(i+1) - eplas(i);
    dsig = sig_e(i+1) - sig_e(i);
    theta(i) = dsig/dep;
    sigma_e(i) = 0.5*(sig_e(i+1) + sig_e(i));
    Temp(i) = 0.5*(T(i+1) + T(i));
  end
  
  count1 = 1;
  for i=1:length(theta)
    if (theta(i) > 0)
        theta1(count1) = theta(i);
        sig_e1(count1) = sig_e(i);
        count1 = count1 + 1;
    end
  end
     

  %
  %Compute tanh term
  %
  for i = 1:length(theta1)
      temp = tanh(alpha*sig_e1(i)/sig_es);
      xx(i) = temp/tanh(alpha);
  end
  
  %   
  %Remove the first point if necessary   
  %   
  %
  % Plot data
  %
  p = plot(xx, theta1, 'p-', 'LineWidth', 2); hold on;
  set(p,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);
  
  [C,S] = polyfit(xx,theta1,1);
  theta0 = C(2);
  theta1 = C(1) + C(2);
  xmin = 0;
  xmax = 1.0;
  nx = 2;
  dx = xmax/nx;
  for i=1:nx+1
    xfit(i) = xmin + (i-1)*dx;
    yfit(i) = C(2) + C(1)*xfit(i);
  end
  p1 = plot(xfit, yfit, 'b--', 'LineWidth', 3); hold on;
  set(p1,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);          

  
  
  %
  % Write data
  %
  fprintf(fid,'%g %g %g %g\n', theta0, theta1, T0, edot);
  test = 0;

    
  
  
  
  
