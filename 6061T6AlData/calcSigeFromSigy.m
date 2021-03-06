function calcSigeFromSigy

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
  set(fig10,'Position',[182 115 1131 813]);
 
  sig0 = [275 240 235 255 220 175 100 25];

  load SigEpsEp000057s77KOga.dat.raw
  dat = SigEpsEp000057s77KOga;
  filename = 'SigeEp000057s77KOga.dat';
  p1 = plotSigEp(dat, color(1,:), marker(1,:), filename, sig0(1));

  load SigEpsEp000057s201KOga.dat.raw
  dat = SigEpsEp000057s201KOga;
  filename = 'SigeEp000057s201KOga.dat';
  p2 = plotSigEp(dat, color(2,:), marker(2,:), filename, sig0(2));

  load SigEpsEp000057s289KOga.dat.raw
  dat = SigEpsEp000057s289KOga;
  filename = 'SigeEp000057s289KOga.dat';
  p3 = plotSigEp(dat, color(3,:), marker(3,:), filename, sig0(3));

  load SigEpsEp0000048s297KHog.dat.raw
  dat = SigEpsEp0000048s297KHog;
  filename = 'SigeEp0000048s297KHog.dat';
  p4 = plotSigEp(dat, color(4,:), marker(4,:), filename, sig0(4));

  load SigEpsEp000057s373KOga.dat.raw
  dat = SigEpsEp000057s373KOga;
  filename = 'SigeEp000057s373KOga.dat';
  p5 = plotSigEp(dat, color(5,:), marker(5,:), filename, sig0(5));

  load SigEpsEp000057s473KOga.dat.raw
  dat = SigEpsEp000057s473KOga;
  filename = 'SigeEp000057s473KOga.dat';
  p6 = plotSigEp(dat, color(6,:), marker(6,:), filename, sig0(6));

  load SigEpsEp0000010s533KHog.dat.raw
  dat = SigEpsEp0000010s533KHog;
  filename = 'SigeEp0000010s533KHog.dat';
  p7 = plotSigEp(dat, color(7,:), marker(7,:), filename, sig0(7));

  load SigEpsEp0000010s644KHog.dat.raw
  dat = SigEpsEp0000010s644KHog;
  filename = 'SigeEp0000010s644KHog.dat';
  p8 = plotSigEp(dat, color(8,:), marker(8,:), filename, sig0(8));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3], 'YLim', [0 250]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 115 1131 813]);

  sig0 = [310 300 300 281 255 230 280 270 188 250 130 145];

  load SigEpsEp0001s294KEle.dat.raw
  dat = SigEpsEp0001s294KEle;
  filename = 'SigeEp0001s294KEle.dat';
  p1 = plotSigEp(dat, color(1,:), marker(1,:), filename, sig0(1));

  load SigEpsEp0001s295KFis.dat.raw
  dat = SigEpsEp0001s295KFis;
  filename = 'SigeEp0001s295KFis.dat';
  p2 = plotSigEp(dat, color(1,:), marker(2,:), filename, sig0(2));

  load SigEpsEp0001s298KCad.dat.raw
  dat = SigEpsEp0001s298KCad;
  filename = 'SigeEp0001s298KCad.dat';
  p3 = plotSigEp(dat, color(1,:), marker(3,:), filename, sig0(3));

  load SigEpsEp0001s300K01MPaDav.dat.raw
  dat = SigEpsEp0001s300K01MPaDav;
  filename = 'SigeEp0001s300K01MPaDav.dat';
  p4 = plotSigEp(dat, color(1,:), marker(4,:), filename, sig0(4));

  load SigEpsEp0001s367K01MPaDav.dat.raw
  dat = SigEpsEp0001s367K01MPaDav;
  filename = 'SigeEp0001s367K01MPaDav.dat';
  p5 = plotSigEp(dat, color(5,:), marker(5,:), filename, sig0(5));

  load SigEpsEp0001s422K01MPaDav.dat.raw
  dat = SigEpsEp0001s422K01MPaDav;
  filename = 'SigeEp0001s422K01MPaDav.dat';
  p6 = plotSigEp(dat, color(6,:), marker(6,:), filename, sig0(6));

  load SigEpsEp0001s422KEle.dat.raw
  dat = SigEpsEp0001s422KEle;
  filename = 'SigeEp0001s422KEle.dat';
  p7 = plotSigEp(dat, color(6,:), marker(7,:), filename, sig0(7));

  load SigEpsEp0001s422KGre.dat.raw
  dat = SigEpsEp0001s422KGre;
  filename = 'SigeEp0001s422KGre.dat';
  p8 = plotSigEp(dat, color(6,:), marker(8,:), filename, sig0(8));

  load SigEpsEp0001s478K01MPaDav.dat.raw
  dat = SigEpsEp0001s478K01MPaDav;
  filename = 'SigeEp0001s478K01MPaDav.dat';
  p9 = plotSigEp(dat, color(9,:), marker(9,:), filename, sig0(9));

  load SigEpsEp0001s478KEle.dat.raw
  dat = SigEpsEp0001s478KEle;
  filename = 'SigeEp0001s478KEle.dat';
  p10 = plotSigEp(dat, color(9,:), marker(10,:), filename, sig0(10));

  load SigEpsEp0001s561KEle.dat.raw
  dat = SigEpsEp0001s561KEle;
  filename = 'SigeEp0001s561KEle.dat';
  p11 = plotSigEp(dat, color(11,:), marker(11,:), filename, sig0(11));

  load SigEpsEp0001s589KGre.dat.raw
  dat = SigEpsEp0001s589KGre;
  filename = 'SigeEp0001s589KGre.dat';
  p12 = plotSigEp(dat, color(12,:), marker(12,:), filename, sig0(12));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3], 'YLim', [0 350]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 115 1131 813]);

  sig0 = [305 265 250 230 280 210 240 140 120 55 30];

  load SigEpsEp0002s295KGre.dat.raw
  dat = SigEpsEp0002s295KGre;
  filename = 'SigeEp0002s295KGre.dat';
  p1 = plotSigEp(dat, color(1,:), marker(1,:), filename, sig0(1));

  load SigEpsEp0002s298KASM.dat.raw
  dat = SigEpsEp0002s298KASM;
  filename = 'SigeEp0002s298KASM.dat';
  p2 = plotSigEp(dat, color(1,:), marker(2,:), filename, sig0(2));

  load SigEpsEp0002s373KASM.dat.raw
  dat = SigEpsEp0002s373KASM;
  filename = 'SigeEp0002s373KASM.dat';
  p3 = plotSigEp(dat, color(2,:), marker(3,:), filename, sig0(3));

  load SigEpsEp0002s422KASM.dat.raw
  dat = SigEpsEp0002s422KASM;
  filename = 'SigeEp0002s422KASM.dat';
  p4 = plotSigEp(dat, color(3,:), marker(4,:), filename, sig0(4));

  load SigEpsEp0002s422KEle.dat.raw
  dat = SigEpsEp0002s422KEle;
  filename = 'SigeEp0002s422KEle.dat';
  p5 = plotSigEp(dat, color(3,:), marker(5,:), filename, sig0(5));

  load SigEpsEp0002s477KASM.dat.raw
  dat = SigEpsEp0002s477KASM;
  filename = 'SigeEp0002s477KASM.dat';
  p6 = plotSigEp(dat, color(4,:), marker(6,:), filename, sig0(6));

  load SigEpsEp0002s478KEle.dat.raw
  dat = SigEpsEp0002s478KEle;
  filename = 'SigeEp0002s478KEle.dat';
  p7 = plotSigEp(dat, color(4,:), marker(7,:), filename, sig0(7));

  load SigEpsEp0002s535KASM.dat.raw
  dat = SigEpsEp0002s535KASM;
  filename = 'SigeEp0002s535KASM.dat';
  p8 = plotSigEp(dat, color(5,:), marker(8,:), filename, sig0(8));

  load SigEpsEp0002s561KEle.dat.raw
  dat = SigEpsEp0002s561KEle;
  filename = 'SigeEp0002s561KEle.dat';
  p9 = plotSigEp(dat, color(6,:), marker(9,:), filename, sig0(9));

  load SigEpsEp0002s589KASM.dat.raw
  dat = SigEpsEp0002s589KASM;
  filename = 'SigeEp0002s589KASM.dat';
  p10 = plotSigEp(dat, color(7,:), marker(10,:), filename, sig0(10));

  load SigEpsEp0002s644KASM.dat.raw
  dat = SigEpsEp0002s644KASM;
  filename = 'SigeEp0002s644KASM.dat';
  p11 = plotSigEp(dat, color(8,:), marker(11,:), filename, sig0(11));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1], 'YLim', [0 350]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 115 1131 813]);

  sig0 = [280 288 253 131 143 151 160];

  load SigEpsEp002s422KEle.dat.raw
  dat = SigEpsEp002s422KEle;
  filename = 'SigeEp002s422KEle.dat';
  p1 = plotSigEp(dat, color(1,:), marker(1,:), filename, sig0(1));

  load SigEpsEp0085s422KEle.dat.raw
  dat = SigEpsEp0085s422KEle;
  filename = 'SigeEp0085s422KEle.dat';
  p2 = plotSigEp(dat, color(1,:), marker(2,:), filename, sig0(2));

  load SigEpsEp005s478KEle.dat.raw
  dat = SigEpsEp005s478KEle;
  filename = 'SigeEp005s478KEle.dat';
  p3 = plotSigEp(dat, color(2,:), marker(3,:), filename, sig0(3));

  load SigEpsEp002s561KEle.dat.raw
  dat = SigEpsEp002s561KEle;
  filename = 'SigeEp002s561KEle.dat';
  p4 = plotSigEp(dat, color(3,:), marker(4,:), filename, sig0(4));

  load SigEpsEp006s561KEle.dat.raw
  dat = SigEpsEp006s561KEle;
  filename = 'SigeEp006s561KEle.dat';
  p5 = plotSigEp(dat, color(3,:), marker(5,:), filename, sig0(5));

  load SigEpsEp0085s561KEle.dat.raw
  dat = SigEpsEp0085s561KEle;
  filename = 'SigeEp0085s561KEle.dat';
  p6 = plotSigEp(dat, color(3,:), marker(6,:), filename, sig0(6));

  load SigEpsEp015s561KEle.dat.raw
  dat = SigEpsEp015s561KEle;
  filename = 'SigeEp015s561KEle.dat';
  p7 = plotSigEp(dat, color(3,:), marker(7,:), filename, sig0(7));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1], 'YLim',[0 350]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 115 1131 813]);

  sig0 = [286 263 165 165];

  load SigEpsEp11s422KEle.dat.raw
  dat = SigEpsEp11s422KEle;
  filename = 'SigeEp11s422KEle.dat';
  p1 = plotSigEp(dat, color(1,:), marker(1,:), filename, sig0(1));

  load SigEpsEp075s478KEle.dat.raw
  dat = SigEpsEp075s478KEle;
  filename = 'SigeEp075s478KEle.dat';
  p2 = plotSigEp(dat, color(2,:), marker(2,:), filename, sig0(2));

  load SigEpsEp070s561KEle.dat.raw
  dat = SigEpsEp070s561KEle;
  filename = 'SigeEp070s561KEle.dat';
  p3 = plotSigEp(dat, color(3,:), marker(3,:), filename, sig0(3));

  load SigEpsEp12s561KEle.dat.raw
  dat = SigEpsEp12s561KEle;
  filename = 'SigeEp12s561KEle.dat';
  p4 = plotSigEp(dat, color(3,:), marker(4,:), filename, sig0(4));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1], 'YLim', [0 350]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 115 1131 813]);

  sig0 = [280 295 263 190];

  load SigEpsEp85s422KEle.dat.raw
  dat = SigEpsEp85s422KEle;
  filename = 'SigeEp85s422KEle.dat';
  p1 = plotSigEp(dat, color(1,:), marker(1,:), filename, sig0(1));

  load SigEpsEp9s422KGre.dat.raw
  dat = SigEpsEp9s422KGre;
  filename = 'SigeEp9s422KGre.dat';
  p2 = plotSigEp(dat, color(1,:), marker(2,:), filename, sig0(2));

  load SigEpsEp5s478KEle.dat.raw
  dat = SigEpsEp5s478KEle;
  filename = 'SigeEp5s478KEle.dat';
  p3 = plotSigEp(dat, color(2,:), marker(3,:), filename, sig0(3));

  load SigEpsEp10s589KGre.dat.raw
  dat = SigEpsEp10s589KGre;
  filename = 'SigeEp10s589KGre.dat';
  p4 = plotSigEp(dat, color(3,:), marker(4,:), filename, sig0(4));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 115 1131 813]);

  sig0 = [308 295 288 270 208 170];

  load SigEpsEp18s295KGre.dat.raw
  dat = SigEpsEp18s295KGre;
  filename = 'SigeEp18s295KGre.dat';
  p1 = plotSigEp(dat, color(1,:), marker(1,:), filename, sig0(1));

  load SigEpsEp28s297KHog.dat.raw
  dat = SigEpsEp28s297KHog;
  filename = 'SigeEp28s297KHog.dat';
  p2 = plotSigEp(dat, color(1,:), marker(2,:), filename, sig0(2));

  load SigEpsEp30s422KEle.dat.raw
  dat = SigEpsEp30s422KEle;
  filename = 'SigeEp30s422KEle.dat';
  p3 = plotSigEp(dat, color(2,:), marker(3,:), filename, sig0(3));

  load SigEpsEp30s478KEle.dat.raw
  dat = SigEpsEp30s478KEle;
  filename = 'SigeEp30s478KEle.dat';
  p4 = plotSigEp(dat, color(3,:), marker(4,:), filename, sig0(4));

  load SigEpsEp18s533KHog.dat.raw
  dat = SigEpsEp18s533KHog;
  filename = 'SigeEp18s533KHog.dat';
  p5 = plotSigEp(dat, color(4,:), marker(5,:), filename, sig0(5));

  load SigEpsEp23s644KHog.dat.raw
  dat = SigEpsEp23s644KHog;
  filename = 'SigeEp23s644KHog.dat';
  p6 = plotSigEp(dat, color(5,:), marker(6,:), filename, sig0(6));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1], 'YLim', [0 350]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 115 1131 813]);

  sig0 = [320 170 205];

  load SigEpsEp65s297KHog.dat.raw
  dat = SigEpsEp65s297KHog;
  filename = 'SigeEp65s297KHog.dat';
  p1 = plotSigEp(dat, color(1,:), marker(1,:), filename, sig0(1));

  load SigEpsEp50s561KEle.dat.raw
  dat = SigEpsEp50s561KEle;
  filename = 'SigeEp50s561KEle.dat';
  p2 = plotSigEp(dat, color(2,:), marker(2,:), filename, sig0(2));

  load SigEpsEp54s644KHog.dat.raw
  dat = SigEpsEp54s644KHog;
  filename = 'SigeEp54s644KHog.dat';
  p3 = plotSigEp(dat, color(3,:), marker(3,:), filename, sig0(3));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1], 'YLim', [0 300]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 115 1131 813]);

  sig0 = [263 310 275];

  load SigEpsEp380s298KYad.dat.raw
  dat = SigEpsEp380s298KYad;
  filename = 'SigeEp380s298KYad.dat';
  p1 = plotSigEp(dat, color(1,:), marker(1,:), filename, sig0(1));

  load SigEpsEp500s298KYad.dat.raw
  dat = SigEpsEp500s298KYad;
  filename = 'SigeEp500s298KYad.dat';
  p2 = plotSigEp(dat, color(1,:), marker(2,:), filename, sig0(2));

  load SigEpsEp130s533KHog.dat.raw
  dat = SigEpsEp130s533KHog;
  filename = 'SigeEp130s533KHog.dat';
  p3 = plotSigEp(dat, color(2,:), marker(3,:), filename, sig0(3));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.2], 'YLim', [0 350]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 115 1131 813]);

  sig0 = [305 325 300 290 220 275 276 180 180 70];

  load SigEpsEp1000s294KEle.dat.raw
  dat = SigEpsEp1000s294KEle;
  filename = 'SigeEp1000s294KEle.dat';
  p1 = plotSigEp(dat, color(1,:), marker(1,:), filename, sig0(1));

  load SigEpsEp1000s298KLee.dat.raw
  dat = SigEpsEp1000s298KLee;
  filename = 'SigeEp1000s298KLee.dat';
  p2 = plotSigEp(dat, color(1,:), marker(2,:), filename, sig0(2));

  load SigEpsEp1000s298KRos.dat.raw
  dat = SigEpsEp1000s298KRos;
  filename = 'SigeEp1000s298KRos.dat';
  p3 = plotSigEp(dat, color(1,:), marker(3,:), filename, sig0(3));

  load SigEpsEp1000s422KEle.dat.raw
  dat = SigEpsEp1000s422KEle;
  filename = 'SigeEp1000s422KEle.dat';
  p4 = plotSigEp(dat, color(2,:), marker(4,:), filename, sig0(4));

  load SigEpsEp1000s463KRos.dat.raw
  dat = SigEpsEp1000s463KRos;
  filename = 'SigeEp1000s463KRos.dat';
  p5 = plotSigEp(dat, color(3,:), marker(5,:), filename, sig0(5));

  load SigEpsEp900s478KEle.dat.raw
  dat = SigEpsEp900s478KEle;
  filename = 'SigeEp900s478KEle.dat';
  p6 = plotSigEp(dat, color(4,:), marker(6,:), filename, sig0(6));

  load SigEpsEp1000s478KEle.dat.raw
  dat = SigEpsEp1000s478KEle;
  filename = 'SigeEp1000s478KEle.dat';
  p7 = plotSigEp(dat, color(4,:), marker(7,:), filename, sig0(7));

  load SigEpsEp1000s561KEle.dat.raw
  dat = SigEpsEp1000s561KEle;
  filename = 'SigeEp1000s561KEle.dat';
  p8 = plotSigEp(dat, color(5,:), marker(8,:), filename, sig0(8));

  load SigEpsEp1150s561KEle.dat.raw
  dat = SigEpsEp1150s561KEle;
  filename = 'SigeEp1150s561KEle.dat';
  p9 = plotSigEp(dat, color(5,:), marker(9,:), filename, sig0(9));

  load SigEpsEp1000s618KRos.dat.raw
  dat = SigEpsEp1000s618KRos;
  filename = 'SigeEp1000s618KRos.dat';
  p10 = plotSigEp(dat, color(6,:), marker(10,:), filename, sig0(10));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.26], 'YLim', [0 350]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 115 1131 813]);

  sig0 = [325 270 260 315 340 310 240 230];

  load SigEpsEp1500s77KOga.dat.raw
  dat = SigEpsEp1500s77KOga;
  filename = 'SigeEp1500s77KOga.dat';
  p1 = plotSigEp(dat, color(1,:), marker(1,:), filename, sig0(1));

  load SigEpsEp1500s201KOga.dat.raw
  dat = SigEpsEp1500s201KOga;
  filename = 'SigeEp1500s201KOga.dat';
  p2 = plotSigEp(dat, color(2,:), marker(2,:), filename, sig0(2));

  load SigEpsEp1500s289KOga.dat.raw
  dat = SigEpsEp1500s289KOga;
  filename = 'SigeEp1500s289KOga.dat';
  p3 = plotSigEp(dat, color(3,:), marker(3,:), filename, sig0(3));

  load SigEpsEp2500s295KFis.dat.raw
  dat = SigEpsEp2500s295KFis;
  filename = 'SigeEp2500s295KFis.dat';
  p4 = plotSigEp(dat, color(4,:), marker(4,:), filename, sig0(4));

  load SigEpsEp2000s298KLee.dat.raw
  dat = SigEpsEp2000s298KLee;
  filename = 'SigeEp2000s298KLee.dat';
  p5 = plotSigEp(dat, color(4,:), marker(5,:), filename, sig0(5));

  load SigEpsEp2000s298KYad.dat.raw
  dat = SigEpsEp2000s298KYad;
  filename = 'SigeEp2000s298KYad.dat';
  p6 = plotSigEp(dat, color(4,:), marker(6,:), filename, sig0(6));

  load SigEpsEp1500s373KOga.dat.raw
  dat = SigEpsEp1500s373KOga;
  filename = 'SigeEp1500s373KOga.dat';
  p7 = plotSigEp(dat, color(5,:), marker(7,:), filename, sig0(7));

  load SigEpsEp1500s473KOga.dat.raw
  dat = SigEpsEp1500s473KOga;
  filename = 'SigeEp1500s473KOga.dat';
  p8 = plotSigEp(dat, color(6,:), marker(8,:), filename, sig0(8));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.25], 'YLim', [0 300]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 115 1131 813]);

  sig0 = [347 340 350 360 345 370 355];

  load SigEpsEp3000s298KLee.dat.raw
  dat = SigEpsEp3000s298KLee;
  filename = 'SigeEp3000s298KLee.dat';
  p1 = plotSigEp(dat, color(1,:), marker(1,:), filename, sig0(1));

  load SigEpsEp3600s298KYad.dat.raw
  dat = SigEpsEp3600s298KYad;
  filename = 'SigeEp3600s298KYad.dat';
  p2 = plotSigEp(dat, color(2,:), marker(2,:), filename, sig0(2));

  load SigEpsEp4000s298KCad.dat.raw
  dat = SigEpsEp4000s298KCad;
  filename = 'SigeEp4000s298KCad.dat';
  p3 = plotSigEp(dat, color(3,:), marker(3,:), filename, sig0(3));

  load SigEpsEp4000s298KLee.dat.raw
  dat = SigEpsEp4000s298KLee;
  filename = 'SigeEp4000s298KLee.dat';
  p4 = plotSigEp(dat, color(3,:), marker(4,:), filename, sig0(4));

  load SigEpsEp4000s298KLes.dat.raw
  dat = SigEpsEp4000s298KLes;
  filename = 'SigeEp4000s298KLes.dat';
  p5 = plotSigEp(dat, color(3,:), marker(5,:), filename, sig0(5));

  load SigEpsEp8000s298KLes.dat.raw
  dat = SigEpsEp8000s298KLes;
  filename = 'SigeEp8000s298KLes.dat';
  p6 = plotSigEp(dat, color(4,:), marker(6,:), filename, sig0(6));

  load SigEpsEp29000s298KRam.dat.raw
  dat = SigEpsEp29000s298KRam;
  filename = 'SigeEp29000s298KRam.dat';
  p7 = plotSigEp(dat, color(5,:), marker(7,:), filename, sig0(7));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.5], 'YLim', [0 300]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
