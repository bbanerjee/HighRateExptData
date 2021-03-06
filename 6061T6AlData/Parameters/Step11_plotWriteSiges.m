function plotWriteSiges

  marker = ['o';'p';'v';'s';'d';'^';'h';'<';'x';'>';'+';'*'];
  color = [[0.90 0.10 0.10];[0.10 0.90 0.10];[0.10 0.10 0.90];...
           [0.75 0.25 1.00];[1.00 0.75 0.25];[0.15 0.30 0.70];...
           [0.10 0.80 0.30];[0.25 0.75 1.00];[0.66 0.60 0.00];...
           [0.60 0.20 0.00];[0.60 0.72 0.00];[0.30 0.55 0.60]];

  fid = fopen('AlDataSiges.dat', 'w');
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
  epes = [0.115 0.07 0.072 0.065 0.06 0.09 0.06 0.05];
  Tes  = [109 209.5 297 310 379 480 538 645];

  load ./SigeEpData/SigeEp000057s77KOga.dat
  dat = SigeEp000057s77KOga;
  load ./SigeEpData/TangSige000057s77KOga.dat;
  tang = TangSige000057s77KOga;
  p1 = plotTangSigeSiges(dat, tang, color(1,:), marker(1,:), fid, ...
       epes(1), Tes(1), siges(1));

  load ./SigeEpData/SigeEp000057s201KOga.dat
  dat = SigeEp000057s201KOga;
  load ./SigeEpData/TangSige000057s201KOga.dat;
  tang = TangSige000057s201KOga;
  p2 = plotTangSigeSiges(dat, tang, color(2,:), marker(2,:), fid, ...
       epes(2), Tes(2), siges(2));

  load ./SigeEpData/SigeEp000057s289KOga.dat
  dat = SigeEp000057s289KOga;
  load ./SigeEpData/TangSige000057s289KOga.dat;
  tang = TangSige000057s289KOga;
  p3 = plotTangSigeSiges(dat, tang, color(3,:), marker(3,:), fid, ...
       epes(3), Tes(3), siges(3));

  load ./SigeEpData/SigeEp0000048s297KHog.dat
  dat = SigeEp0000048s297KHog;
  load ./SigeEpData/TangSige0000048s297KHog.dat;
  tang = TangSige0000048s297KHog;
  p4 = plotTangSigeSiges(dat, tang, color(4,:), marker(4,:), fid, ...
       epes(4), Tes(4), siges(4));

  load ./SigeEpData/SigeEp000057s373KOga.dat
  dat = SigeEp000057s373KOga;
  load ./SigeEpData/TangSige000057s373KOga.dat;
  tang = TangSige000057s373KOga;
  p5 = plotTangSigeSiges(dat, tang, color(5,:), marker(5,:), fid, ...
       epes(5), Tes(5), siges(5));

  load ./SigeEpData/SigeEp000057s473KOga.dat
  dat = SigeEp000057s473KOga;
  load ./SigeEpData/TangSige000057s473KOga.dat;
  tang = TangSige000057s473KOga;
  p6 = plotTangSigeSiges(dat, tang, color(6,:), marker(6,:), fid, ...
       epes(6), Tes(6), siges(6));

  load ./SigeEpData/SigeEp0000010s533KHog.dat
  dat = SigeEp0000010s533KHog;
  load ./SigeEpData/TangSige0000010s533KHog.dat;
  tang = TangSige0000010s533KHog;
  p7 = plotTangSigeSiges(dat, tang, color(7,:), marker(7,:), fid, ...
       epes(7), Tes(7), siges(7));

  load ./SigeEpData/SigeEp0000010s644KHog.dat
  dat = SigeEp0000010s644KHog;
  load ./SigeEpData/TangSige0000010s644KHog.dat;
  tang = TangSige0000010s644KHog;
  p8 = plotTangSigeSiges(dat, tang, color(8,:), marker(8,:), fid, ...
       epes(8), Tes(8), siges(8));

  subplot(2,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3], 'YLim', [0 250]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(2,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
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

  subplot(2,2,3);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('T (K) ', 'FontName', 'bookman', 'FontSize', 16);
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 1.0e-3/s
%
function plot0001Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [0 120 170 116 117 113 0 78 99 0 0 8];
  epes = [0.07 0.265 0.15 0.065 0.065 0.08 0.07 0.07 0.085 0.072 0.075 0.017];
  Tes  = [304 330 323 308 374.5 430 431 429.5 485 485.5 565 590];

  load ./SigeEpData/SigeEp0001s294KEle.dat
  dat = SigeEp0001s294KEle;
  load ./SigeEpData/TangSige0001s294KEle.dat;
  tang = TangSige0001s294KEle;
  p1 = plotTangSigeSiges(dat, tang, color(1,:), marker(1,:), fid, ...
       epes(1), Tes(1), siges(1));

  load ./SigeEpData/SigeEp0001s295KFis.dat
  dat = SigeEp0001s295KFis;
  load ./SigeEpData/TangSige0001s295KFis.dat;
  tang = TangSige0001s295KFis;
  p2 = plotTangSigeSiges(dat, tang, color(1,:), marker(2,:), fid, ...
       epes(2), Tes(2), siges(2));

  load ./SigeEpData/SigeEp0001s298KCad.dat
  dat = SigeEp0001s298KCad;
  load ./SigeEpData/TangSige0001s298KCad.dat;
  tang = TangSige0001s298KCad;
  p3 = plotTangSigeSiges(dat, tang, color(1,:), marker(3,:), fid, ...
       epes(3), Tes(3), siges(3));

  load ./SigeEpData/SigeEp0001s300K01MPaDav.dat
  dat = SigeEp0001s300K01MPaDav;
  load ./SigeEpData/TangSige0001s300K01MPaDav.dat;
  tang = TangSige0001s300K01MPaDav;
  p4 = plotTangSigeSiges(dat, tang, color(1,:), marker(4,:), fid, ...
       epes(4), Tes(4), siges(4));

  load ./SigeEpData/SigeEp0001s367K01MPaDav.dat
  dat = SigeEp0001s367K01MPaDav;
  load ./SigeEpData/TangSige0001s367K01MPaDav.dat;
  tang = TangSige0001s367K01MPaDav;
  p5 = plotTangSigeSiges(dat, tang, color(5,:), marker(5,:), fid, ...
       epes(5), Tes(5), siges(5));

  load ./SigeEpData/SigeEp0001s422K01MPaDav.dat
  dat = SigeEp0001s422K01MPaDav;
  load ./SigeEpData/TangSige0001s422K01MPaDav.dat;
  tang = TangSige0001s422K01MPaDav;
  p6 = plotTangSigeSiges(dat, tang, color(6,:), marker(6,:), fid, ...
       epes(6), Tes(6), siges(6));

  load ./SigeEpData/SigeEp0001s422KEle.dat
  dat = SigeEp0001s422KEle;
  load ./SigeEpData/TangSige0001s422KEle.dat;
  tang = TangSige0001s422KEle;
  p7 = plotTangSigeSiges(dat, tang, color(6,:), marker(7,:), fid, ...
       epes(7), Tes(7), siges(7));

  load ./SigeEpData/SigeEp0001s422KGre.dat
  dat = SigeEp0001s422KGre;
  load ./SigeEpData/TangSige0001s422KGre.dat;
  tang = TangSige0001s422KGre;
  p8 = plotTangSigeSiges(dat, tang, color(6,:), marker(8,:), fid, ...
       epes(8), Tes(8), siges(8));

  load ./SigeEpData/SigeEp0001s478K01MPaDav.dat
  dat = SigeEp0001s478K01MPaDav;
  load ./SigeEpData/TangSige0001s478K01MPaDav.dat;
  tang = TangSige0001s478K01MPaDav;
  p9 = plotTangSigeSiges(dat, tang, color(9,:), marker(9,:), fid, ...
       epes(9), Tes(9), siges(9));

  load ./SigeEpData/SigeEp0001s478KEle.dat
  dat = SigeEp0001s478KEle;
  load ./SigeEpData/TangSige0001s478KEle.dat;
  tang = TangSige0001s478KEle;
  p10 = plotTangSigeSiges(dat, tang, color(9,:), marker(10,:), fid, ...
       epes(10), Tes(10), siges(10));

  load ./SigeEpData/SigeEp0001s561KEle.dat
  dat = SigeEp0001s561KEle;
  load ./SigeEpData/TangSige0001s561KEle.dat;
  tang = TangSige0001s561KEle;
  p11 = plotTangSigeSiges(dat, tang, color(11,:), marker(11,:), fid, ...
       epes(11), Tes(11), siges(11));

  load ./SigeEpData/SigeEp0001s589KGre.dat
  dat = SigeEp0001s589KGre;
  load ./SigeEpData/TangSige0001s589KGre.dat;
  tang = TangSige0001s589KGre;
  p12 = plotTangSigeSiges(dat, tang, color(12,:), marker(12,:), fid, ...
       epes(12), Tes(12), siges(12));

  subplot(2,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3], 'YLim', [0 350]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(2,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 350], 'YLim', [0 6000]);
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
  
  subplot(2,2,3);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('T (K) ', 'FontName', 'bookman', 'FontSize', 16);
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 2.0e-3/s
%
function plot0002Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [115 33 17 37 0 24 0 28 0 53 30];
  epes = [0.11 0.014 0.004 0.007 0.071 0.005 0.08 0.008 0.08 0.006 0.003];
  Tes  = [310 300 375 423 431 478 485 536 565 590 645];

  load ./SigeEpData/SigeEp0002s295KGre.dat
  dat = SigeEp0002s295KGre;
  load ./SigeEpData/TangSige0002s295KGre.dat;
  tang = TangSige0002s295KGre;
  p1 = plotTangSigeSiges(dat, tang, color(1,:), marker(1,:), fid, ...
       epes(1), Tes(1), siges(1));

  load ./SigeEpData/SigeEp0002s298KASM.dat
  dat = SigeEp0002s298KASM;
  load ./SigeEpData/TangSige0002s298KASM.dat;
  tang = TangSige0002s298KASM;
  p2 = plotTangSigeSiges(dat, tang, color(1,:), marker(2,:), fid, ...
       epes(2), Tes(2), siges(2));

  load ./SigeEpData/SigeEp0002s373KASM.dat
  dat = SigeEp0002s373KASM;
  load ./SigeEpData/TangSige0002s373KASM.dat;
  tang = TangSige0002s373KASM;
  p3 = plotTangSigeSiges(dat, tang, color(2,:), marker(3,:), fid, ...
       epes(3), Tes(3), siges(3));

  load ./SigeEpData/SigeEp0002s422KASM.dat
  dat = SigeEp0002s422KASM;
  load ./SigeEpData/TangSige0002s422KASM.dat;
  tang = TangSige0002s422KASM;
  p4 = plotTangSigeSiges(dat, tang, color(3,:), marker(4,:), fid, ...
       epes(4), Tes(4), siges(4));

  load ./SigeEpData/SigeEp0002s422KEle.dat
  dat = SigeEp0002s422KEle;
  load ./SigeEpData/TangSige0002s422KEle.dat;
  tang = TangSige0002s422KEle;
  p5 = plotTangSigeSiges(dat, tang, color(3,:), marker(5,:), fid, ...
       epes(5), Tes(5), siges(5));

  load ./SigeEpData/SigeEp0002s477KASM.dat
  dat = SigeEp0002s477KASM;
  load ./SigeEpData/TangSige0002s477KASM.dat;
  tang = TangSige0002s477KASM;
  p6 = plotTangSigeSiges(dat, tang, color(4,:), marker(6,:), fid, ...
       epes(6), Tes(6), siges(6));

  load ./SigeEpData/SigeEp0002s478KEle.dat
  dat = SigeEp0002s478KEle;
  load ./SigeEpData/TangSige0002s478KEle.dat;
  tang = TangSige0002s478KEle;
  p7 = plotTangSigeSiges(dat, tang, color(4,:), marker(7,:), fid, ...
       epes(7), Tes(7), siges(7));

  load ./SigeEpData/SigeEp0002s535KASM.dat
  dat = SigeEp0002s535KASM;
  load ./SigeEpData/TangSige0002s535KASM.dat;
  tang = TangSige0002s535KASM;
  p8 = plotTangSigeSiges(dat, tang, color(5,:), marker(8,:), fid, ...
       epes(8), Tes(8), siges(8));

  load ./SigeEpData/SigeEp0002s561KEle.dat
  dat = SigeEp0002s561KEle;
  load ./SigeEpData/TangSige0002s561KEle.dat;
  tang = TangSige0002s561KEle;
  p9 = plotTangSigeSiges(dat, tang, color(6,:), marker(9,:), fid, ...
       epes(9), Tes(9), siges(9));

  load ./SigeEpData/SigeEp0002s589KASM.dat
  dat = SigeEp0002s589KASM;
  load ./SigeEpData/TangSige0002s589KASM.dat;
  tang = TangSige0002s589KASM;
  p10 = plotTangSigeSiges(dat, tang, color(7,:), marker(10,:), fid, ...
       epes(10), Tes(10), siges(10));

  load ./SigeEpData/SigeEp0002s644KASM.dat
  dat = SigeEp0002s644KASM;
  load ./SigeEpData/TangSige0002s644KASM.dat;
  tang = TangSige0002s644KASM;
  p11 = plotTangSigeSiges(dat, tang, color(8,:), marker(11,:), fid, ...
       epes(11), Tes(11), siges(11));

  subplot(2,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.15], 'YLim', [0 350]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(2,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 350], 'YLim', [0 6000]);
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
  grid on;
  
  subplot(2,2,3);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.15], 'YLim', [0 700]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('T (K) ', 'FontName', 'bookman', 'FontSize', 16);
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 0.02 - 0.10 /s
%
function plot01Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [0 0 0 0 0 0 0];
  epes = [0.07 0.071 0.072 0.074 0.074 0.074 0.074];
  Tes  = [431 431 486 565.2 565.5 565.7 565.9];

  load ./SigeEpData/SigeEp002s422KEle.dat
  dat = SigeEp002s422KEle;
  load ./SigeEpData/TangSige002s422KEle.dat;
  tang = TangSige002s422KEle;
  p1 = plotTangSigeSiges(dat, tang, color(1,:), marker(1,:), fid, ...
       epes(1), Tes(1), siges(1));

  load ./SigeEpData/SigeEp0085s422KEle.dat
  dat = SigeEp0085s422KEle;
  load ./SigeEpData/TangSige0085s422KEle.dat;
  tang = TangSige0085s422KEle;
  p2 = plotTangSigeSiges(dat, tang, color(1,:), marker(2,:), fid, ...
       epes(2), Tes(2), siges(2));

  load ./SigeEpData/SigeEp005s478KEle.dat
  dat = SigeEp005s478KEle;
  load ./SigeEpData/TangSige005s478KEle.dat;
  tang = TangSige005s478KEle;
  p3 = plotTangSigeSiges(dat, tang, color(2,:), marker(3,:), fid, ...
       epes(3), Tes(3), siges(3));

  load ./SigeEpData/SigeEp002s561KEle.dat
  dat = SigeEp002s561KEle;
  load ./SigeEpData/TangSige002s561KEle.dat;
  tang = TangSige002s561KEle;
  p4 = plotTangSigeSiges(dat, tang, color(3,:), marker(4,:), fid, ...
       epes(4), Tes(4), siges(4));

  load ./SigeEpData/SigeEp006s561KEle.dat
  dat = SigeEp006s561KEle;
  load ./SigeEpData/TangSige006s561KEle.dat;
  tang = TangSige006s561KEle;
  p5 = plotTangSigeSiges(dat, tang, color(3,:), marker(5,:), fid, ...
       epes(5), Tes(5), siges(5));

  load ./SigeEpData/SigeEp0085s561KEle.dat
  dat = SigeEp0085s561KEle;
  load ./SigeEpData/TangSige0085s561KEle.dat;
  tang = TangSige0085s561KEle;
  p6 = plotTangSigeSiges(dat, tang, color(3,:), marker(6,:), fid, ...
       epes(6), Tes(6), siges(6));

  load ./SigeEpData/SigeEp015s561KEle.dat
  dat = SigeEp015s561KEle;
  load ./SigeEpData/TangSige015s561KEle.dat;
  tang = TangSige015s561KEle;
  p7 = plotTangSigeSiges(dat, tang, color(3,:), marker(7,:), fid, ...
       epes(7), Tes(7), siges(7));

  subplot(2,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1], 'YLim', [0 350]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(2,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 350], 'YLim',[0 6000]);
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
  grid on;
  
  subplot(2,2,3);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1], 'YLim', [0 700]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('T (K) ', 'FontName', 'bookman', 'FontSize', 16);
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 1.0/s
%
function plot1Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [0 0 0 0];
  epes = [0.071 0.071 0.073 0.073];
  Tes  = [432 486 566 566];

  load ./SigeEpData/SigeEp11s422KEle.dat
  dat = SigeEp11s422KEle;
  load ./SigeEpData/TangSige11s422KEle.dat;
  tang = TangSige11s422KEle;
  p1 = plotTangSigeSiges(dat, tang, color(1,:), marker(1,:), fid, ...
       epes(1), Tes(1), siges(1));

  load ./SigeEpData/SigeEp075s478KEle.dat
  dat = SigeEp075s478KEle;
  load ./SigeEpData/TangSige075s478KEle.dat;
  tang = TangSige075s478KEle;
  p2 = plotTangSigeSiges(dat, tang, color(2,:), marker(2,:), fid, ...
       epes(2), Tes(2), siges(2));

  load ./SigeEpData/SigeEp070s561KEle.dat
  dat = SigeEp070s561KEle;
  load ./SigeEpData/TangSige070s561KEle.dat;
  tang = TangSige070s561KEle;
  p3 = plotTangSigeSiges(dat, tang, color(3,:), marker(3,:), fid, ...
       epes(3), Tes(3), siges(3));

  load ./SigeEpData/SigeEp12s561KEle.dat
  dat = SigeEp12s561KEle;
  load ./SigeEpData/TangSige12s561KEle.dat;
  tang = TangSige12s561KEle;
  p4 = plotTangSigeSiges(dat, tang, color(3,:), marker(4,:), fid, ...
       epes(4), Tes(4), siges(4));

  subplot(2,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1], 'YLim', [0 350]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(2,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 350], 'YLim', [0 6000]);
  xlabel('\sigma_e (MPa)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p2 p3 p4], ...
         '422 K 1.10/s (Green)', ...
         '478 K 0.75/s (Green)', ...
         '561 K 0.70/s (Green)', ...
         '561 K 1.20/s (Green)');
  %axis square;
  grid on;
  
  subplot(2,2,3);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1], 'YLim', [0 700]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('T (K) ', 'FontName', 'bookman', 'FontSize', 16);
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 10.0/s
%
function plot10Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [0 66 0 31];
  epes = [0.07 0.072 0.07 0.02];
  Tes  = [431.5 430 486.5 590];

  load ./SigeEpData/SigeEp85s422KEle.dat
  dat = SigeEp85s422KEle;
  load ./SigeEpData/TangSige85s422KEle.dat;
  tang = TangSige85s422KEle;
  p1 = plotTangSigeSiges(dat, tang, color(1,:), marker(1,:), fid, ...
       epes(1), Tes(1), siges(1));

  load ./SigeEpData/SigeEp9s422KGre.dat
  dat = SigeEp9s422KGre;
  load ./SigeEpData/TangSige9s422KGre.dat;
  tang = TangSige9s422KGre;
  p2 = plotTangSigeSiges(dat, tang, color(1,:), marker(2,:), fid, ...
       epes(2), Tes(2), siges(2));

  load ./SigeEpData/SigeEp5s478KEle.dat
  dat = SigeEp5s478KEle;
  load ./SigeEpData/TangSige5s478KEle.dat;
  tang = TangSige5s478KEle;
  p3 = plotTangSigeSiges(dat, tang, color(2,:), marker(3,:), fid, ...
       epes(3), Tes(3), siges(3));

  load ./SigeEpData/SigeEp10s589KGre.dat
  dat = SigeEp10s589KGre;
  load ./SigeEpData/TangSige10s589KGre.dat;
  tang = TangSige10s589KGre;
  p4 = plotTangSigeSiges(dat, tang, color(3,:), marker(4,:), fid, ...
       epes(4), Tes(4), siges(4));

  subplot(2,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.15], 'YLim', [0 350]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(2,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 350], 'YLim', [0 6000]);
  xlabel('\sigma_e (MPa)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p2 p3 p4], ...
         '422 K 8.5/s (Green)', ...
         '422 K 9.0/s (Green)', ...
         '478 K 5.0/s (Green)', ...
         '589 K 10.0/s (Green)');
  %axis square;
  grid on;
  
  subplot(2,2,3);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.15], 'YLim', [0 700]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('T (K) ', 'FontName', 'bookman', 'FontSize', 16);
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 25.0/s
%
function plot25Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [120 92 0 0 125 100];
  epes = [0.14 0.055 0.071 0.071 0.07 0.07];
  Tes  = [308 302 431.5 487 536 650];

  load ./SigeEpData/SigeEp18s295KGre.dat
  dat = SigeEp18s295KGre;
  load ./SigeEpData/TangSige18s295KGre.dat;
  tang = TangSige18s295KGre;
  p1 = plotTangSigeSiges(dat, tang, color(1,:), marker(1,:), fid, ...
       epes(1), Tes(1), siges(1));

  load ./SigeEpData/SigeEp28s297KHog.dat
  dat = SigeEp28s297KHog;
  load ./SigeEpData/TangSige28s297KHog.dat;
  tang = TangSige28s297KHog;
  p2 = plotTangSigeSiges(dat, tang, color(1,:), marker(2,:), fid, ...
       epes(2), Tes(2), siges(2));

  load ./SigeEpData/SigeEp30s422KEle.dat
  dat = SigeEp30s422KEle;
  load ./SigeEpData/TangSige30s422KEle.dat;
  tang = TangSige30s422KEle;
  p3 = plotTangSigeSiges(dat, tang, color(2,:), marker(3,:), fid, ...
       epes(3), Tes(3), siges(3));

  load ./SigeEpData/SigeEp30s478KEle.dat
  dat = SigeEp30s478KEle;
  load ./SigeEpData/TangSige30s478KEle.dat;
  tang = TangSige30s478KEle;
  p4 = plotTangSigeSiges(dat, tang, color(3,:), marker(4,:), fid, ...
       epes(4), Tes(4), siges(4));

  load ./SigeEpData/SigeEp18s533KHog.dat
  dat = SigeEp18s533KHog;
  load ./SigeEpData/TangSige18s533KHog.dat;
  tang = TangSige18s533KHog;
  p5 = plotTangSigeSiges(dat, tang, color(4,:), marker(5,:), fid, ...
       epes(5), Tes(5), siges(5));

  load ./SigeEpData/SigeEp23s644KHog.dat
  dat = SigeEp23s644KHog;
  load ./SigeEpData/TangSige23s644KHog.dat;
  tang = TangSige23s644KHog;
  p6 = plotTangSigeSiges(dat, tang, color(5,:), marker(6,:), fid, ...
       epes(6), Tes(6), siges(6));

  subplot(2,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.2], 'YLim', [0 400]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(2,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 400], 'YLim', [0 6000]);
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
  
  subplot(2,2,3);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.2], 'YLim', [0 700]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('T (K) ', 'FontName', 'bookman', 'FontSize', 16);
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 55.0/s
%
function plot55Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [75 0 85];
  epes = [0.07 0.073 0.07];
  Tes  = [302 566.5 649];

  load ./SigeEpData/SigeEp65s297KHog.dat
  dat = SigeEp65s297KHog;
  load ./SigeEpData/TangSige65s297KHog.dat;
  tang = TangSige65s297KHog;
  p1 = plotTangSigeSiges(dat, tang, color(1,:), marker(1,:), fid, ...
       epes(1), Tes(1), siges(1));

  load ./SigeEpData/SigeEp50s561KEle.dat
  dat = SigeEp50s561KEle;
  load ./SigeEpData/TangSige50s561KEle.dat;
  tang = TangSige50s561KEle;
  p2 = plotTangSigeSiges(dat, tang, color(2,:), marker(2,:), fid, ...
       epes(2), Tes(2), siges(2));

  load ./SigeEpData/SigeEp54s644KHog.dat
  dat = SigeEp54s644KHog;
  load ./SigeEpData/TangSige54s644KHog.dat;
  tang = TangSige54s644KHog;
  p3 = plotTangSigeSiges(dat, tang, color(3,:), marker(3,:), fid, ...
       epes(3), Tes(3), siges(3));

  subplot(2,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1], 'YLim', [0 300]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(2,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 400], 'YLim', [0 6000]);
  xlabel('\sigma_e (MPa)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p2 p3], ...
         '297 K 65/s (Hoge)', ...
         '561 K 50/s (Green)', ...
         '644 K 54/s (Hoge)');
  %axis square;
  grid on;
  
  subplot(2,2,3);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1], 'YLim', [0 700]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('T (K) ', 'FontName', 'bookman', 'FontSize', 16);
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 350.0/s
%
function plot350Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [205 245 115];
  epes = [0.165 0.21 0.06];
  Tes  = [322.5 337 540];

  load ./SigeEpData/SigeEp380s298KYad.dat
  dat = SigeEp380s298KYad;
  load ./SigeEpData/TangSige380s298KYad.dat;
  tang = TangSige380s298KYad;
  p1 = plotTangSigeSiges(dat, tang, color(1,:), marker(1,:), fid, ...
       epes(1), Tes(1), siges(1));

  load ./SigeEpData/SigeEp500s298KYad.dat
  dat = SigeEp500s298KYad;
  load ./SigeEpData/TangSige500s298KYad.dat;
  tang = TangSige500s298KYad;
  p2 = plotTangSigeSiges(dat, tang, color(1,:), marker(2,:), fid, ...
       epes(2), Tes(2), siges(2));

  load ./SigeEpData/SigeEp130s533KHog.dat
  dat = SigeEp130s533KHog;
  load ./SigeEpData/TangSige130s533KHog.dat;
  tang = TangSige130s533KHog;
  p3 = plotTangSigeSiges(dat, tang, color(2,:), marker(3,:), fid, ...
       epes(3), Tes(3), siges(3));

  subplot(2,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3], 'YLim', [0 350]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(2,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 400], 'YLim', [0 6000]);
  xlabel('\sigma_e (MPa)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p2 p3], ...
         '298 K 380/s (Yadav)', ...
         '298 K 500/s (Yadav)', ...
         '533 K 130/s (Hoge)');
  %axis square;
  grid on;
  
  subplot(2,2,3);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('T (K) ', 'FontName', 'bookman', 'FontSize', 16);
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 1000.0/s
%
function plot1000Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [0 125 130 0 134 0 0 0 0 131];
  epes = [0.07 0.33 0.065 0.07 0.055 0.07 0.07 0.07 0.07 0.085];
  Tes  = [305 350 307 431.8 468.5 487 487 566.5 566.5 621.5];

  load ./SigeEpData/SigeEp1000s294KEle.dat
  dat = SigeEp1000s294KEle;
  load ./SigeEpData/TangSige1000s294KEle.dat;
  tang = TangSige1000s294KEle;
  p1 = plotTangSigeSiges(dat, tang, color(1,:), marker(1,:), fid, ...
       epes(1), Tes(1), siges(1));

  load ./SigeEpData/SigeEp1000s298KLee.dat
  dat = SigeEp1000s298KLee;
  load ./SigeEpData/TangSige1000s298KLee.dat;
  tang = TangSige1000s298KLee;
  p2 = plotTangSigeSiges(dat, tang, color(1,:), marker(2,:), fid, ...
       epes(2), Tes(2), siges(2));

  load ./SigeEpData/SigeEp1000s298KRos.dat
  dat = SigeEp1000s298KRos;
  load ./SigeEpData/TangSige1000s298KRos.dat;
  tang = TangSige1000s298KRos;
  p3 = plotTangSigeSiges(dat, tang, color(1,:), marker(3,:), fid, ...
       epes(3), Tes(3), siges(3));

  load ./SigeEpData/SigeEp1000s422KEle.dat
  dat = SigeEp1000s422KEle;
  load ./SigeEpData/TangSige1000s422KEle.dat;
  tang = TangSige1000s422KEle;
  p4 = plotTangSigeSiges(dat, tang, color(2,:), marker(4,:), fid, ...
       epes(4), Tes(4), siges(4));

  load ./SigeEpData/SigeEp1000s463KRos.dat
  dat = SigeEp1000s463KRos;
  load ./SigeEpData/TangSige1000s463KRos.dat;
  tang = TangSige1000s463KRos;
  p5 = plotTangSigeSiges(dat, tang, color(3,:), marker(5,:), fid, ...
       epes(5), Tes(5), siges(5));

  load ./SigeEpData/SigeEp900s478KEle.dat
  dat = SigeEp900s478KEle;
  load ./SigeEpData/TangSige900s478KEle.dat;
  tang = TangSige900s478KEle;
  p6 = plotTangSigeSiges(dat, tang, color(4,:), marker(6,:), fid, ...
       epes(6), Tes(6), siges(6));

  load ./SigeEpData/SigeEp1000s478KEle.dat
  dat = SigeEp1000s478KEle;
  load ./SigeEpData/TangSige1000s478KEle.dat;
  tang = TangSige1000s478KEle;
  p7 = plotTangSigeSiges(dat, tang, color(4,:), marker(7,:), fid, ...
       epes(7), Tes(7), siges(7));

  load ./SigeEpData/SigeEp1000s561KEle.dat
  dat = SigeEp1000s561KEle;
  load ./SigeEpData/TangSige1000s561KEle.dat;
  tang = TangSige1000s561KEle;
  p8 = plotTangSigeSiges(dat, tang, color(5,:), marker(8,:), fid, ...
       epes(8), Tes(8), siges(8));

  load ./SigeEpData/SigeEp1150s561KEle.dat
  dat = SigeEp1150s561KEle;
  load ./SigeEpData/TangSige1150s561KEle.dat;
  tang = TangSige1150s561KEle;
  p9 = plotTangSigeSiges(dat, tang, color(5,:), marker(9,:), fid, ...
       epes(9), Tes(9), siges(9));

  load ./SigeEpData/SigeEp1000s618KRos.dat
  dat = SigeEp1000s618KRos;
  load ./SigeEpData/TangSige1000s618KRos.dat;
  tang = TangSige1000s618KRos;
  p10 = plotTangSigeSiges(dat, tang, color(6,:), marker(10,:), fid, ...
       epes(10), Tes(10), siges(10));

  subplot(2,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.4], 'YLim', [0 350]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(2,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 400], 'YLim', [0 6000]);
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
  
  subplot(2,2,3);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.4], 'YLim', [0 700]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('T (K) ', 'FontName', 'bookman', 'FontSize', 16);
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 2000.0/s
%
function plot2000Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [195 131 87.5 175 112 180 97 80];
  epes = [0.1 0.1 0.062 0.25 0.25 0.135 0.075 0.085];
  Tes  = [111 216 296 335 335 320 381 480.5];

  load ./SigeEpData/SigeEp1500s77KOga.dat
  dat = SigeEp1500s77KOga;
  load ./SigeEpData/TangSige1500s77KOga.dat;
  tang = TangSige1500s77KOga;
  p1 = plotTangSigeSiges(dat, tang, color(1,:), marker(1,:), fid, ...
       epes(1), Tes(1), siges(1));

  load ./SigeEpData/SigeEp1500s201KOga.dat
  dat = SigeEp1500s201KOga;
  load ./SigeEpData/TangSige1500s201KOga.dat;
  tang = TangSige1500s201KOga;
  p2 = plotTangSigeSiges(dat, tang, color(2,:), marker(2,:), fid, ...
       epes(2), Tes(2), siges(2));

  load ./SigeEpData/SigeEp1500s289KOga.dat
  dat = SigeEp1500s289KOga;
  load ./SigeEpData/TangSige1500s289KOga.dat;
  tang = TangSige1500s289KOga;
  p3 = plotTangSigeSiges(dat, tang, color(3,:), marker(3,:), fid, ...
       epes(3), Tes(3), siges(3));

  load ./SigeEpData/SigeEp2500s295KFis.dat
  dat = SigeEp2500s295KFis;
  load ./SigeEpData/TangSige2500s295KFis.dat;
  tang = TangSige2500s295KFis;
  p4 = plotTangSigeSiges(dat, tang, color(4,:), marker(4,:), fid, ...
       epes(4), Tes(4), siges(4));

  load ./SigeEpData/SigeEp2000s298KLee.dat
  dat = SigeEp2000s298KLee;
  load ./SigeEpData/TangSige2000s298KLee.dat;
  tang = TangSige2000s298KLee;
  p5 = plotTangSigeSiges(dat, tang, color(4,:), marker(5,:), fid, ...
       epes(5), Tes(5), siges(5));

  load ./SigeEpData/SigeEp2000s298KYad.dat
  dat = SigeEp2000s298KYad;
  load ./SigeEpData/TangSige2000s298KYad.dat;
  tang = TangSige2000s298KYad;
  p6 = plotTangSigeSiges(dat, tang, color(4,:), marker(6,:), fid, ...
       epes(6), Tes(6), siges(6));

  load ./SigeEpData/SigeEp1500s373KOga.dat
  dat = SigeEp1500s373KOga;
  load ./SigeEpData/TangSige1500s373KOga.dat;
  tang = TangSige1500s373KOga;
  p7 = plotTangSigeSiges(dat, tang, color(5,:), marker(7,:), fid, ...
       epes(7), Tes(7), siges(7));

  load ./SigeEpData/SigeEp1500s473KOga.dat
  dat = SigeEp1500s473KOga;
  load ./SigeEpData/TangSige1500s473KOga.dat;
  tang = TangSige1500s473KOga;
  p8 = plotTangSigeSiges(dat, tang, color(6,:), marker(8,:), fid, ...
       epes(8), Tes(8), siges(8));

  subplot(2,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3], 'YLim', [0 300]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  grid on;

  subplot(2,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 300], 'YLim', [0 6000]);
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
  
  subplot(2,2,3);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('T (K) ', 'FontName', 'bookman', 'FontSize', 16);
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 4000.0/s
%
function plot4000Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  siges = [120 170 99 110 127 166 97];
  epes = [0.31 0.15 0.12 0.31 0.50 0.26 0.40];
  Tes  = [350 321.5 316 346.5 375 344 358];

  load ./SigeEpData/SigeEp3000s298KLee.dat
  dat = SigeEp3000s298KLee;
  load ./SigeEpData/TangSige3000s298KLee.dat;
  tang = TangSige3000s298KLee;
  p1 = plotTangSigeSiges(dat, tang, color(1,:), marker(1,:), fid, ...
       epes(1), Tes(1), siges(1));

  load ./SigeEpData/SigeEp3600s298KYad.dat
  dat = SigeEp3600s298KYad;
  load ./SigeEpData/TangSige3600s298KYad.dat;
  tang = TangSige3600s298KYad;
  p2 = plotTangSigeSiges(dat, tang, color(2,:), marker(2,:), fid, ...
       epes(2), Tes(2), siges(2));

  load ./SigeEpData/SigeEp4000s298KCad.dat
  dat = SigeEp4000s298KCad;
  load ./SigeEpData/TangSige4000s298KCad.dat;
  tang = TangSige4000s298KCad;
  p3 = plotTangSigeSiges(dat, tang, color(3,:), marker(3,:), fid, ...
       epes(3), Tes(3), siges(3));

  load ./SigeEpData/SigeEp4000s298KLee.dat
  dat = SigeEp4000s298KLee;
  load ./SigeEpData/TangSige4000s298KLee.dat;
  tang = TangSige4000s298KLee;
  p4 = plotTangSigeSiges(dat, tang, color(3,:), marker(4,:), fid, ...
       epes(4), Tes(4), siges(4));

  load ./SigeEpData/SigeEp4000s298KLes.dat
  dat = SigeEp4000s298KLes;
  load ./SigeEpData/TangSige4000s298KLes.dat;
  tang = TangSige4000s298KLes;
  p5 = plotTangSigeSiges(dat, tang, color(3,:), marker(5,:), fid, ...
       epes(5), Tes(5), siges(5));

  load ./SigeEpData/SigeEp8000s298KLes.dat
  dat = SigeEp8000s298KLes;
  load ./SigeEpData/TangSige8000s298KLes.dat;
  tang = TangSige8000s298KLes;
  p6 = plotTangSigeSiges(dat, tang, color(4,:), marker(6,:), fid, ...
       epes(6), Tes(6), siges(6));

  load ./SigeEpData/SigeEp29000s298KRam.dat
  dat = SigeEp29000s298KRam;
  load ./SigeEpData/TangSige29000s298KRam.dat;
  tang = TangSige29000s298KRam;
  p7 = plotTangSigeSiges(dat, tang, color(5,:), marker(7,:), fid, ...
       epes(7), Tes(7), siges(7));

  subplot(2,2,1);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.5], 'YLim', [0 300]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  grid on;

  subplot(2,2,2);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 300], 'YLim', [0 6000]);
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
  grid on;
  
  subplot(2,2,3);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.5], 'YLim', [0 700]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('T (K) ', 'FontName', 'bookman', 'FontSize', 16);
  grid on;

