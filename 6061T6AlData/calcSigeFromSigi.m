%====================================================================
%
% Plot the tangent modulus vs sigma_e to find sigma_es
%
function calcSigeFromSigi

  marker = ['o';'p';'v';'s';'d';'^';'h';'<';'x';'>';'+';'*'];
  color = [[0.90 0.10 0.10];[0.10 0.90 0.10];[0.10 0.10 0.90];...
           [0.75 0.25 1.00];[1.00 0.75 0.25];[0.15 0.30 0.70];...
           [0.10 0.80 0.30];[0.25 0.75 1.00];[0.66 0.60 0.00];...
           [0.60 0.20 0.00];[0.60 0.72 0.00];[0.30 0.55 0.60]];

  plot0000Edot(marker, color);
  %plot0001Edot(marker, color);
  %plot0002Edot(marker, color);
  %plot01Edot(marker, color);
  %plot1Edot(marker, color);
  %plot10Edot(marker, color);
  %plot25Edot(marker, color);
  %plot55Edot(marker, color);
  %plot350Edot(marker, color);
  %plot1000Edot(marker, color);
  %plot2000Edot(marker, color);
  %plot4000Edot(marker, color);

%====================================================================
%
% Load experimental data for strain rate of 1.0e-5/s, 4.8e-5/s, 5.7e-4/s
%
function plot0000Edot(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);
 
  load SigEpsEp000057s77KOga.dat.raw
  dat = SigEpsEp000057s77KOga;
  filename = 'SigeEp000057s77KOga.dat';
  p1 = calcPlotSige(dat, color(1,:), marker(1,:), filename);

  load SigEpsEp000057s201KOga.dat.raw
  dat = SigEpsEp000057s201KOga;
  filename = 'SigeEp000057s201KOga.dat';
  p2 = calcPlotSige(dat, color(2,:), marker(2,:), filename);

  load SigEpsEp000057s289KOga.dat.raw
  dat = SigEpsEp000057s289KOga;
  filename = 'SigeEp000057s289KOga.dat';
  p3 = calcPlotSige(dat, color(3,:), marker(3,:), filename);

  load SigEpsEp0000048s297KHog.dat.raw
  dat = SigEpsEp0000048s297KHog;
  filename = 'SigeEp0000048s297KHog.dat';
  p4 = calcPlotSige(dat, color(4,:), marker(4,:), filename);

  load SigEpsEp000057s373KOga.dat.raw
  dat = SigEpsEp000057s373KOga;
  filename = 'SigeEp000057s373KOga.dat';
  p5 = calcPlotSige(dat, color(5,:), marker(5,:), filename);

  load SigEpsEp000057s473KOga.dat.raw
  dat = SigEpsEp000057s473KOga;
  filename = 'SigeEp000057s473KOga.dat';
  p6 = calcPlotSige(dat, color(6,:), marker(6,:), filename);

  load SigEpsEp0000010s533KHog.dat.raw
  dat = SigEpsEp0000010s533KHog;
  filename = 'SigeEp0000010s533KHog.dat';
  p7 = calcPlotSige(dat, color(7,:), marker(7,:), filename);

  load SigEpsEp0000010s644KHog.dat.raw
  dat = SigEpsEp0000010s644KHog;
  filename = 'SigeEp0000010s644KHog.dat';
  p8 = calcPlotSige(dat, color(8,:), marker(8,:), filename);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3]);
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
function plot0001Edot(fid, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  sig0 = [310 300 300 281 255 230 280 270 188 250 130 145];

  load SigEpsEp0001s294KEle.dat.raw
  dat = SigEpsEp0001s294KEle;
  p1 = plotSigEp(dat, color(1,:), fid, sig0(1));

  load SigEpsEp0001s295KFis.dat.raw
  dat = SigEpsEp0001s295KFis;
  p2 = plotSigEp(dat, color(1,:), fid, sig0(2));

  load SigEpsEp0001s298KCad.dat.raw
  dat = SigEpsEp0001s298KCad;
  p3 = plotSigEp(dat, color(1,:), fid, sig0(3));

  load SigEpsEp0001s300K01MPaDav.dat.raw
  dat = SigEpsEp0001s300K01MPaDav;
  p4 = plotSigEp(dat, color(1,:), fid, sig0(4));

  load SigEpsEp0001s367K01MPaDav.dat.raw
  dat = SigEpsEp0001s367K01MPaDav;
  p5 = plotSigEp(dat, color(5,:), fid, sig0(5));

  load SigEpsEp0001s422K01MPaDav.dat.raw
  dat = SigEpsEp0001s422K01MPaDav;
  p6 = plotSigEp(dat, color(6,:), fid, sig0(6));

  load SigEpsEp0001s422KEle.dat.raw
  dat = SigEpsEp0001s422KEle;
  p7 = plotSigEp(dat, color(6,:), fid, sig0(7));

  load SigEpsEp0001s422KGre.dat.raw
  dat = SigEpsEp0001s422KGre;
  p8 = plotSigEp(dat, color(6,:), fid, sig0(8));

  load SigEpsEp0001s478K01MPaDav.dat.raw
  dat = SigEpsEp0001s478K01MPaDav;
  p9 = plotSigEp(dat, color(9,:), fid, sig0(9));

  load SigEpsEp0001s478KEle.dat.raw
  dat = SigEpsEp0001s478KEle;
  p10 = plotSigEp(dat, color(9,:), fid, sig0(10));

  load SigEpsEp0001s561KEle.dat.raw
  dat = SigEpsEp0001s561KEle;
  p11 = plotSigEp(dat, color(11,:), fid, sig0(11));

  load SigEpsEp0001s589KGre.dat.raw
  dat = SigEpsEp0001s589KGre;
  p12 = plotSigEp(dat, color(12,:), fid, sig0(12));

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
% Load experimental data for strain rate of 2.0e-3/s
%
function plot0002Edot(fid, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  sig0 = [305 265 250 230 280 210 240 140 120 55 30];

  load SigEpsEp0002s295KGre.dat.raw
  dat = SigEpsEp0002s295KGre;
  p1 = plotSigEp(dat, color(1,:), fid, sig0(1));

  load SigEpsEp0002s298KASM.dat.raw
  dat = SigEpsEp0002s298KASM;
  p2 = plotSigEp(dat, color(1,:), fid, sig0(2));

  load SigEpsEp0002s373KASM.dat.raw
  dat = SigEpsEp0002s373KASM;
  p3 = plotSigEp(dat, color(2,:), fid, sig0(3));

  load SigEpsEp0002s422KASM.dat.raw
  dat = SigEpsEp0002s422KASM;
  p4 = plotSigEp(dat, color(3,:), fid, sig0(4));

  load SigEpsEp0002s422KEle.dat.raw
  dat = SigEpsEp0002s422KEle;
  p5 = plotSigEp(dat, color(3,:), fid, sig0(5));

  load SigEpsEp0002s477KASM.dat.raw
  dat = SigEpsEp0002s477KASM;
  p6 = plotSigEp(dat, color(4,:), fid, sig0(6));

  load SigEpsEp0002s478KEle.dat.raw
  dat = SigEpsEp0002s478KEle;
  p7 = plotSigEp(dat, color(4,:), fid, sig0(7));

  load SigEpsEp0002s535KASM.dat.raw
  dat = SigEpsEp0002s535KASM;
  p8 = plotSigEp(dat, color(5,:), fid, sig0(8));

  load SigEpsEp0002s561KEle.dat.raw
  dat = SigEpsEp0002s561KEle;
  p9 = plotSigEp(dat, color(6,:), fid, sig0(9));

  load SigEpsEp0002s589KASM.dat.raw
  dat = SigEpsEp0002s589KASM;
  p10 = plotSigEp(dat, color(7,:), fid, sig0(10));

  load SigEpsEp0002s644KASM.dat.raw
  dat = SigEpsEp0002s644KASM;
  p11 = plotSigEp(dat, color(8,:), fid, sig0(11));

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
function plot01Edot(fid, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  sig0 = [280 288 253 131 143 151 160];

  load SigEpsEp002s422KEle.dat.raw
  dat = SigEpsEp002s422KEle;
  p1 = plotSigEp(dat, color(1,:), fid, sig0(1));

  load SigEpsEp0085s422KEle.dat.raw
  dat = SigEpsEp0085s422KEle;
  p2 = plotSigEp(dat, color(1,:), fid, sig0(2));

  load SigEpsEp005s478KEle.dat.raw
  dat = SigEpsEp005s478KEle;
  p3 = plotSigEp(dat, color(2,:), fid, sig0(3));

  load SigEpsEp002s561KEle.dat.raw
  dat = SigEpsEp002s561KEle;
  p4 = plotSigEp(dat, color(3,:), fid, sig0(4));

  load SigEpsEp006s561KEle.dat.raw
  dat = SigEpsEp006s561KEle;
  p5 = plotSigEp(dat, color(3,:), fid, sig0(5));

  load SigEpsEp0085s561KEle.dat.raw
  dat = SigEpsEp0085s561KEle;
  p6 = plotSigEp(dat, color(3,:), fid, sig0(6));

  load SigEpsEp015s561KEle.dat.raw
  dat = SigEpsEp015s561KEle;
  p7 = plotSigEp(dat, color(3,:), fid, sig0(7));

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
function plot1Edot(fid, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  sig0 = [286 263 165 165];

  load SigEpsEp11s422KEle.dat.raw
  dat = SigEpsEp11s422KEle;
  p1 = plotSigEp(dat, color(1,:), fid, sig0(1));

  load SigEpsEp075s478KEle.dat.raw
  dat = SigEpsEp075s478KEle;
  p2 = plotSigEp(dat, color(2,:), fid, sig0(2));

  load SigEpsEp070s561KEle.dat.raw
  dat = SigEpsEp070s561KEle;
  p3 = plotSigEp(dat, color(3,:), fid, sig0(3));

  load SigEpsEp12s561KEle.dat.raw
  dat = SigEpsEp12s561KEle;
  p4 = plotSigEp(dat, color(3,:), fid, sig0(4));

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
function plot10Edot(fid, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  sig0 = [280 295 263 190];

  load SigEpsEp85s422KEle.dat.raw
  dat = SigEpsEp85s422KEle;
  p1 = plotSigEp(dat, color(1,:), fid, sig0(1));

  load SigEpsEp9s422KGre.dat.raw
  dat = SigEpsEp9s422KGre;
  p2 = plotSigEp(dat, color(1,:), fid, sig0(2));

  load SigEpsEp5s478KEle.dat.raw
  dat = SigEpsEp5s478KEle;
  p3 = plotSigEp(dat, color(2,:), fid, sig0(3));

  load SigEpsEp10s589KGre.dat.raw
  dat = SigEpsEp10s589KGre;
  p4 = plotSigEp(dat, color(3,:), fid, sig0(4));

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
function plot25Edot(fid, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  sig0 = [308 295 288 270 208 170];

  load SigEpsEp18s295KGre.dat.raw
  dat = SigEpsEp18s295KGre;
  p1 = plotSigEp(dat, color(1,:), fid, sig0(1));

  load SigEpsEp28s297KHog.dat.raw
  dat = SigEpsEp28s297KHog;
  p2 = plotSigEp(dat, color(1,:), fid, sig0(2));

  load SigEpsEp30s422KEle.dat.raw
  dat = SigEpsEp30s422KEle;
  p3 = plotSigEp(dat, color(2,:), fid, sig0(3));

  load SigEpsEp30s478KEle.dat.raw
  dat = SigEpsEp30s478KEle;
  p4 = plotSigEp(dat, color(3,:), fid, sig0(4));

  load SigEpsEp18s533KHog.dat.raw
  dat = SigEpsEp18s533KHog;
  p5 = plotSigEp(dat, color(4,:), fid, sig0(5));

  load SigEpsEp23s644KHog.dat.raw
  dat = SigEpsEp23s644KHog;
  p6 = plotSigEp(dat, color(5,:), fid, sig0(6));

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
function plot55Edot(fid, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  sig0 = [320 170 205];

  load SigEpsEp65s297KHog.dat.raw
  dat = SigEpsEp65s297KHog;
  p1 = plotSigEp(dat, color(1,:), fid, sig0(1));

  load SigEpsEp50s561KEle.dat.raw
  dat = SigEpsEp50s561KEle;
  p2 = plotSigEp(dat, color(2,:), fid, sig0(2));

  load SigEpsEp54s644KHog.dat.raw
  dat = SigEpsEp54s644KHog;
  p3 = plotSigEp(dat, color(3,:), fid, sig0(3));

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
function plot350Edot(fid, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  sig0 = [263 310 275];

  load SigEpsEp380s298KYad.dat.raw
  dat = SigEpsEp380s298KYad;
  p1 = plotSigEp(dat, color(1,:), fid, sig0(1));

  load SigEpsEp500s298KYad.dat.raw
  dat = SigEpsEp500s298KYad;
  p2 = plotSigEp(dat, color(1,:), fid, sig0(2));

  load SigEpsEp130s533KHog.dat.raw
  dat = SigEpsEp130s533KHog;
  p3 = plotSigEp(dat, color(2,:), fid, sig0(3));

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
function plot1000Edot(fid, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  sig0 = [305 325 300 290 220 275 276 180 180 70];

  load SigEpsEp1000s294KEle.dat.raw
  dat = SigEpsEp1000s294KEle;
  p1 = plotSigEp(dat, color(1,:), fid, sig0(1));

  load SigEpsEp1000s298KLee.dat.raw
  dat = SigEpsEp1000s298KLee;
  p2 = plotSigEp(dat, color(1,:), fid, sig0(2));

  load SigEpsEp1000s298KRos.dat.raw
  dat = SigEpsEp1000s298KRos;
  p3 = plotSigEp(dat, color(1,:), fid, sig0(3));

  load SigEpsEp1000s422KEle.dat.raw
  dat = SigEpsEp1000s422KEle;
  p4 = plotSigEp(dat, color(2,:), fid, sig0(4));

  load SigEpsEp1000s463KRos.dat.raw
  dat = SigEpsEp1000s463KRos;
  p5 = plotSigEp(dat, color(3,:), fid, sig0(5));

  load SigEpsEp900s478KEle.dat.raw
  dat = SigEpsEp900s478KEle;
  p6 = plotSigEp(dat, color(4,:), fid, sig0(6));

  load SigEpsEp1000s478KEle.dat.raw
  dat = SigEpsEp1000s478KEle;
  p7 = plotSigEp(dat, color(4,:), fid, sig0(7));

  load SigEpsEp1000s561KEle.dat.raw
  dat = SigEpsEp1000s561KEle;
  p8 = plotSigEp(dat, color(5,:), fid, sig0(8));

  load SigEpsEp1150s561KEle.dat.raw
  dat = SigEpsEp1150s561KEle;
  p9 = plotSigEp(dat, color(5,:), fid, sig0(9));

  load SigEpsEp1000s618KRos.dat.raw
  dat = SigEpsEp1000s618KRos;
  p10 = plotSigEp(dat, color(6,:), fid, sig0(10));

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
function plot2000Edot(fid, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  sig0 = [325 270 260 315 340 310 240 230];

  load SigEpsEp1500s77KOga.dat.raw
  dat = SigEpsEp1500s77KOga;
  p1 = plotSigEp(dat, color(1,:), fid, sig0(1));

  load SigEpsEp1500s201KOga.dat.raw
  dat = SigEpsEp1500s201KOga;
  p2 = plotSigEp(dat, color(2,:), fid, sig0(2));

  load SigEpsEp1500s289KOga.dat.raw
  dat = SigEpsEp1500s289KOga;
  p3 = plotSigEp(dat, color(3,:), fid, sig0(3));

  load SigEpsEp2500s295KFis.dat.raw
  dat = SigEpsEp2500s295KFis;
  p4 = plotSigEp(dat, color(4,:), fid, sig0(4));

  load SigEpsEp2000s298KLee.dat.raw
  dat = SigEpsEp2000s298KLee;
  p5 = plotSigEp(dat, color(4,:), fid, sig0(5));

  load SigEpsEp2000s298KYad.dat.raw
  dat = SigEpsEp2000s298KYad;
  p6 = plotSigEp(dat, color(4,:), fid, sig0(6));

  load SigEpsEp1500s373KOga.dat.raw
  dat = SigEpsEp1500s373KOga;
  p7 = plotSigEp(dat, color(5,:), fid, sig0(7));

  load SigEpsEp1500s473KOga.dat.raw
  dat = SigEpsEp1500s473KOga;
  p8 = plotSigEp(dat, color(6,:), fid, sig0(8));

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
function plot4000Edot(fid, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  sig0 = [347 340 350 360 345 370 355];

  load SigEpsEp3000s298KLee.dat.raw
  dat = SigEpsEp3000s298KLee;
  p1 = plotSigEp(dat, color(1,:), fid, sig0(1));

  load SigEpsEp3600s298KYad.dat.raw
  dat = SigEpsEp3600s298KYad;
  p2 = plotSigEp(dat, color(2,:), fid, sig0(2));

  load SigEpsEp4000s298KCad.dat.raw
  dat = SigEpsEp4000s298KCad;
  p3 = plotSigEp(dat, color(3,:), fid, sig0(3));

  load SigEpsEp4000s298KLee.dat.raw
  dat = SigEpsEp4000s298KLee;
  p4 = plotSigEp(dat, color(3,:), fid, sig0(4));

  load SigEpsEp4000s298KLes.dat.raw
  dat = SigEpsEp4000s298KLes;
  p5 = plotSigEp(dat, color(3,:), fid, sig0(5));

  load SigEpsEp8000s298KLes.dat.raw
  dat = SigEpsEp8000s298KLes;
  p6 = plotSigEp(dat, color(4,:), fid, sig0(6));

  load SigEpsEp29000s298KRam.dat.raw
  dat = SigEpsEp29000s298KRam;
  p7 = plotSigEp(dat, color(5,:), fid, sig0(7));

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
% Calc Sige and plot Sige-ep curves 
%
function [p] = calcPlotSige(dat, color, marker, filename);

  % Read data
  P = dat(1,1);
  T0 = dat(1,2);
  edot = dat(1,3);
  ep = dat(:,5);
  sig = dat(:,6)*1.0e6;

  %
  % Determine number of load increments
  %
  epmax = max(ep);
  ninc = 50;
  Tmax = epmax/edot;
  delT = Tmax/ninc;

  % Compute sige and write out to file
  fid = fopen(filename, 'w');
  for i=1:length(ep)
    sig_m = sig(i);
    ep_m =  ep(i);
    T = computeTemp(delT, sig_m, ep_m, edot, T0);
    [sig_e, sig_i, mu0, mu] = computeSige(sig_m, edot, T, T0);
    fprintf(fid, '%g %g %g %g %g %g %g %g %g %g\n', ...
            edot, T0, P, ep_m, sig_e, ...
            sig_m, sig_i, mu0, mu, T);
    sige(i) = sig_e;
  end
  fclose(fid);

  % Plot sige vs ep
  p = plot(ep, sige, 'p-', 'LineWidth', 2); hold on;
  set(p,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);


%====================================================================
% Compute the adiabatic temperature
%
function [T] = computeTemp(delT, sig, ep, epdot, T0)

  rho0 = 2700.0;
  tmax = ep/epdot;
  m = tmax/delT;
  rho = rho0;
  T = T0;
  ep = 0.0;
  for i=1:m
    Cp = calcCp(T);
    fac = 0.9/(rho*Cp);
    T = T + sig*epdot*fac*delT; 
  end

%====================================================================
% Compute sigma_e from stress-strain plot
%
function [sigma_e, sigma_i, mu_0, mu] = computeSige(sig_y, epdot, T, T0)

  %
  % Compute mu_0
  %
  rho0 = 2700.0;
  P = calcP(rho0, rho0, 0, 0);
  Tm = calcTm(rho0, rho0);
  mu_0 = calcmu(rho0, rho0, Tm, P, 0);

  %
  % Compute mu
  %
  rho = rho0;
  P = calcP(rho, rho0, T, T0);
  Tm = calcTm(rho, rho0);
  mu = calcmu(rho, rho0, Tm, P, T);

  %
  % Known Constants
  %
  kappa = 1.3806503e-23;
  b = 2.86e-10;
  sig_a = 10.0e6;
  edot_0i = 1.0e9;
  p_i = 0.75;
  q_i = 1.0;
  g_0i = 0.914;
  sigma_i = 444.5e6;

  %
  % Compute S_i
  %
  S_i = (1.0 - (kappa*T/(mu*b^3*g_0i)*log(edot_0i/epdot))^(1/q_i))^(1/p_i);

  %
  % Compute S_e (Assume constants)
  %
  edot_0e = 1.0e9;
  p_e = 0.75;
  q_e = 1.0;
  g_0e = 1.6;
  S_e = (1.0 - (kappa*T/(mu*b^3*g_0e)*log(edot_0e/epdot))^(1/q_e))^(1/p_e);

  %
  % Compute sig_e
  %
  sigma_e = (1.0/S_e)*(mu_0/mu*(sig_y - sig_a) - S_i*sigma_i);
  
  sigma_i = S_i*sigma_i;

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

%====================================================================
%
% Load experimental data from Johnson-Cook (Rc = 30)
%
function plotTangJCRc30Tension

  fig00 = figure;
  fig01 = figure;

  %
  % 0.002/s 298K
  %
  load SigEpsEp0002298KRc30Ten.dat;
  epEx = SigEpsEp0002298KRc30Ten(:,2);
  seqEx = SigEpsEp0002298KRc30Ten(:,3);

  delT = 1.0;
  epdot = 0.002;
  T = 298.0;
  Rc = 30.0;
  seqEx = seqEx*1.0e6;
  [theta, sigma_e, eplas, sig_e, sig_i, mu0, mu, Tvar] = ...
     computeTangentModulusIso(delT, epEx, seqEx, epdot, T, Rc);
  figure(fig00);
  ptangiso = plot(sigma_e/1.0e6, theta/1.0e6, 'ro-'); hold on;
  set(ptangiso, 'LineWidth', 3);
  figure(fig01);
  psigeiso = plot(eplas, sig_e/1.0e6, 'ro-'); hold on;
  set(psigeiso, 'LineWidth', 3);

  fid = fopen('ThetaSigeEp0002298KRc30Ten.dat','w');
  for i=1:length(theta)
    fprintf(fid,'%g %g %g %g %g %g\n', theta(i), sigma_e(i), eplas(i), ...
                                       mu0(i), mu(i), Tvar(i));
  end
  fclose(fid);

  %
  % 570/s 298K
  %
  load SigEpsEp570298KRc30Ten.dat
  epEx = SigEpsEp570298KRc30Ten(:,2);
  seqEx = SigEpsEp570298KRc30Ten(:,3);

  delT = 1.0e-6;
  epdot = 570.0;
  T = 298.0;
  Rc = 30;
  seqEx = seqEx*1.0e6;
  [theta, sigma_e, eplas, sig_e, sig_i, mu0, mu, Tvar] = ...
    computeTangentModulusAdi(delT, epEx, seqEx, epdot, T, Rc);
  figure(fig00);
  ptangiso = plot(sigma_e/1.0e6, theta/1.0e6, 'mo-'); hold on;
  set(ptangiso, 'LineWidth', 3);
  figure(fig01);
  psigeiso = plot(eplas, sig_e/1.0e6, 'mo-'); hold on;
  set(psigeiso, 'LineWidth', 3);
  
  fid = fopen('ThetaSigeEp570298KRc30Ten.dat','w');
  for i=1:length(theta)
    fprintf(fid,'%g %g %g %g %g %g\n', theta(i), sigma_e(i), eplas(i), ...
                                       mu0(i), mu(i), Tvar(i));
  end
  fclose(fid);

  %
  % 604/s 500K
  %
  load SigEpsEp604500KRc30Ten.dat
  epEx = SigEpsEp604500KRc30Ten(:,2);
  seqEx = SigEpsEp604500KRc30Ten(:,3);

  delT = 1.0e-6;
  epdot = 604.0;
  T = 500.0;
  Rc = 30;
  seqEx = seqEx*1.0e6;
  [theta, sigma_e, eplas, sig_e, sig_i, mu0, mu, Tvar] = ...
    computeTangentModulusAdi(delT, epEx, seqEx, epdot, T, Rc);
  figure(fig00);
  ptangiso = plot(sigma_e/1.0e6, theta/1.0e6, 'yo-'); hold on;
  set(ptangiso, 'LineWidth', 3);
  figure(fig01);
  psigeiso = plot(eplas, sig_e/1.0e6, 'yo-'); hold on;
  set(psigeiso, 'LineWidth', 3);
  
  fid = fopen('ThetaSigeEp604500KRc30Ten.dat','w');
  for i=1:length(theta)
    fprintf(fid,'%g %g %g %g %g %g\n', theta(i), sigma_e(i), eplas(i), ...
                                       mu0(i), mu(i), Tvar(i));
  end
  fclose(fid);

  %
  % 650/s 735K
  %
  load SigEpsEp650735KRc30Ten.dat
  epEx = SigEpsEp650735KRc30Ten(:,2);
  seqEx = SigEpsEp650735KRc30Ten(:,3);

  delT = 1.0e-6;
  epdot = 650.0;
  T = 735.0;
  epmax = max(epEx);
  Rc = 30;
  seqEx = seqEx*1.0e6;
  [theta, sigma_e, eplas, sig_e, sig_i, mu0, mu, Tvar] = ...
    computeTangentModulusAdi(delT, epEx, seqEx, epdot, T, Rc);
  figure(fig00);
  ptangiso = plot(sigma_e/1.0e6, theta/1.0e6, 'ko-'); hold on;
  set(ptangiso, 'LineWidth', 3);
  figure(fig01);
  psigeiso = plot(eplas, sig_e/1.0e6, 'ko-'); hold on;
  set(psigeiso, 'LineWidth', 3);
  
  fid = fopen('ThetaSigeEp650735KRc30Ten.dat','w');
  for i=1:length(theta)
    fprintf(fid,'%g %g %g %g %g %g\n', theta(i), sigma_e(i), eplas(i), ...
                                       mu0(i), mu(i), Tvar(i));
  end
  fclose(fid);

  figure(fig00);
  set(gca, 'XLim', [0 1200], 'YLim', [0 30000] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('\sigma_e (MPa)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 30', 'FontName', 'bookman', 'FontSize', 16);
  grid on;
  axis square;

  figure(fig01);
  set(gca, 'XLim', [0 1.0], 'YLim', [0 1200] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('\epsilon_p', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 30', 'FontName', 'bookman', 'FontSize', 16);
  grid on;
  axis square;

%====================================================================
% Compute the tangent modulus and sigma_e (isothermal)
%
function [theta, sigma_e, eplas, sig_e, sig_i, mu0, mu, T] = ...
          computeTangentModulusIso(delT, ep, sig, epdot, T0, Rc)

  [n, m] = size(ep);
  count = 1;
  for i=1:n
    if ~(ep(i) < 0.0)
      sig_m = sig(i);
      [sig_e(count), sig_i(count),mu0(count),mu(count)] = ...
         computeSige(sig_m, epdot, T0, T0, Rc);
      eplas(count) = ep(i);
      T(count) = T0;
      count = count+1;
    end
  end
  %sig_e = sig_e - sig_e(1);
  T0
  n = length(eplas);
  dep = eplas(2) - eplas(1);
  dsig = sig_e(2) - sig_e(1);
  theta(1) = dsig/dep;
  sigma_e(1) = sig_e(1);
  for i=2:n-1
    dep = eplas(i) - eplas(i-1);
    dsig = sig_e(i) - sig_e(i-1);
    theta1 = dsig/dep;
    dep = eplas(i+1) - eplas(i);
    dsig = sig_e(i+1) - sig_e(i);
    theta2 = dsig/dep;
    theta(i) = 0.5*(theta1+theta2);
    sigma_e(i) = sig_e(i);
  end
  dep = eplas(n) - eplas(n-1);
  dsig = sig_e(n) - sig_e(n-1);
  theta(n) = dsig/dep;
  sigma_e(n) = sig_e(n);

%
% Compute the tangent modulus and sigma_e (adiabatic)
%
function [theta, sigma_e, eplas, sig_e, sig_i, mu0, mu, T] = ...
          computeTangentModulusAdi(delT, ep, sig, epdot, T0, Rc)

  [n, m] = size(ep);
  count = 1;
  for i=1:n
    if ~(ep(i) < 0.0)
      sig_m = sig(i);
      ep_m =  ep(i);
      T(count) = computeTemp(delT, sig_m, ep_m, epdot, T0);
      [sig_e(count), sig_i(count),mu0(count),mu(count)] = ...
         computeSige(sig_m, epdot, T(count), T0, Rc);
      eplas(count) = ep(i);
      count = count+1;
    end
  end
  %sig_e = sig_e - sig_e(1);
  T(count-1)
  n = length(eplas);
  dep = eplas(2) - eplas(1);
  dsig = sig_e(2) - sig_e(1);
  theta(1) = dsig/dep;
  sigma_e(1) = sig_e(1);
  for i=2:n-1
    dep = eplas(i) - eplas(i-1);
    dsig = sig_e(i) - sig_e(i-1);
    theta1 = dsig/dep;
    dep = eplas(i+1) - eplas(i);
    dsig = sig_e(i+1) - sig_e(i);
    theta2 = dsig/dep;
    theta(i) = 0.5*(theta1+theta2);
    sigma_e(i) = sig_e(i);
  end
  dep = eplas(n) - eplas(n-1);
  dsig = sig_e(n) - sig_e(n-1);
  theta(n) = dsig/dep;
  sigma_e(n) = sig_e(n);

