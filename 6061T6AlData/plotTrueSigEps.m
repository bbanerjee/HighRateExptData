%
% Compare experimental stress-strain data with MTS model
%
function plotTrueSigEps

  marker = ['o';'p';'v';'s';'d';'^';'h';'<';'x';'>';'+';'*'];
  %color = [[0.15 0.3 0.7];[0.1 0.8 0.3];[0.75 0.25 1.0];...
  %         [0.25 0.75 1.0];[1.0 0.75 0.25]];
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
  plot1000Edot(marker, color)
  plot2000Edot(marker, color)
  plot4000Edot(marker, color)

%====================================================================
%
% Load experimental data for strain rate of 1.0e-5/s, 4.8e-5/s, 5.7e-4/s
%
function plot0000Edot(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load SigEpsEp000057s77KOga.dat.raw
  dat = SigEpsEp000057s77KOga;
  p1 = plotSigEp(dat, color(1,:), marker(1,:));

  load SigEpsEp000057s201KOga.dat.raw
  dat = SigEpsEp000057s201KOga;
  p2 = plotSigEp(dat, color(2,:), marker(2,:));

  load SigEpsEp000057s289KOga.dat.raw
  dat = SigEpsEp000057s289KOga;
  p3 = plotSigEp(dat, color(3,:), marker(3,:));

  load SigEpsEp0000048s297KHog.dat.raw
  dat = SigEpsEp0000048s297KHog;
  p4 = plotSigEp(dat, color(4,:), marker(4,:));

  load SigEpsEp000057s373KOga.dat.raw
  dat = SigEpsEp000057s373KOga;
  p5 = plotSigEp(dat, color(5,:), marker(5,:));

  load SigEpsEp000057s473KOga.dat.raw
  dat = SigEpsEp000057s473KOga;
  p6 = plotSigEp(dat, color(6,:), marker(6,:));

  load SigEpsEp0000010s533KHog.dat.raw
  dat = SigEpsEp0000010s533KHog;
  p7 = plotSigEp(dat, color(7,:), marker(7,:));

  load SigEpsEp0000010s644KHog.dat.raw
  dat = SigEpsEp0000010s644KHog;
  p8 = plotSigEp(dat, color(8,:), marker(8,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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

  load SigEpsEp0001s294KEle.dat.raw
  dat = SigEpsEp0001s294KEle;
  p1 = plotSigEp(dat, color(1,:), marker(1,:));

  load SigEpsEp0001s295KFis.dat.raw
  dat = SigEpsEp0001s295KFis;
  p2 = plotSigEp(dat, color(1,:), marker(2,:));

  load SigEpsEp0001s298KCad.dat.raw
  dat = SigEpsEp0001s298KCad;
  p3 = plotSigEp(dat, color(1,:), marker(3,:));

  load SigEpsEp0001s300K01MPaDav.dat.raw
  dat = SigEpsEp0001s300K01MPaDav;
  p4 = plotSigEp(dat, color(1,:), marker(4,:));

  load SigEpsEp0001s367K01MPaDav.dat.raw
  dat = SigEpsEp0001s367K01MPaDav;
  p5 = plotSigEp(dat, color(5,:), marker(5,:));

  load SigEpsEp0001s422K01MPaDav.dat.raw
  dat = SigEpsEp0001s422K01MPaDav;
  p6 = plotSigEp(dat, color(6,:), marker(6,:));

  load SigEpsEp0001s422KEle.dat.raw
  dat = SigEpsEp0001s422KEle;
  p7 = plotSigEp(dat, color(6,:), marker(7,:));

  load SigEpsEp0001s422KGre.dat.raw
  dat = SigEpsEp0001s422KGre;
  p8 = plotSigEp(dat, color(6,:), marker(8,:));

  load SigEpsEp0001s478K01MPaDav.dat.raw
  dat = SigEpsEp0001s478K01MPaDav;
  p9 = plotSigEp(dat, color(9,:), marker(9,:));

  load SigEpsEp0001s478KEle.dat.raw
  dat = SigEpsEp0001s478KEle;
  p10 = plotSigEp(dat, color(9,:), marker(10,:));

  load SigEpsEp0001s561KEle.dat.raw
  dat = SigEpsEp0001s561KEle;
  p11 = plotSigEp(dat, color(11,:), marker(11,:));

  load SigEpsEp0001s589KGre.dat.raw
  dat = SigEpsEp0001s589KGre;
  p12 = plotSigEp(dat, color(12,:), marker(12,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
% Load pressure-dependent experimental data for strain rate of 1.0e-3/s
%
function plot0001EdotPres(marker, color)

%  load SigEpsEp0001s300K138MPaDav.dat.raw
%  dat = SigEpsEp0001s300K138MPaDav;

%  load SigEpsEp0001s300K276MPaDav.dat.raw
%  dat = SigEpsEp0001s300K276MPaDav;

%  load SigEpsEp0001s300K414MPaDav.dat.raw
%  dat = SigEpsEp0001s300K414MPaDav;

%  load SigEpsEp0001s367K138MPaDav.dat.raw
%  dat = SigEpsEp0001s367K138MPaDav;

%  load SigEpsEp0001s367K276MPaDav.dat.raw
%  dat = SigEpsEp0001s367K276MPaDav;

%  load SigEpsEp0001s367K414MPaDav.dat.raw
%  dat = SigEpsEp0001s367K414MPaDav;

%  load SigEpsEp0001s422K138MPaDav.dat.raw
%  dat = SigEpsEp0001s422K138MPaDav;

%  load SigEpsEp0001s422K276MPaDav.dat.raw
%  dat = SigEpsEp0001s422K276MPaDav;

%  load SigEpsEp0001s422K414MPaDav.dat.raw
%  dat = SigEpsEp0001s422K414MPaDav;

%  load SigEpsEp0001s478K138MPaDav.dat.raw
%  dat = SigEpsEp0001s478K138MPaDav;

%  load SigEpsEp0001s478K276MPaDav.dat.raw
%  dat = SigEpsEp0001s478K276MPaDav;

%  load SigEpsEp0001s478K414MPaDav.dat.raw
%  dat = SigEpsEp0001s478K414MPaDav;

%====================================================================
%
% Load experimental data for strain rate of 2.0e-3/s
%
function plot0002Edot(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load SigEpsEp0002s295KGre.dat.raw
  dat = SigEpsEp0002s295KGre;
  p1 = plotSigEp(dat, color(1,:), marker(1,:));

  load SigEpsEp0002s298KASM.dat.raw
  dat = SigEpsEp0002s298KASM;
  p2 = plotSigEp(dat, color(1,:), marker(2,:));

  load SigEpsEp0002s373KASM.dat.raw
  dat = SigEpsEp0002s373KASM;
  p3 = plotSigEp(dat, color(2,:), marker(3,:));

  load SigEpsEp0002s422KASM.dat.raw
  dat = SigEpsEp0002s422KASM;
  p4 = plotSigEp(dat, color(3,:), marker(4,:));

  load SigEpsEp0002s422KEle.dat.raw
  dat = SigEpsEp0002s422KEle;
  p5 = plotSigEp(dat, color(3,:), marker(5,:));

  load SigEpsEp0002s477KASM.dat.raw
  dat = SigEpsEp0002s477KASM;
  p6 = plotSigEp(dat, color(4,:), marker(6,:));

  load SigEpsEp0002s478KEle.dat.raw
  dat = SigEpsEp0002s478KEle;
  p7 = plotSigEp(dat, color(4,:), marker(7,:));

  load SigEpsEp0002s535KASM.dat.raw
  dat = SigEpsEp0002s535KASM;
  p8 = plotSigEp(dat, color(5,:), marker(8,:));

  load SigEpsEp0002s561KEle.dat.raw
  dat = SigEpsEp0002s561KEle;
  p9 = plotSigEp(dat, color(6,:), marker(9,:));

  load SigEpsEp0002s589KASM.dat.raw
  dat = SigEpsEp0002s589KASM;
  p10 = plotSigEp(dat, color(7,:), marker(10,:));

  load SigEpsEp0002s644KASM.dat.raw
  dat = SigEpsEp0002s644KASM;
  p11 = plotSigEp(dat, color(8,:), marker(11,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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

  load SigEpsEp002s422KEle.dat.raw
  dat = SigEpsEp002s422KEle;
  p1 = plotSigEp(dat, color(1,:), marker(1,:));

  load SigEpsEp0085s422KEle.dat.raw
  dat = SigEpsEp0085s422KEle;
  p2 = plotSigEp(dat, color(1,:), marker(2,:));

  load SigEpsEp005s478KEle.dat.raw
  dat = SigEpsEp005s478KEle;
  p3 = plotSigEp(dat, color(2,:), marker(3,:));

  load SigEpsEp002s561KEle.dat.raw
  dat = SigEpsEp002s561KEle;
  p4 = plotSigEp(dat, color(3,:), marker(4,:));

  load SigEpsEp006s561KEle.dat.raw
  dat = SigEpsEp006s561KEle;
  p5 = plotSigEp(dat, color(3,:), marker(5,:));

  load SigEpsEp0085s561KEle.dat.raw
  dat = SigEpsEp0085s561KEle;
  p6 = plotSigEp(dat, color(3,:), marker(6,:));

  load SigEpsEp015s561KEle.dat.raw
  dat = SigEpsEp015s561KEle;
  p7 = plotSigEp(dat, color(3,:), marker(7,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1], 'YLim',[100 400]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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

  load SigEpsEp11s422KEle.dat.raw
  dat = SigEpsEp11s422KEle;
  p1 = plotSigEp(dat, color(1,:), marker(1,:));

  load SigEpsEp075s478KEle.dat.raw
  dat = SigEpsEp075s478KEle;
  p2 = plotSigEp(dat, color(2,:), marker(2,:));

  load SigEpsEp070s561KEle.dat.raw
  dat = SigEpsEp070s561KEle;
  p3 = plotSigEp(dat, color(3,:), marker(3,:));

  load SigEpsEp12s561KEle.dat.raw
  dat = SigEpsEp12s561KEle;
  p4 = plotSigEp(dat, color(3,:), marker(4,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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

  load SigEpsEp85s422KEle.dat.raw
  dat = SigEpsEp85s422KEle;
  p1 = plotSigEp(dat, color(1,:), marker(1,:));

  load SigEpsEp9s422KGre.dat.raw
  dat = SigEpsEp9s422KGre;
  p2 = plotSigEp(dat, color(1,:), marker(2,:));

  load SigEpsEp5s478KEle.dat.raw
  dat = SigEpsEp5s478KEle;
  p3 = plotSigEp(dat, color(2,:), marker(3,:));

  load SigEpsEp10s589KGre.dat.raw
  dat = SigEpsEp10s589KGre;
  p4 = plotSigEp(dat, color(3,:), marker(4,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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

  load SigEpsEp18s295KGre.dat.raw
  dat = SigEpsEp18s295KGre;
  p1 = plotSigEp(dat, color(1,:), marker(1,:));

  load SigEpsEp28s297KHog.dat.raw
  dat = SigEpsEp28s297KHog;
  p2 = plotSigEp(dat, color(1,:), marker(2,:));

  load SigEpsEp30s422KEle.dat.raw
  dat = SigEpsEp30s422KEle;
  p3 = plotSigEp(dat, color(2,:), marker(3,:));

  load SigEpsEp30s478KEle.dat.raw
  dat = SigEpsEp30s478KEle;
  p4 = plotSigEp(dat, color(3,:), marker(4,:));

  load SigEpsEp18s533KHog.dat.raw
  dat = SigEpsEp18s533KHog;
  p5 = plotSigEp(dat, color(4,:), marker(5,:));

  load SigEpsEp23s644KHog.dat.raw
  dat = SigEpsEp23s644KHog;
  p6 = plotSigEp(dat, color(5,:), marker(6,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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

  load SigEpsEp65s297KHog.dat.raw
  dat = SigEpsEp65s297KHog;
  p1 = plotSigEp(dat, color(1,:), marker(1,:));

  load SigEpsEp50s561KEle.dat.raw
  dat = SigEpsEp50s561KEle;
  p2 = plotSigEp(dat, color(2,:), marker(2,:));

  load SigEpsEp54s644KHog.dat.raw
  dat = SigEpsEp54s644KHog;
  p3 = plotSigEp(dat, color(3,:), marker(3,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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

  load SigEpsEp380s298KYad.dat.raw
  dat = SigEpsEp380s298KYad;
  p1 = plotSigEp(dat, color(1,:), marker(1,:));

  load SigEpsEp500s298KYad.dat.raw
  dat = SigEpsEp500s298KYad;
  p2 = plotSigEp(dat, color(1,:), marker(2,:));

  load SigEpsEp130s533KHog.dat.raw
  dat = SigEpsEp130s533KHog;
  p3 = plotSigEp(dat, color(2,:), marker(3,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.2]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p2 p3], ...
         '298 K 380/s (Yadav)', ...
         '298 K 500/s (Yadav)', ...
         '533 K 130/s (Hoge)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 1000.0/s
%
function plot1000Edot(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load SigEpsEp1000s294KEle.dat.raw
  dat = SigEpsEp1000s294KEle;
  p1 = plotSigEp(dat, color(1,:), marker(1,:));

  load SigEpsEp1000s298KLee.dat.raw
  dat = SigEpsEp1000s298KLee;
  p2 = plotSigEp(dat, color(1,:), marker(2,:));

  load SigEpsEp1000s298KRos.dat.raw
  dat = SigEpsEp1000s298KRos;
  p3 = plotSigEp(dat, color(1,:), marker(3,:));

  load SigEpsEp1000s422KEle.dat.raw
  dat = SigEpsEp1000s422KEle;
  p4 = plotSigEp(dat, color(2,:), marker(4,:));

  load SigEpsEp1000s463KRos.dat.raw
  dat = SigEpsEp1000s463KRos;
  p5 = plotSigEp(dat, color(3,:), marker(5,:));

  load SigEpsEp900s478KEle.dat.raw
  dat = SigEpsEp900s478KEle;
  p6 = plotSigEp(dat, color(4,:), marker(6,:));

  load SigEpsEp1000s478KEle.dat.raw
  dat = SigEpsEp1000s478KEle;
  p7 = plotSigEp(dat, color(4,:), marker(7,:));

  load SigEpsEp1000s561KEle.dat.raw
  dat = SigEpsEp1000s561KEle;
  p8 = plotSigEp(dat, color(5,:), marker(8,:));

  load SigEpsEp1150s561KEle.dat.raw
  dat = SigEpsEp1150s561KEle;
  p9 = plotSigEp(dat, color(5,:), marker(9,:));

  load SigEpsEp1000s618KRos.dat.raw
  dat = SigEpsEp1000s618KRos;
  p10 = plotSigEp(dat, color(6,:), marker(10,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.26]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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

  load SigEpsEp1500s77KOga.dat.raw
  dat = SigEpsEp1500s77KOga;
  p1 = plotSigEp(dat, color(1,:), marker(1,:));

  load SigEpsEp1500s201KOga.dat.raw
  dat = SigEpsEp1500s201KOga;
  p2 = plotSigEp(dat, color(2,:), marker(2,:));

  load SigEpsEp1500s289KOga.dat.raw
  dat = SigEpsEp1500s289KOga;
  p3 = plotSigEp(dat, color(3,:), marker(3,:));

  load SigEpsEp2500s295KFis.dat.raw
  dat = SigEpsEp2500s295KFis;
  p4 = plotSigEp(dat, color(4,:), marker(4,:));

  load SigEpsEp2000s298KLee.dat.raw
  dat = SigEpsEp2000s298KLee;
  p5 = plotSigEp(dat, color(4,:), marker(5,:));

  load SigEpsEp2000s298KYad.dat.raw
  dat = SigEpsEp2000s298KYad;
  p6 = plotSigEp(dat, color(4,:), marker(6,:));

  load SigEpsEp1500s373KOga.dat.raw
  dat = SigEpsEp1500s373KOga;
  p7 = plotSigEp(dat, color(5,:), marker(7,:));

  load SigEpsEp1500s473KOga.dat.raw
  dat = SigEpsEp1500s473KOga;
  p8 = plotSigEp(dat, color(6,:), marker(8,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.25]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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

  load SigEpsEp3000s298KLee.dat.raw
  dat = SigEpsEp3000s298KLee;
  p1 = plotSigEp(dat, color(1,:), marker(1,:));

  load SigEpsEp3600s298KYad.dat.raw
  dat = SigEpsEp3600s298KYad;
  p2 = plotSigEp(dat, color(2,:), marker(2,:));

  load SigEpsEp4000s298KCad.dat.raw
  dat = SigEpsEp4000s298KCad;
  p3 = plotSigEp(dat, color(3,:), marker(3,:));

  load SigEpsEp4000s298KLee.dat.raw
  dat = SigEpsEp4000s298KLee;
  p4 = plotSigEp(dat, color(3,:), marker(4,:));

  load SigEpsEp4000s298KLes.dat.raw
  dat = SigEpsEp4000s298KLes;
  p5 = plotSigEp(dat, color(3,:), marker(5,:));

  load SigEpsEp8000s298KLes.dat.raw
  dat = SigEpsEp8000s298KLes;
  p6 = plotSigEp(dat, color(4,:), marker(6,:));

  load SigEpsEp29000s298KRam.dat.raw
  dat = SigEpsEp29000s298KRam;
  p7 = plotSigEp(dat, color(5,:), marker(7,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.5]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
%
function [p] = plotSigEp(dat, color, marker)

  epEx = dat(:,5);
  seqEx = dat(:,6);
  p = plot(epEx, seqEx, 'p-', 'LineWidth', 2); hold on;
  set(p,'LineWidth',2,'MarkerSize',6,'Color',color,'Marker',marker);