%=======================================================================
% Plot stress-strain curves 
% and write intersection point 
%
function [p] = plotTangSigeSiges(dat, tang, color, marker, fid, ...
               ep_es, T_es, sig_es)

  %
  % Load sige_ep data
  %
  ep = dat(:,1);
  sige = dat(:,2);
  Tall = dat(:,3);
  edot = dat(1,4);
  T0 = dat(1,5);
  P = dat(1,6);

  %
  % Load tang_sige data
  %
  sigma_e = tang(:,1);
  theta = tang(:,2);
  T = tang(:,3);

  %
  % If we can't figure out sigma_es just take the last point
  % on the sigma_e vs ep curve
  %
  if (sig_es == 0)
    sig_es = sige(length(sige));
  end

  %
  % Plot data
  %
  subplot(2,2,1);
  p = plot(ep, sige, 'p-', 'LineWidth', 2); hold on;
  set(p,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);
  p1 = plot(ep_es, sig_es);
  set(p1,'LineWidth',2,'Color',color,'MarkerSize',20,'Marker','x');
  p2 = plot([ep_es ep_es], [0 400]);
  set(p2,'LineWidth',2,'Color',color,'MarkerSize',20,'Marker',marker);
  set(gca, 'XLim', [0 0.5], 'YLim', [0 400]);
  grid on;
  grid on;
  set(gca, 'YMinorGrid', 'on', 'MinorGridLineStyle', '-');

  subplot(2,2,2);
  p = plot(sigma_e, theta, 'p-', 'LineWidth', 2); hold on;
  set(p,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);
  p1 = plot(sig_es, 0);
  set(p1,'LineWidth',2,'Color',color,'MarkerSize',20,'Marker','x');
  set(gca, 'XLim', [0 250], 'YLim', [0 6000]);
  grid on;
  grid on;
  set(gca, 'MinorGridLineStyle', '-');

  subplot(2,2,3);
  p = plot(ep, Tall, 'p-', 'LineWidth', 2); hold on;
  set(p,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);
  p1 = plot([ep_es ep_es],[0 700]);
  set(p1,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);
  p2 = plot(ep_es, T_es);
  set(p2,'LineWidth',2,'Color',color,'MarkerSize',20,'Marker','x');
  set(gca, 'XLim', [0 0.5], 'YLim', [0 700]);
  grid on;
  grid on;
  set(gca, 'MinorGridLineStyle', '-');

  %
  % Write data
  %
  fprintf(fid,'%g %g %g %g %g %g\n',sig_es, ep_es, T_es, T0, edot, P);

