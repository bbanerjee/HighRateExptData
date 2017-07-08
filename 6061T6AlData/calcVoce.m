function calcVoce
  close all;
  marker = ['o';'p';'v';'s';'d';'^';'h';'<';'x';'>';'+';'*'];
  color = [[0.90 0.10 0.10];[0.10 0.90 0.10];[0.10 0.10 0.90];...
           [0.75 0.25 1.00];[1.00 0.75 0.25];[0.15 0.30 0.70];...
           [0.10 0.80 0.30];[0.25 0.75 1.00];[0.66 0.60 0.00];...
           [0.60 0.20 0.00];[0.60 0.72 0.00];[0.30 0.55 0.60]];

  plot0000Edot(marker, color);
  plot0001Edot(marker, color);
  plot0002Edot(marker, color);
  plot01Edot(marker, color);
  plot1Edot(marker, color);
  plot10Edot(marker, color);
  plot25Edot(marker, color);
  plot55Edot(marker, color);
  plot350Edot(marker, color);
  plot1000Edot(marker, color);
  plot2000Edot(marker, color);
  plot4000Edot(marker, color);

%====================================================================
%
% Load experimental data for strain rate of 1.0e-5/s, 4.8e-5/s, 5.7e-4/s
%
function plot0000Edot(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);
 
  siges = [142 74 52 60 48 17.5 39 15];

  load SigeEp000057s77KOga.dat
  dat = SigeEp000057s77KOga;
  filename = 'TangSige000057s77KOga.dat';
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), filename, siges(1));

  load SigeEp000057s201KOga.dat
  dat = SigeEp000057s201KOga;
  filename = 'TangSige000057s201KOga.dat';
  p2 = plotTangSigeSiges(dat, color(2,:), marker(2,:), filename, siges(2));

  load SigeEp000057s289KOga.dat
  dat = SigeEp000057s289KOga;
  filename = 'TangSige000057s289KOga.dat';
  p3 = plotTangSigeSiges(dat, color(3,:), marker(3,:), filename, siges(3));

  load SigeEp0000048s297KHog.dat
  dat = SigeEp0000048s297KHog;
  filename = 'TangSige0000048s297KHog.dat';
  p4 = plotTangSigeSiges(dat, color(4,:), marker(4,:), filename, siges(4));

  load SigeEp000057s373KOga.dat
  dat = SigeEp000057s373KOga;
  filename = 'TangSige000057s373KOga.dat';
  p5 = plotTangSigeSiges(dat, color(5,:), marker(5,:), filename, siges(5));

  load SigeEp000057s473KOga.dat
  dat = SigeEp000057s473KOga;
  filename = 'TangSige000057s473KOga.dat';
  p6 = plotTangSigeSiges(dat, color(6,:), marker(6,:), filename, siges(6));

  load SigeEp0000010s533KHog.dat
  dat = SigeEp0000010s533KHog;
  filename = 'TangSige0000010s533KHog.dat';
  p7 = plotTangSigeSiges(dat, color(7,:), marker(7,:), filename, siges(7));

  load SigeEp0000010s644KHog.dat
  dat = SigeEp0000010s644KHog;
  filename = 'TangSige0000010s644KHog.dat';
  p8 = plotTangSigeSiges(dat, color(8,:), marker(8,:), filename, siges(8));

  
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.3], 'YLim', [-50 150]);
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
function plot0001Edot(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [0 80 120 80 71 63 0 43 50 0 30 3];

  load SigeEp0001s294KEle.dat
  dat = SigeEp0001s294KEle;
  filename = 'TangSige0001s294KEle.dat';
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), filename, siges(1));

  load SigeEp0001s295KFis.dat
  dat = SigeEp0001s295KFis;
  filename = 'TangSige0001s295KFis.dat';
  p2 = plotTangSigeSiges(dat, color(1,:), marker(2,:), filename, siges(2));

  load SigeEp0001s298KCad.dat
  dat = SigeEp0001s298KCad;
  filename = 'TangSige0001s298KCad.dat';
  p3 = plotTangSigeSiges(dat, color(1,:), marker(3,:), filename, siges(3));

  load SigeEp0001s300K01MPaDav.dat
  dat = SigeEp0001s300K01MPaDav;
  filename = 'TangSige0001s300K01MPaDav.dat';
  p4 = plotTangSigeSiges(dat, color(1,:), marker(4,:), filename, siges(4));

  load SigeEp0001s367K01MPaDav.dat
  dat = SigeEp0001s367K01MPaDav;
  filename = 'TangSige0001s367K01MPaDav.dat';
  p5 = plotTangSigeSiges(dat, color(5,:), marker(5,:), filename, siges(5));

  load SigeEp0001s422K01MPaDav.dat
  dat = SigeEp0001s422K01MPaDav;
  filename = 'TangSige0001s422K01MPaDav.dat';
  p6 = plotTangSigeSiges(dat, color(6,:), marker(6,:), filename, siges(6));

  load SigeEp0001s422KEle.dat
  dat = SigeEp0001s422KEle;
  filename = 'TangSige0001s422KEle.dat';
  p7 = plotTangSigeSiges(dat, color(6,:), marker(7,:), filename, siges(7));

  load SigeEp0001s422KGre.dat
  dat = SigeEp0001s422KGre;
  filename = 'TangSige0001s422KGre.dat';
  p8 = plotTangSigeSiges(dat, color(6,:), marker(8,:), filename, siges(8));

  load SigeEp0001s478K01MPaDav.dat
  dat = SigeEp0001s478K01MPaDav;
  filename = 'TangSige0001s478K01MPaDav.dat';
  p9 = plotTangSigeSiges(dat, color(9,:), marker(9,:), filename, siges(9));

  load SigeEp0001s478KEle.dat
  dat = SigeEp0001s478KEle;
  filename = 'TangSige0001s478KEle.dat';
  p10 = plotTangSigeSiges(dat, color(9,:), marker(10,:), filename, siges(10));

  load SigeEp0001s561KEle.dat
  dat = SigeEp0001s561KEle;
  filename = 'TangSige0001s561KEle.dat';
  p11 = plotTangSigeSiges(dat, color(11,:), marker(11,:), filename, siges(11));

  load SigeEp0001s589KGre.dat
  dat = SigeEp0001s589KGre;
  filename = 'TangSige0001s589KGre.dat';
  p12 = plotTangSigeSiges(dat, color(12,:), marker(12,:), filename, siges(12));

  
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
function plot0002Edot(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [72 25 11 23 90 13 80 15 45 21 0];

  load SigeEp0002s295KGre.dat
  dat = SigeEp0002s295KGre;
  filename = 'TangSige0002s295KGre.dat';
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), filename, siges(1));

  load SigeEp0002s298KASM.dat
  dat = SigeEp0002s298KASM;
  filename = 'TangSige0002s298KASM.dat';
  p2 = plotTangSigeSiges(dat, color(1,:), marker(2,:), filename, siges(2));

  load SigeEp0002s373KASM.dat
  dat = SigeEp0002s373KASM;
  filename = 'TangSige0002s373KASM.dat';
  p3 = plotTangSigeSiges(dat, color(2,:), marker(3,:), filename, siges(3));

  load SigeEp0002s422KASM.dat
  dat = SigeEp0002s422KASM;
  filename = 'TangSige0002s422KASM.dat';
  p4 = plotTangSigeSiges(dat, color(3,:), marker(4,:), filename, siges(4));

  load SigeEp0002s422KEle.dat
  dat = SigeEp0002s422KEle;
  filename = 'TangSige0002s422KEle.dat';
  p5 = plotTangSigeSiges(dat, color(3,:), marker(5,:), filename, siges(5));

  load SigeEp0002s477KASM.dat
  dat = SigeEp0002s477KASM;
  filename = 'TangSige0002s477KASM.dat';
  p6 = plotTangSigeSiges(dat, color(4,:), marker(6,:), filename, siges(6));

  load SigeEp0002s478KEle.dat
  dat = SigeEp0002s478KEle;
  filename = 'TangSige0002s478KEle.dat';
  p7 = plotTangSigeSiges(dat, color(4,:), marker(7,:), filename, siges(7));

  load SigeEp0002s535KASM.dat
  dat = SigeEp0002s535KASM;
  filename = 'TangSige0002s535KASM.dat';
  p8 = plotTangSigeSiges(dat, color(5,:), marker(8,:), filename, siges(8));

  load SigeEp0002s561KEle.dat
  dat = SigeEp0002s561KEle;
  filename = 'TangSige0002s561KEle.dat';
  p9 = plotTangSigeSiges(dat, color(6,:), marker(9,:), filename, siges(9));

  load SigeEp0002s589KASM.dat
  dat = SigeEp0002s589KASM;
  filename = 'TangSige0002s589KASM.dat';
  p10 = plotTangSigeSiges(dat, color(7,:), marker(10,:), filename, siges(10));

  load SigeEp0002s644KASM.dat
  dat = SigeEp0002s644KASM;
  filename = 'TangSige0002s644KASM.dat';
  p11 = plotTangSigeSiges(dat, color(8,:), marker(11,:), filename, siges(11));

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
function plot01Edot(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [0 0 0 0 0 0 0];

  load SigeEp002s422KEle.dat
  dat = SigeEp002s422KEle;
  filename = 'TangSige002s422KEle.dat';
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), filename, siges(1));

  load SigeEp0085s422KEle.dat
  dat = SigeEp0085s422KEle;
  filename = 'TangSige0085s422KEle.dat';
  p2 = plotTangSigeSiges(dat, color(1,:), marker(2,:), filename, siges(2));

  load SigeEp005s478KEle.dat
  dat = SigeEp005s478KEle;
  filename = 'TangSige005s478KEle.dat';
  p3 = plotTangSigeSiges(dat, color(2,:), marker(3,:), filename, siges(3));

  load SigeEp002s561KEle.dat
  dat = SigeEp002s561KEle;
  filename = 'TangSige002s561KEle.dat';
  p4 = plotTangSigeSiges(dat, color(3,:), marker(4,:), filename, siges(4));

  load SigeEp006s561KEle.dat
  dat = SigeEp006s561KEle;
  filename = 'TangSige006s561KEle.dat';
  p5 = plotTangSigeSiges(dat, color(3,:), marker(5,:), filename, siges(5));

  load SigeEp0085s561KEle.dat
  dat = SigeEp0085s561KEle;
  filename = 'TangSige0085s561KEle.dat';
  p6 = plotTangSigeSiges(dat, color(3,:), marker(6,:), filename, siges(6));

  load SigeEp015s561KEle.dat
  dat = SigeEp015s561KEle;
  filename = 'TangSige015s561KEle.dat';
  p7 = plotTangSigeSiges(dat, color(3,:), marker(7,:), filename, siges(7));

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
function plot1Edot(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [0 0 0 0];

  load SigeEp11s422KEle.dat
  dat = SigeEp11s422KEle;
  filename = 'TangSige11s422KEle.dat';
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), filename, siges(1));

  load SigeEp075s478KEle.dat
  dat = SigeEp075s478KEle;
  filename = 'TangSige075s478KEle.dat';
  p2 = plotTangSigeSiges(dat, color(2,:), marker(2,:), filename, siges(2));

  load SigeEp070s561KEle.dat
  dat = SigeEp070s561KEle;
  filename = 'TangSige070s561KEle.dat';
  p3 = plotTangSigeSiges(dat, color(3,:), marker(3,:), filename, siges(3));

  load SigeEp12s561KEle.dat
  dat = SigeEp12s561KEle;
  filename = 'TangSige12s561KEle.dat';
  p4 = plotTangSigeSiges(dat, color(3,:), marker(4,:), filename, siges(4));

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
function plot10Edot(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [0 42 0 14.5];

  load SigeEp85s422KEle.dat
  dat = SigeEp85s422KEle;
  filename = 'TangSige85s422KEle.dat';
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), filename, siges(1));

  load SigeEp9s422KGre.dat
  dat = SigeEp9s422KGre;
  filename = 'TangSige9s422KGre.dat';
  p2 = plotTangSigeSiges(dat, color(1,:), marker(2,:), filename, siges(2));

  load SigeEp5s478KEle.dat
  dat = SigeEp5s478KEle;
  filename = 'TangSige5s478KEle.dat';
  p3 = plotTangSigeSiges(dat, color(2,:), marker(3,:), filename, siges(3));

  load SigeEp10s589KGre.dat
  dat = SigeEp10s589KGre;
  filename = 'TangSige10s589KGre.dat';
  p4 = plotTangSigeSiges(dat, color(3,:), marker(4,:), filename, siges(4));

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
function plot25Edot(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [80 65 0 0 63 43];

  load SigeEp18s295KGre.dat
  dat = SigeEp18s295KGre;
  filename = 'TangSige18s295KGre.dat';
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), filename, siges(1));

  load SigeEp28s297KHog.dat
  dat = SigeEp28s297KHog;
  filename = 'TangSige28s297KHog.dat';
  p2 = plotTangSigeSiges(dat, color(1,:), marker(2,:), filename, siges(2));

  load SigeEp30s422KEle.dat
  dat = SigeEp30s422KEle;
  filename = 'TangSige30s422KEle.dat';
  p3 = plotTangSigeSiges(dat, color(2,:), marker(3,:), filename, siges(3));

  load SigeEp30s478KEle.dat
  dat = SigeEp30s478KEle;
  filename = 'TangSige30s478KEle.dat';
  p4 = plotTangSigeSiges(dat, color(3,:), marker(4,:), filename, siges(4));

  load SigeEp18s533KHog.dat
  dat = SigeEp18s533KHog;
  filename = 'TangSige18s533KHog.dat';
  p5 = plotTangSigeSiges(dat, color(4,:), marker(5,:), filename, siges(5));

  load SigeEp23s644KHog.dat
  dat = SigeEp23s644KHog;
  filename = 'TangSige23s644KHog.dat';
  p6 = plotTangSigeSiges(dat, color(5,:), marker(6,:), filename, siges(6));

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
function plot55Edot(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [55 0 35];

  load SigeEp65s297KHog.dat
  dat = SigeEp65s297KHog;
  filename = 'TangSige65s297KHog.dat';
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), filename, siges(1));

  load SigeEp50s561KEle.dat
  dat = SigeEp50s561KEle;
  filename = 'TangSige50s561KEle.dat';
  p2 = plotTangSigeSiges(dat, color(2,:), marker(2,:), filename, siges(2));

  load SigeEp54s644KHog.dat
  dat = SigeEp54s644KHog;
  filename = 'TangSige54s644KHog.dat';
  p3 = plotTangSigeSiges(dat, color(3,:), marker(3,:), filename, siges(3));

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
function plot350Edot(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [149 165 62];

  load SigeEp380s298KYad.dat
  dat = SigeEp380s298KYad;
  filename = 'TangSige380s298KYad.dat';
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), filename, siges(1));

  load SigeEp500s298KYad.dat
  dat = SigeEp500s298KYad;
  filename = 'TangSige500s298KYad.dat';
  p2 = plotTangSigeSiges(dat, color(1,:), marker(2,:), filename, siges(2));

  load SigeEp130s533KHog.dat
  dat = SigeEp130s533KHog;
  filename = 'TangSige130s533KHog.dat';
  p3 = plotTangSigeSiges(dat, color(2,:), marker(3,:), filename, siges(3));

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
function plot1000Edot(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [0 95 96 0 82 0 0 0 0 63];

  load SigeEp1000s294KEle.dat
  dat = SigeEp1000s294KEle;
  filename = 'TangSige1000s294KEle.dat';
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), filename, siges(1));

  load SigeEp1000s298KLee.dat
  dat = SigeEp1000s298KLee;
  filename = 'TangSige1000s298KLee.dat';
  p2 = plotTangSigeSiges(dat, color(1,:), marker(2,:), filename, siges(2));

  load SigeEp1000s298KRos.dat
  dat = SigeEp1000s298KRos;
  filename = 'TangSige1000s298KRos.dat';
  p3 = plotTangSigeSiges(dat, color(1,:), marker(3,:), filename, siges(3));

  load SigeEp1000s422KEle.dat
  dat = SigeEp1000s422KEle;
  filename = 'TangSige1000s422KEle.dat';
  p4 = plotTangSigeSiges(dat, color(2,:), marker(4,:), filename, siges(4));

  load SigeEp1000s463KRos.dat
  dat = SigeEp1000s463KRos;
  filename = 'TangSige1000s463KRos.dat';
  p5 = plotTangSigeSiges(dat, color(3,:), marker(5,:), filename, siges(5));

  load SigeEp900s478KEle.dat
  dat = SigeEp900s478KEle;
  filename = 'TangSige900s478KEle.dat';
  p6 = plotTangSigeSiges(dat, color(4,:), marker(6,:), filename, siges(6));

  load SigeEp1000s478KEle.dat
  dat = SigeEp1000s478KEle;
  filename = 'TangSige1000s478KEle.dat';
  p7 = plotTangSigeSiges(dat, color(4,:), marker(7,:), filename, siges(7));

  load SigeEp1000s561KEle.dat
  dat = SigeEp1000s561KEle;
  filename = 'TangSige1000s561KEle.dat';
  p8 = plotTangSigeSiges(dat, color(5,:), marker(8,:), filename, siges(8));

  load SigeEp1150s561KEle.dat
  dat = SigeEp1150s561KEle;
  filename = 'TangSige1150s561KEle.dat';
  p9 = plotTangSigeSiges(dat, color(5,:), marker(9,:), filename, siges(9));

  load SigeEp1000s618KRos.dat
  dat = SigeEp1000s618KRos;
  filename = 'TangSige1000s618KRos.dat';
  p10 = plotTangSigeSiges(dat, color(6,:), marker(10,:), filename, siges(10));

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
function plot2000Edot(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [177 108 65 127 90 130 65 47];

  load SigeEp1500s77KOga.dat
  dat = SigeEp1500s77KOga;
  filename = 'TangSige1500s77KOga.dat';
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), filename, siges(1));

  load SigeEp1500s201KOga.dat
  dat = SigeEp1500s201KOga;
  filename = 'TangSige1500s201KOga.dat';
  p2 = plotTangSigeSiges(dat, color(2,:), marker(2,:), filename, siges(2));

  load SigeEp1500s289KOga.dat
  dat = SigeEp1500s289KOga;
  filename = 'TangSige1500s289KOga.dat';
  p3 = plotTangSigeSiges(dat, color(3,:), marker(3,:), filename, siges(3));

  load SigeEp2500s295KFis.dat
  dat = SigeEp2500s295KFis;
  filename = 'TangSige2500s295KFis.dat';
  p4 = plotTangSigeSiges(dat, color(4,:), marker(4,:), filename, siges(4));

  load SigeEp2000s298KLee.dat
  dat = SigeEp2000s298KLee;
  filename = 'TangSige2000s298KLee.dat';
  p5 = plotTangSigeSiges(dat, color(4,:), marker(5,:), filename, siges(5));

  load SigeEp2000s298KYad.dat
  dat = SigeEp2000s298KYad;
  filename = 'TangSige2000s298KYad.dat';
  p6 = plotTangSigeSiges(dat, color(4,:), marker(6,:), filename, siges(6));

  load SigeEp1500s373KOga.dat
  dat = SigeEp1500s373KOga;
  filename = 'TangSige1500s373KOga.dat';
  p7 = plotTangSigeSiges(dat, color(5,:), marker(7,:), filename, siges(7));

  load SigeEp1500s473KOga.dat
  dat = SigeEp1500s473KOga;
  filename = 'TangSige1500s473KOga.dat';
  p8 = plotTangSigeSiges(dat, color(6,:), marker(8,:), filename, siges(8));

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
function plot4000Edot(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [86 124 73 80 88 120 69];

  load SigeEp3000s298KLee.dat
  dat = SigeEp3000s298KLee;
  filename = 'TangSige3000s298KLee.dat';
  p1 = plotTangSigeSiges(dat, color(1,:), marker(1,:), filename, siges(1));

  load SigeEp3600s298KYad.dat
  dat = SigeEp3600s298KYad;
  filename = 'TangSige3600s298KYad.dat';
  p2 = plotTangSigeSiges(dat, color(2,:), marker(2,:), filename, siges(2));

  load SigeEp4000s298KCad.dat
  dat = SigeEp4000s298KCad;
  filename = 'TangSige4000s298KCad.dat';
  p3 = plotTangSigeSiges(dat, color(3,:), marker(3,:), filename, siges(3));

  load SigeEp4000s298KLee.dat
  dat = SigeEp4000s298KLee;
  filename = 'TangSige4000s298KLee.dat';
  p4 = plotTangSigeSiges(dat, color(3,:), marker(4,:), filename, siges(4));

  load SigeEp4000s298KLes.dat
  dat = SigeEp4000s298KLes;
  filename = 'TangSige4000s298KLes.dat';
  p5 = plotTangSigeSiges(dat, color(3,:), marker(5,:), filename, siges(5));

  load SigeEp8000s298KLes.dat
  dat = SigeEp8000s298KLes;
  filename = 'TangSige8000s298KLes.dat';
  p6 = plotTangSigeSiges(dat, color(4,:), marker(6,:), filename, siges(6));

  load SigeEp29000s298KRam.dat
  dat = SigeEp29000s298KRam;
  filename = 'TangSige29000s298KRam.dat';
  p7 = plotTangSigeSiges(dat, color(5,:), marker(7,:), filename, siges(7));

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
function [p] = plotTangSigeSiges(dat, color, marker, filename, sig_es)

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
  eplas(count) = 0.0;
  sig_e(count) = 0.0;
  T(count) = T0;
  for i=1:length(ep)
    if (sige(i) > 0)
      count = count + 1;
      eplas(count) = ep(i);
      sig_e(count) = sige(i);
      T(count) = Tall(i);
    end
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

  %
  % If we can't figure out sigma_es just take the last point
  % on the sigma_e vs ep curve
  %
  if (sig_es == 0)
    sig_es = sige(length(sige));
  end
  
  %
  %Compute tanh term
  %
  for i = 1:length(eplas)-1
      temp = tanh(alpha*sig_e(i)/sig_es);
      xx(i) = temp/tanh(alpha);
  end
  
  %
  % Plot data
  %
  p = plot(xx, theta, 'p-', 'LineWidth', 2); hold on;
  set(p,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);
  