function [p] = plotSigEp(dat, color, marker, filename, sig_ipa)

  %
  % Read data
  %
  P = dat(1,1);
  T0 = dat(1,2);
  edot = dat(1,3);
  ep = dat(:,5);
  sig_y = dat(:,6);

  %
  % Determine number of load increments
  %
  epmax = max(ep);
  ninc = 50;
  Tmax = epmax/edot;
  delT = Tmax/ninc;

  %
  % Compute sigma_e
  %
  for i=1:length(ep)
    sig_m = sig_y(i);
    ep_m =  ep(i);
    if (ep_m > 0)
      T = computeTemp(delT, sig_m, ep_m, edot, T0);
    else
      T = T0;
    end
    sige = computeScaledSige(T, sig_m, sig_ipa);
    Se = computeSe(T, edot);
    sig_e(i) = sige/Se;
    TT(i) = T;
  end
  p = plot(ep, sig_e, 'p-', 'LineWidth', 2); hold on;
  set(p,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);

  %
  % Write output file
  %
  fid = fopen(filename, 'w');
  for i=1:length(ep)
    fprintf(fid, '%g %g %g %g %g %g\n', ep(i), sig_e(i), TT(i), edot, T0, P);
  end
  fclose(fid);

%====================================================================
% Compute scaled sige
%
function [sige] = computeScaledSige(T, sigy, sig_ipa)

  rho = 2700.0;
  rho0 = 2700.0;
  P = calcP(rho0, rho0, 0, 0);
  Tm = calcTm(rho0, rho0);
  mu_0 = calcmu(rho0, rho0, Tm, P, 0);
  P = calcP(rho, rho0, T, T);
  Tm = calcTm(rho, rho0);
  mu = calcmu(rho, rho0, Tm, P, T);
  sige = mu_0/mu*(sigy - sig_ipa);

