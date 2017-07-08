function calcTangFromSige

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
 
  sig0 = [275 240 235 255 220 175 100 25];

  load ./SigeEpData/SigeEp000057s77KOga.dat
  dat = SigeEp000057s77KOga;
  filename = 'SigeEpData/TangSige000057s77KOga.dat';
  p1 = calcPlotTangSige(dat, color(1,:), marker(1,:), filename, sig0(1));

  load ./SigeEpData/SigeEp000057s201KOga.dat
  dat = SigeEp000057s201KOga;
  filename = 'SigeEpData/TangSige000057s201KOga.dat';
  p2 = calcPlotTangSige(dat, color(2,:), marker(2,:), filename, sig0(2));

  load ./SigeEpData/SigeEp000057s289KOga.dat
  dat = SigeEp000057s289KOga;
  filename = 'SigeEpData/TangSige000057s289KOga.dat';
  p3 = calcPlotTangSige(dat, color(3,:), marker(3,:), filename, sig0(3));

  load ./SigeEpData/SigeEp0000048s297KHog.dat
  dat = SigeEp0000048s297KHog;
  filename = 'SigeEpData/TangSige0000048s297KHog.dat';
  p4 = calcPlotTangSige(dat, color(4,:), marker(4,:), filename, sig0(4));

  load ./SigeEpData/SigeEp000057s373KOga.dat
  dat = SigeEp000057s373KOga;
  filename = 'SigeEpData/TangSige000057s373KOga.dat';
  p5 = calcPlotTangSige(dat, color(5,:), marker(5,:), filename, sig0(5));

  load ./SigeEpData/SigeEp000057s473KOga.dat
  dat = SigeEp000057s473KOga;
  filename = 'SigeEpData/TangSige000057s473KOga.dat';
  p6 = calcPlotTangSige(dat, color(6,:), marker(6,:), filename, sig0(6));

  load ./SigeEpData/SigeEp0000010s533KHog.dat
  dat = SigeEp0000010s533KHog;
  filename = 'SigeEpData/TangSige0000010s533KHog.dat';
  p7 = calcPlotTangSige(dat, color(7,:), marker(7,:), filename, sig0(7));

  load ./SigeEpData/SigeEp0000010s644KHog.dat
  dat = SigeEp0000010s644KHog;
  filename = 'SigeEpData/TangSige0000010s644KHog.dat';
  p8 = calcPlotTangSige(dat, color(8,:), marker(8,:), filename, sig0(8));

  subplot(1,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.3], 'YLim', [-50 150]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(1,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.3], 'YLim', [-50 150]);
  xlabel('\sigma_e (MPa)', 'FontName', 'bookman', 'FontSize', 16);
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

  sig0 = [310 300 300 281 255 230 280 270 188 250 130 145];

  load ./SigeEpData/SigeEp0001s294KEle.dat
  dat = SigeEp0001s294KEle;
  filename = 'SigeEpData/TangSige0001s294KEle.dat';
  p1 = calcPlotTangSige(dat, color(1,:), marker(1,:), filename, sig0(1));

  load ./SigeEpData/SigeEp0001s295KFis.dat
  dat = SigeEp0001s295KFis;
  filename = 'SigeEpData/TangSige0001s295KFis.dat';
  p2 = calcPlotTangSige(dat, color(1,:), marker(2,:), filename, sig0(2));

  load ./SigeEpData/SigeEp0001s298KCad.dat
  dat = SigeEp0001s298KCad;
  filename = 'SigeEpData/TangSige0001s298KCad.dat';
  p3 = calcPlotTangSige(dat, color(1,:), marker(3,:), filename, sig0(3));

  load ./SigeEpData/SigeEp0001s300K01MPaDav.dat
  dat = SigeEp0001s300K01MPaDav;
  filename = 'SigeEpData/TangSige0001s300K01MPaDav.dat';
  p4 = calcPlotTangSige(dat, color(1,:), marker(4,:), filename, sig0(4));

  load ./SigeEpData/SigeEp0001s367K01MPaDav.dat
  dat = SigeEp0001s367K01MPaDav;
  filename = 'SigeEpData/TangSige0001s367K01MPaDav.dat';
  p5 = calcPlotTangSige(dat, color(5,:), marker(5,:), filename, sig0(5));

  load ./SigeEpData/SigeEp0001s422K01MPaDav.dat
  dat = SigeEp0001s422K01MPaDav;
  filename = 'SigeEpData/TangSige0001s422K01MPaDav.dat';
  p6 = calcPlotTangSige(dat, color(6,:), marker(6,:), filename, sig0(6));

  load ./SigeEpData/SigeEp0001s422KEle.dat
  dat = SigeEp0001s422KEle;
  filename = 'SigeEpData/TangSige0001s422KEle.dat';
  p7 = calcPlotTangSige(dat, color(6,:), marker(7,:), filename, sig0(7));

  load ./SigeEpData/SigeEp0001s422KGre.dat
  dat = SigeEp0001s422KGre;
  filename = 'SigeEpData/TangSige0001s422KGre.dat';
  p8 = calcPlotTangSige(dat, color(6,:), marker(8,:), filename, sig0(8));

  load ./SigeEpData/SigeEp0001s478K01MPaDav.dat
  dat = SigeEp0001s478K01MPaDav;
  filename = 'SigeEpData/TangSige0001s478K01MPaDav.dat';
  p9 = calcPlotTangSige(dat, color(9,:), marker(9,:), filename, sig0(9));

  load ./SigeEpData/SigeEp0001s478KEle.dat
  dat = SigeEp0001s478KEle;
  filename = 'SigeEpData/TangSige0001s478KEle.dat';
  p10 = calcPlotTangSige(dat, color(9,:), marker(10,:), filename, sig0(10));

  load ./SigeEpData/SigeEp0001s561KEle.dat
  dat = SigeEp0001s561KEle;
  filename = 'SigeEpData/TangSige0001s561KEle.dat';
  p11 = calcPlotTangSige(dat, color(11,:), marker(11,:), filename, sig0(11));

  load ./SigeEpData/SigeEp0001s589KGre.dat
  dat = SigeEp0001s589KGre;
  filename = 'SigeEpData/TangSige0001s589KGre.dat';
  p12 = calcPlotTangSige(dat, color(12,:), marker(12,:), filename, sig0(12));

  subplot(1,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.3], 'YLim', [-50 150]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(1,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.3], 'YLim', [-75 150]);
  xlabel('\sigma_e (MPa)', 'FontName', 'bookman', 'FontSize', 16);
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

  sig0 = [305 265 250 230 280 210 240 140 120 55 30];

  load ./SigeEpData/SigeEp0002s295KGre.dat
  dat = SigeEp0002s295KGre;
  filename = 'SigeEpData/TangSige0002s295KGre.dat';
  p1 = calcPlotTangSige(dat, color(1,:), marker(1,:), filename, sig0(1));

  load ./SigeEpData/SigeEp0002s298KASM.dat
  dat = SigeEp0002s298KASM;
  filename = 'SigeEpData/TangSige0002s298KASM.dat';
  p2 = calcPlotTangSige(dat, color(1,:), marker(2,:), filename, sig0(2));

  load ./SigeEpData/SigeEp0002s373KASM.dat
  dat = SigeEp0002s373KASM;
  filename = 'SigeEpData/TangSige0002s373KASM.dat';
  p3 = calcPlotTangSige(dat, color(2,:), marker(3,:), filename, sig0(3));

  load ./SigeEpData/SigeEp0002s422KASM.dat
  dat = SigeEp0002s422KASM;
  filename = 'SigeEpData/TangSige0002s422KASM.dat';
  p4 = calcPlotTangSige(dat, color(3,:), marker(4,:), filename, sig0(4));

  load ./SigeEpData/SigeEp0002s422KEle.dat
  dat = SigeEp0002s422KEle;
  filename = 'SigeEpData/TangSige0002s422KEle.dat';
  p5 = calcPlotTangSige(dat, color(3,:), marker(5,:), filename, sig0(5));

  load ./SigeEpData/SigeEp0002s477KASM.dat
  dat = SigeEp0002s477KASM;
  filename = 'SigeEpData/TangSige0002s477KASM.dat';
  p6 = calcPlotTangSige(dat, color(4,:), marker(6,:), filename, sig0(6));

  load ./SigeEpData/SigeEp0002s478KEle.dat
  dat = SigeEp0002s478KEle;
  filename = 'SigeEpData/TangSige0002s478KEle.dat';
  p7 = calcPlotTangSige(dat, color(4,:), marker(7,:), filename, sig0(7));

  load ./SigeEpData/SigeEp0002s535KASM.dat
  dat = SigeEp0002s535KASM;
  filename = 'SigeEpData/TangSige0002s535KASM.dat';
  p8 = calcPlotTangSige(dat, color(5,:), marker(8,:), filename, sig0(8));

  load ./SigeEpData/SigeEp0002s561KEle.dat
  dat = SigeEp0002s561KEle;
  filename = 'SigeEpData/TangSige0002s561KEle.dat';
  p9 = calcPlotTangSige(dat, color(6,:), marker(9,:), filename, sig0(9));

  load ./SigeEpData/SigeEp0002s589KASM.dat
  dat = SigeEp0002s589KASM;
  filename = 'SigeEpData/TangSige0002s589KASM.dat';
  p10 = calcPlotTangSige(dat, color(7,:), marker(10,:), filename, sig0(10));

  load ./SigeEpData/SigeEp0002s644KASM.dat
  dat = SigeEp0002s644KASM;
  filename = 'SigeEpData/TangSige0002s644KASM.dat';
  p11 = calcPlotTangSige(dat, color(8,:), marker(11,:), filename, sig0(11));

  subplot(1,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.3], 'YLim', [-50 150]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(1,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.1], 'YLim', [-50 100]);
  xlabel('\sigma_e (MPa)', 'FontName', 'bookman', 'FontSize', 16);
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

  sig0 = [280 288 253 131 143 151 160];

  load ./SigeEpData/SigeEp002s422KEle.dat
  dat = SigeEp002s422KEle;
  filename = 'SigeEpData/TangSige002s422KEle.dat';
  p1 = calcPlotTangSige(dat, color(1,:), marker(1,:), filename, sig0(1));

  load ./SigeEpData/SigeEp0085s422KEle.dat
  dat = SigeEp0085s422KEle;
  filename = 'SigeEpData/TangSige0085s422KEle.dat';
  p2 = calcPlotTangSige(dat, color(1,:), marker(2,:), filename, sig0(2));

  load ./SigeEpData/SigeEp005s478KEle.dat
  dat = SigeEp005s478KEle;
  filename = 'SigeEpData/TangSige005s478KEle.dat';
  p3 = calcPlotTangSige(dat, color(2,:), marker(3,:), filename, sig0(3));

  load ./SigeEpData/SigeEp002s561KEle.dat
  dat = SigeEp002s561KEle;
  filename = 'SigeEpData/TangSige002s561KEle.dat';
  p4 = calcPlotTangSige(dat, color(3,:), marker(4,:), filename, sig0(4));

  load ./SigeEpData/SigeEp006s561KEle.dat
  dat = SigeEp006s561KEle;
  filename = 'SigeEpData/TangSige006s561KEle.dat';
  p5 = calcPlotTangSige(dat, color(3,:), marker(5,:), filename, sig0(5));

  load ./SigeEpData/SigeEp0085s561KEle.dat
  dat = SigeEp0085s561KEle;
  filename = 'SigeEpData/TangSige0085s561KEle.dat';
  p6 = calcPlotTangSige(dat, color(3,:), marker(6,:), filename, sig0(6));

  load ./SigeEpData/SigeEp015s561KEle.dat
  dat = SigeEp015s561KEle;
  filename = 'SigeEpData/TangSige015s561KEle.dat';
  p7 = calcPlotTangSige(dat, color(3,:), marker(7,:), filename, sig0(7));

  subplot(1,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.3], 'YLim', [-50 150]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(1,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.1], 'YLim',[0 150]);
  xlabel('\sigma_e (MPa)', 'FontName', 'bookman', 'FontSize', 16);
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

  sig0 = [286 263 165 165];

  load ./SigeEpData/SigeEp11s422KEle.dat
  dat = SigeEp11s422KEle;
  filename = 'SigeEpData/TangSige11s422KEle.dat';
  p1 = calcPlotTangSige(dat, color(1,:), marker(1,:), filename, sig0(1));

  load ./SigeEpData/SigeEp075s478KEle.dat
  dat = SigeEp075s478KEle;
  filename = 'SigeEpData/TangSige075s478KEle.dat';
  p2 = calcPlotTangSige(dat, color(2,:), marker(2,:), filename, sig0(2));

  load ./SigeEpData/SigeEp070s561KEle.dat
  dat = SigeEp070s561KEle;
  filename = 'SigeEpData/TangSige070s561KEle.dat';
  p3 = calcPlotTangSige(dat, color(3,:), marker(3,:), filename, sig0(3));

  load ./SigeEpData/SigeEp12s561KEle.dat
  dat = SigeEp12s561KEle;
  filename = 'SigeEpData/TangSige12s561KEle.dat';
  p4 = calcPlotTangSige(dat, color(3,:), marker(4,:), filename, sig0(4));

  subplot(1,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.3], 'YLim', [-50 150]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(1,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.1], 'YLim', [0 150]);
  xlabel('\sigma_e (MPa)', 'FontName', 'bookman', 'FontSize', 16);
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

  sig0 = [280 295 263 190];

  load ./SigeEpData/SigeEp85s422KEle.dat
  dat = SigeEp85s422KEle;
  filename = 'SigeEpData/TangSige85s422KEle.dat';
  p1 = calcPlotTangSige(dat, color(1,:), marker(1,:), filename, sig0(1));

  load ./SigeEpData/SigeEp9s422KGre.dat
  dat = SigeEp9s422KGre;
  filename = 'SigeEpData/TangSige9s422KGre.dat';
  p2 = calcPlotTangSige(dat, color(1,:), marker(2,:), filename, sig0(2));

  load ./SigeEpData/SigeEp5s478KEle.dat
  dat = SigeEp5s478KEle;
  filename = 'SigeEpData/TangSige5s478KEle.dat';
  p3 = calcPlotTangSige(dat, color(2,:), marker(3,:), filename, sig0(3));

  load ./SigeEpData/SigeEp10s589KGre.dat
  dat = SigeEp10s589KGre;
  filename = 'SigeEpData/TangSige10s589KGre.dat';
  p4 = calcPlotTangSige(dat, color(3,:), marker(4,:), filename, sig0(4));

  subplot(1,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.3], 'YLim', [-50 150]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(1,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.1]);
  xlabel('\sigma_e (MPa)', 'FontName', 'bookman', 'FontSize', 16);
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

  sig0 = [308 295 288 270 208 170];

  load ./SigeEpData/SigeEp18s295KGre.dat
  dat = SigeEp18s295KGre;
  filename = 'SigeEpData/TangSige18s295KGre.dat';
  p1 = calcPlotTangSige(dat, color(1,:), marker(1,:), filename, sig0(1));

  load ./SigeEpData/SigeEp28s297KHog.dat
  dat = SigeEp28s297KHog;
  filename = 'SigeEpData/TangSige28s297KHog.dat';
  p2 = calcPlotTangSige(dat, color(1,:), marker(2,:), filename, sig0(2));

  load ./SigeEpData/SigeEp30s422KEle.dat
  dat = SigeEp30s422KEle;
  filename = 'SigeEpData/TangSige30s422KEle.dat';
  p3 = calcPlotTangSige(dat, color(2,:), marker(3,:), filename, sig0(3));

  load ./SigeEpData/SigeEp30s478KEle.dat
  dat = SigeEp30s478KEle;
  filename = 'SigeEpData/TangSige30s478KEle.dat';
  p4 = calcPlotTangSige(dat, color(3,:), marker(4,:), filename, sig0(4));

  load ./SigeEpData/SigeEp18s533KHog.dat
  dat = SigeEp18s533KHog;
  filename = 'SigeEpData/TangSige18s533KHog.dat';
  p5 = calcPlotTangSige(dat, color(4,:), marker(5,:), filename, sig0(5));

  load ./SigeEpData/SigeEp23s644KHog.dat
  dat = SigeEp23s644KHog;
  filename = 'SigeEpData/TangSige23s644KHog.dat';
  p6 = calcPlotTangSige(dat, color(5,:), marker(6,:), filename, sig0(6));

  subplot(1,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.3], 'YLim', [-50 150]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(1,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.1], 'YLim', [0 150]);
  xlabel('\sigma_e (MPa)', 'FontName', 'bookman', 'FontSize', 16);
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

  sig0 = [320 170 205];

  load ./SigeEpData/SigeEp65s297KHog.dat
  dat = SigeEp65s297KHog;
  filename = 'SigeEpData/TangSige65s297KHog.dat';
  p1 = calcPlotTangSige(dat, color(1,:), marker(1,:), filename, sig0(1));

  load ./SigeEpData/SigeEp50s561KEle.dat
  dat = SigeEp50s561KEle;
  filename = 'SigeEpData/TangSige50s561KEle.dat';
  p2 = calcPlotTangSige(dat, color(2,:), marker(2,:), filename, sig0(2));

  load ./SigeEpData/SigeEp54s644KHog.dat
  dat = SigeEp54s644KHog;
  filename = 'SigeEpData/TangSige54s644KHog.dat';
  p3 = calcPlotTangSige(dat, color(3,:), marker(3,:), filename, sig0(3));

  subplot(1,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.3], 'YLim', [-50 150]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(1,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.1], 'YLim', [0 100]);
  xlabel('\sigma_e (MPa)', 'FontName', 'bookman', 'FontSize', 16);
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

  sig0 = [263 310 275];

  load ./SigeEpData/SigeEp380s298KYad.dat
  dat = SigeEp380s298KYad;
  filename = 'SigeEpData/TangSige380s298KYad.dat';
  p1 = calcPlotTangSige(dat, color(1,:), marker(1,:), filename, sig0(1));

  load ./SigeEpData/SigeEp500s298KYad.dat
  dat = SigeEp500s298KYad;
  filename = 'SigeEpData/TangSige500s298KYad.dat';
  p2 = calcPlotTangSige(dat, color(1,:), marker(2,:), filename, sig0(2));

  load ./SigeEpData/SigeEp130s533KHog.dat
  dat = SigeEp130s533KHog;
  filename = 'SigeEpData/TangSige130s533KHog.dat';
  p3 = calcPlotTangSige(dat, color(2,:), marker(3,:), filename, sig0(3));

  subplot(1,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.3], 'YLim', [-50 150]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(1,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.2], 'YLim', [0 200]);
  xlabel('\sigma_e (MPa)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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

  sig0 = [305 325 300 290 220 275 276 180 180 70];

  load ./SigeEpData/SigeEp1000s294KEle.dat
  dat = SigeEp1000s294KEle;
  filename = 'SigeEpData/TangSige1000s294KEle.dat';
  p1 = calcPlotTangSige(dat, color(1,:), marker(1,:), filename, sig0(1));

  load ./SigeEpData/SigeEp1000s298KLee.dat
  dat = SigeEp1000s298KLee;
  filename = 'SigeEpData/TangSige1000s298KLee.dat';
  p2 = calcPlotTangSige(dat, color(1,:), marker(2,:), filename, sig0(2));

  load ./SigeEpData/SigeEp1000s298KRos.dat
  dat = SigeEp1000s298KRos;
  filename = 'SigeEpData/TangSige1000s298KRos.dat';
  p3 = calcPlotTangSige(dat, color(1,:), marker(3,:), filename, sig0(3));

  load ./SigeEpData/SigeEp1000s422KEle.dat
  dat = SigeEp1000s422KEle;
  filename = 'SigeEpData/TangSige1000s422KEle.dat';
  p4 = calcPlotTangSige(dat, color(2,:), marker(4,:), filename, sig0(4));

  load ./SigeEpData/SigeEp1000s463KRos.dat
  dat = SigeEp1000s463KRos;
  filename = 'SigeEpData/TangSige1000s463KRos.dat';
  p5 = calcPlotTangSige(dat, color(3,:), marker(5,:), filename, sig0(5));

  load ./SigeEpData/SigeEp900s478KEle.dat
  dat = SigeEp900s478KEle;
  filename = 'SigeEpData/TangSige900s478KEle.dat';
  p6 = calcPlotTangSige(dat, color(4,:), marker(6,:), filename, sig0(6));

  load ./SigeEpData/SigeEp1000s478KEle.dat
  dat = SigeEp1000s478KEle;
  filename = 'SigeEpData/TangSige1000s478KEle.dat';
  p7 = calcPlotTangSige(dat, color(4,:), marker(7,:), filename, sig0(7));

  load ./SigeEpData/SigeEp1000s561KEle.dat
  dat = SigeEp1000s561KEle;
  filename = 'SigeEpData/TangSige1000s561KEle.dat';
  p8 = calcPlotTangSige(dat, color(5,:), marker(8,:), filename, sig0(8));

  load ./SigeEpData/SigeEp1150s561KEle.dat
  dat = SigeEp1150s561KEle;
  filename = 'SigeEpData/TangSige1150s561KEle.dat';
  p9 = calcPlotTangSige(dat, color(5,:), marker(9,:), filename, sig0(9));

  load ./SigeEpData/SigeEp1000s618KRos.dat
  dat = SigeEp1000s618KRos;
  filename = 'SigeEpData/TangSige1000s618KRos.dat';
  p10 = calcPlotTangSige(dat, color(6,:), marker(10,:), filename, sig0(10));

  subplot(1,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.3], 'YLim', [-50 150]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(1,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.26], 'YLim', [0 150]);
  xlabel('\sigma_e (MPa)', 'FontName', 'bookman', 'FontSize', 16);
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

  sig0 = [325 270 260 315 340 310 240 230];

  load ./SigeEpData/SigeEp1500s77KOga.dat
  dat = SigeEp1500s77KOga;
  filename = 'SigeEpData/TangSige1500s77KOga.dat';
  p1 = calcPlotTangSige(dat, color(1,:), marker(1,:), filename, sig0(1));

  load ./SigeEpData/SigeEp1500s201KOga.dat
  dat = SigeEp1500s201KOga;
  filename = 'SigeEpData/TangSige1500s201KOga.dat';
  p2 = calcPlotTangSige(dat, color(2,:), marker(2,:), filename, sig0(2));

  load ./SigeEpData/SigeEp1500s289KOga.dat
  dat = SigeEp1500s289KOga;
  filename = 'SigeEpData/TangSige1500s289KOga.dat';
  p3 = calcPlotTangSige(dat, color(3,:), marker(3,:), filename, sig0(3));

  load ./SigeEpData/SigeEp2500s295KFis.dat
  dat = SigeEp2500s295KFis;
  filename = 'SigeEpData/TangSige2500s295KFis.dat';
  p4 = calcPlotTangSige(dat, color(4,:), marker(4,:), filename, sig0(4));

  load ./SigeEpData/SigeEp2000s298KLee.dat
  dat = SigeEp2000s298KLee;
  filename = 'SigeEpData/TangSige2000s298KLee.dat';
  p5 = calcPlotTangSige(dat, color(4,:), marker(5,:), filename, sig0(5));

  load ./SigeEpData/SigeEp2000s298KYad.dat
  dat = SigeEp2000s298KYad;
  filename = 'SigeEpData/TangSige2000s298KYad.dat';
  p6 = calcPlotTangSige(dat, color(4,:), marker(6,:), filename, sig0(6));

  load ./SigeEpData/SigeEp1500s373KOga.dat
  dat = SigeEp1500s373KOga;
  filename = 'SigeEpData/TangSige1500s373KOga.dat';
  p7 = calcPlotTangSige(dat, color(5,:), marker(7,:), filename, sig0(7));

  load ./SigeEpData/SigeEp1500s473KOga.dat
  dat = SigeEp1500s473KOga;
  filename = 'SigeEpData/TangSige1500s473KOga.dat';
  p8 = calcPlotTangSige(dat, color(6,:), marker(8,:), filename, sig0(8));

  subplot(1,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.3], 'YLim', [-50 150]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(1,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.25], 'YLim', [-50 200]);
  xlabel('\sigma_e (MPa)', 'FontName', 'bookman', 'FontSize', 16);
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

  sig0 = [347 340 350 360 345 370 355];

  load ./SigeEpData/SigeEp3000s298KLee.dat
  dat = SigeEp3000s298KLee;
  filename = 'SigeEpData/TangSige3000s298KLee.dat';
  p1 = calcPlotTangSige(dat, color(1,:), marker(1,:), filename, sig0(1));

  load ./SigeEpData/SigeEp3600s298KYad.dat
  dat = SigeEp3600s298KYad;
  filename = 'SigeEpData/TangSige3600s298KYad.dat';
  p2 = calcPlotTangSige(dat, color(2,:), marker(2,:), filename, sig0(2));

  load ./SigeEpData/SigeEp4000s298KCad.dat
  dat = SigeEp4000s298KCad;
  filename = 'SigeEpData/TangSige4000s298KCad.dat';
  p3 = calcPlotTangSige(dat, color(3,:), marker(3,:), filename, sig0(3));

  load ./SigeEpData/SigeEp4000s298KLee.dat
  dat = SigeEp4000s298KLee;
  filename = 'SigeEpData/TangSige4000s298KLee.dat';
  p4 = calcPlotTangSige(dat, color(3,:), marker(4,:), filename, sig0(4));

  load ./SigeEpData/SigeEp4000s298KLes.dat
  dat = SigeEp4000s298KLes;
  filename = 'SigeEpData/TangSige4000s298KLes.dat';
  p5 = calcPlotTangSige(dat, color(3,:), marker(5,:), filename, sig0(5));

  load ./SigeEpData/SigeEp8000s298KLes.dat
  dat = SigeEp8000s298KLes;
  filename = 'SigeEpData/TangSige8000s298KLes.dat';
  p6 = calcPlotTangSige(dat, color(4,:), marker(6,:), filename, sig0(6));

  load ./SigeEpData/SigeEp29000s298KRam.dat
  dat = SigeEp29000s298KRam;
  filename = 'SigeEpData/TangSige29000s298KRam.dat';
  p7 = calcPlotTangSige(dat, color(5,:), marker(7,:), filename, sig0(7));

  subplot(1,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.3], 'YLim', [-50 150]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(1,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim',[0 0.5], 'YLim', [-50 200]);
  xlabel('\sigma_e (MPa)', 'FontName', 'bookman', 'FontSize', 16);
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
function [p] = calcPlotTangSige(dat, color, marker, filename, sig_ipa)

  %
  % Load data
  %
  ep = dat(:,1);
  sige = dat(:,2);
  Tall = dat(:,3);
  edot = dat(1,4);
  T0 = dat(1,5);
  P = dat(1,6);

  %
  %  Get rid of the data points where sig_e <= 0
  %
  %count = 1;
  %eplas(count) = 0.0;
  %sig_e(count) = 0.0;
  %T(count) = T0;
  count = 0;
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
  % Plot data
  %
  subplot(1,2,1);
  p = plot(eplas, sig_e, 'p-', 'LineWidth', 2); hold on;
  set(p,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);

  subplot(1,2,2);
  p = plot(sigma_e, theta, 'p-', 'LineWidth', 2); hold on;
  set(p,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);
  %
  % Write data
  %
  fid = fopen(filename, 'w');
  for i=1:length(sigma_e)
    fprintf(fid, '%g %g %g %g %g %g\n', sigma_e(i), theta(i), Temp(i), ...
            edot, T0, P);
  end
  fclose(fid);