%====================================================================
% Compute Se
%
function [Se] = computeSe(T, edot)

  rho = 2700.0;
  rho0 = 2700.0;
  k = 1.3806503e-23;
  b = 2.86e-10; % Wang, Physica Status Solidi A, 169(43), 1998, p. 46.

  g0e = 1.6;
  edot_0e = 1.0e9;
  q_e = 1.0;
  p_e = 0.75;

  P = calcP(rho, rho0, T, T);
  Tm = calcTm(rho, rho0);
  mu = calcmu(rho, rho0, Tm, P, T);
  Se_q = (k*T/(g0e*mu*b^3)*log(edot_0e/edot))^(1/q_e);
  Se = (1 - Se_q)^(1/p_e);

%====================================================================
% Compute the adiabatic temperature
%
function [T] = computeTemp(delT, sig, ep, epdot, T0)

  format short e
  rho0 = 2700.0;
  tmax = ep/epdot;
  m = tmax/delT;
  rho = rho0;
  T = T0;
  ep = 0.0;
  for i=1:m
    Cp = calcCp(T);
    fac = 0.9/(rho*Cp);
    T = T + sig*epdot*fac*delT*1.0e6; 
  end

%====================================================================
% Compute specific heat
%
function [Cp] = calcCp(T)

  A1 = -11.73;
  B1 = 6.28;
  C1 = -0.011;
  A2 = 743.13;
  B2 = 0.51;

  if (T < 273.15) 
    Cp = A1 + B1*T + C1*T^2;
  else
    Cp = A2 + B2*T;
  end

%====================================================================
% Compute pressure (Mie-Gruneisen EOS)
%
function [p] = calcP(rho, rho0, T, T0)

  eta = rho/rho0;
  C0 = 5433.0;
  Gamma0 = 2.23;
  S_alpha = 1.36;

  Cv = calcCp(T);
  zeta = rho/rho0 - 1;
  E = Cv*(T-T0)*rho0;

  if (rho == rho0)
    p = Gamma0*E;
  else
    numer = rho0*C0^2*(1/zeta + 1 - 0.5*Gamma0);
    denom = 1/zeta + 1 - S_alpha;
    p = numer/denom^2 + Gamma0*E;
  end

%====================================================================
% Compute melting temperature (SCG melt temperature model)
%
function [Tm] = calcTm(rho, rho0)

  Tm0 = 934.0;
  Gamma0 = 2.23;
  a = 3.0;

  eta = rho/rho0;
  power = 2.0*(Gamma0 - a - 1.0/3.0);
  Tm = Tm0*exp(2.0*a*(1.0 - 1.0/eta))*eta^power;

%====================================================================
% Compute shear modulus (NP shear modulus model)
%
function [mu] = calcmu(rho, rho0, Tm, P, T)

  mu0 = 33.3e9;
  zeta = 0.04;
  dmu_dp = 1.8;
  dmu_dp_mu0 = dmu_dp/mu0;
  C = 0.057;
  m = 26.98;
  k = 1.38e4/1.6605402;

  That = T/Tm;
  if (That < 1+zeta)
    denom = zeta*(1 - That/(1+zeta));
    t0 = 1 - That;
    J = 1 + exp(-t0/denom);
    eta = (rho/rho0)^(1/3);
    t1 = mu0*(1 + dmu_dp_mu0*P/eta);
    t2 = rho*k*T/(C*m);
    mu = (t0*t1 + t2)/J;
  else
    mu = 0;
  end

