%
% Compute the initial yield stress.
%
% The data are collected into bins based on the source instead
% of the strain rate (unlike Step3)
%
function calcSigyVarEp

  color = [[0.90 0.10 0.10];[0.10 0.90 0.10];[0.10 0.10 0.90];...
           [0.75 0.25 1.00];[1.00 0.75 0.25];[0.15 0.30 0.70];...
           [0.10 0.80 0.30];[0.25 0.75 1.00];[0.66 0.60 0.00];...
           [0.60 0.20 0.00];[0.60 0.72 0.00];[0.30 0.55 0.60]];

  fid = fopen('ProcData/AlHogeEp0.dat', 'w');
  plotHoge(fid, color);
  fclose(fid);

  fid = fopen('ProcData/AlGeenEleicheEp0.dat', 'w');
  plotGreenEleiche(fid, color);
  fclose(fid);

  fid = fopen('ProcData/AlDavidsonEp0.dat', 'w');
  plotDavidson(fid, color);
  fclose(fid);

  fid = fopen('ProcData/AlRosenbergEp0.dat', 'w');
  plotRosenberg(fid, color);
  fclose(fid);

  fid = fopen('ProcData/AlLeeEp0.dat', 'w');
  plotLee(fid, color);
  fclose(fid);

  fid = fopen('ProcData/AlYadavEp0.dat', 'w');
  plotYadav(fid, color);
  fclose(fid);

  fid = fopen('ProcData/AlASMHEp0.dat', 'w');
  plotASMH(fid, color);
  fclose(fid);

  fid = fopen('ProcData/AlOgawaEp0.dat', 'w');
  plotOgawa(fid, color);
  fclose(fid);

  fid = fopen('ProcData/AlLesuerRameshEp0.dat', 'w');
  plotLesuerRamesh(fid, color);
  fclose(fid);

  fid = fopen('ProcData/AlFishCadyEp0.dat', 'w');
  plotFishCady(fid, color);
  fclose(fid);

%====================================================================
%
% Load experimental data from Ogawa
%
function plotOgawa(fid, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);
 
  load ./ProcData/SigEpsEp000057s77KOga.dat.raw
  dat = SigEpsEp000057s77KOga;
  sig0 = 275;
  p1 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp000057s201KOga.dat.raw
  dat = SigEpsEp000057s201KOga;
  sig0 = 240;
  p2 = plotSigEp(dat, color(2,:), fid, sig0);

  load ./ProcData/SigEpsEp000057s289KOga.dat.raw
  dat = SigEpsEp000057s289KOga;
  sig0 = 235;
  p3 = plotSigEp(dat, color(3,:), fid, sig0);

  load ./ProcData/SigEpsEp000057s373KOga.dat.raw
  dat = SigEpsEp000057s373KOga;
  sig0 = 220;
  p5 = plotSigEp(dat, color(5,:), fid, sig0);

  load ./ProcData/SigEpsEp000057s473KOga.dat.raw
  dat = SigEpsEp000057s473KOga;
  sig0 = 175;
  p6 = plotSigEp(dat, color(6,:), fid, sig0);

  load ./ProcData/SigEpsEp1500s77KOga.dat.raw
  dat = SigEpsEp1500s77KOga;
  sig0 = 325;
  p101 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp1500s201KOga.dat.raw
  dat = SigEpsEp1500s201KOga;
  sig0 = 270;
  p102 = plotSigEp(dat, color(2,:), fid, sig0);

  load ./ProcData/SigEpsEp1500s289KOga.dat.raw
  dat = SigEpsEp1500s289KOga;
  sig0 = 260;
  p103 = plotSigEp(dat, color(3,:), fid, sig0);

  load ./ProcData/SigEpsEp1500s373KOga.dat.raw
  dat = SigEpsEp1500s373KOga;
  sig0 = 240;
  p107 = plotSigEp(dat, color(5,:), fid, sig0);

  load ./ProcData/SigEpsEp1500s473KOga.dat.raw
  dat = SigEpsEp1500s473KOga;
  sig0 = 230;
  p108 = plotSigEp(dat, color(6,:), fid, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p2 p3 p5 p6 ...
          p101 p102 p103 p107 p108], ...
         '77 K 5.7e-4/s (Ogawa)', ...
         '201 K 5.7e-4/s (Ogawa)', ...
         '289 K 5.7e-4/s (Ogawa)', ...
         '373 K 5.7e-4/s (Ogawa)', ...
         '473 K 5.7e-4/s (Ogawa)', ...
         '77 K 1500/s (Ogawa)', ...
         '201 K 1500/s (Ogawa)', ...
         '289 K 1500/s (Ogawa)', ...
         '373 K 1500/s (Ogawa)', ...
         '473 K 1500/s (Ogawa)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data from Hoge
%
function plotHoge(fid, color)

  load ./ProcData/SigEpsEp0000048s297KHog.dat.raw
  dat = SigEpsEp0000048s297KHog;
  sig0 = 255;
  p4 = plotSigEp(dat, color(4,:), fid, sig0);

  load ./ProcData/SigEpsEp0000010s533KHog.dat.raw
  dat = SigEpsEp0000010s533KHog;
  sig0 = 100;
  p7 = plotSigEp(dat, color(7,:), fid, sig0);

  load ./ProcData/SigEpsEp0000010s644KHog.dat.raw
  dat = SigEpsEp0000010s644KHog;
  sig0 = 25;
  p8 = plotSigEp(dat, color(8,:), fid, sig0);

  load ./ProcData/SigEpsEp28s297KHog.dat.raw
  dat = SigEpsEp28s297KHog;
  sig0 = 295;
  p62 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp18s533KHog.dat.raw
  dat = SigEpsEp18s533KHog;
  sig0 = 208;
  p65 = plotSigEp(dat, color(4,:), fid, sig0);

  load ./ProcData/SigEpsEp23s644KHog.dat.raw
  dat = SigEpsEp23s644KHog;
  sig0 = 170;
  p66 = plotSigEp(dat, color(5,:), fid, sig0);

  load ./ProcData/SigEpsEp65s297KHog.dat.raw
  dat = SigEpsEp65s297KHog;
  sig0 = 320;
  p71 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp54s644KHog.dat.raw
  dat = SigEpsEp54s644KHog;
  sig0 = 205;
  p73 = plotSigEp(dat, color(3,:), fid, sig0);

  load ./ProcData/SigEpsEp130s533KHog.dat.raw
  dat = SigEpsEp130s533KHog;
  sig0 = 275;
  p83 = plotSigEp(dat, color(2,:), fid, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p4 p7 p8 ...
          p62 p65 p66 ...
          p71 p73 p83], ...
         '297 K 4.8e-5/s (Hoge)', ...
         '533 K 1.0e-5/s (Hoge)', ...
         '644 K 1.0e-5/s (Hoge)', ...
         '297 K 28/s (Hoge)', ...
         '533 K 18/s (Hoge)', ...
         '644 K 23/s (Hoge)', ...
         '297 K 65/s (Hoge)', ...
         '644 K 54/s (Hoge)', ...
         '533 K 130/s (Hoge)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data from Green-Eleiche
%
function plotGreenEleiche(fid, color);

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./ProcData/SigEpsEp0001s294KEle.dat.raw
  dat = SigEpsEp0001s294KEle;
  sig0 = 310;
  p1 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp0001s422KEle.dat.raw
  dat = SigEpsEp0001s422KEle;
  sig0 = 280;
  p7 = plotSigEp(dat, color(6,:), fid, sig0);

  load ./ProcData/SigEpsEp0001s422KGre.dat.raw
  dat = SigEpsEp0001s422KGre;
  sig0 = 270;
  p8 = plotSigEp(dat, color(6,:), fid, sig0);

  load ./ProcData/SigEpsEp0001s478KEle.dat.raw
  dat = SigEpsEp0001s478KEle;
  sig0 = 250;
  p10 = plotSigEp(dat, color(9,:), fid, sig0);

  load ./ProcData/SigEpsEp0001s561KEle.dat.raw
  dat = SigEpsEp0001s561KEle;
  sig0 = 130;
  p11 = plotSigEp(dat, color(11,:), fid, sig0);

  load ./ProcData/SigEpsEp0001s589KGre.dat.raw
  dat = SigEpsEp0001s589KGre;
  sig0 = 145;
  p12 = plotSigEp(dat, color(12,:), fid, sig0);

  load ./ProcData/SigEpsEp0002s295KGre.dat.raw
  dat = SigEpsEp0002s295KGre;
  sig0 = 305;
  p21 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp0002s422KEle.dat.raw
  sig0 = 280;
  dat = SigEpsEp0002s422KEle;
  p25 = plotSigEp(dat, color(3,:), fid, sig0);

  load ./ProcData/SigEpsEp0002s478KEle.dat.raw
  sig0 = 240;
  dat = SigEpsEp0002s478KEle;
  p27 = plotSigEp(dat, color(4,:), fid, sig0);

  load ./ProcData/SigEpsEp0002s561KEle.dat.raw
  dat = SigEpsEp0002s561KEle;
  sig0 = 120;
  p29 = plotSigEp(dat, color(6,:), fid, sig0);

  load ./ProcData/SigEpsEp002s422KEle.dat.raw
  dat = SigEpsEp002s422KEle;
  sig0 = 280;
  p31 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp0085s422KEle.dat.raw
  dat = SigEpsEp0085s422KEle;
  sig0 = 288;
  p32 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp005s478KEle.dat.raw
  dat = SigEpsEp005s478KEle;
  sig0 = 253;
  p33 = plotSigEp(dat, color(2,:), fid, sig0);

  load ./ProcData/SigEpsEp002s561KEle.dat.raw
  dat = SigEpsEp002s561KEle;
  sig0 = 131;
  p34 = plotSigEp(dat, color(3,:), fid, sig0);

  load ./ProcData/SigEpsEp006s561KEle.dat.raw
  dat = SigEpsEp006s561KEle;
  sig0 = 143;
  p35 = plotSigEp(dat, color(3,:), fid, sig0);

  load ./ProcData/SigEpsEp0085s561KEle.dat.raw
  dat = SigEpsEp0085s561KEle;
  sig0 = 151;
  p36 = plotSigEp(dat, color(3,:), fid, sig0);

  load ./ProcData/SigEpsEp015s561KEle.dat.raw
  dat = SigEpsEp015s561KEle;
  sig0 = 160;
  p37 = plotSigEp(dat, color(3,:), fid, sig0);

  load ./ProcData/SigEpsEp11s422KEle.dat.raw
  dat = SigEpsEp11s422KEle;
  sig0 = 286;
  p41 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp075s478KEle.dat.raw
  dat = SigEpsEp075s478KEle;
  sig0 = 263;
  p42 = plotSigEp(dat, color(2,:), fid, sig0);

  load ./ProcData/SigEpsEp070s561KEle.dat.raw
  dat = SigEpsEp070s561KEle;
  sig0 = 165;
  p43 = plotSigEp(dat, color(3,:), fid, sig0);

  load ./ProcData/SigEpsEp12s561KEle.dat.raw
  dat = SigEpsEp12s561KEle;
  sig0 = 165;
  p44 = plotSigEp(dat, color(3,:), fid, sig0);

  load ./ProcData/SigEpsEp85s422KEle.dat.raw
  dat = SigEpsEp85s422KEle;
  sig0 = 280;
  p51 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp9s422KGre.dat.raw
  dat = SigEpsEp9s422KGre;
  sig0 = 295;
  p52 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp5s478KEle.dat.raw
  dat = SigEpsEp5s478KEle;
  sig0 = 263;
  p53 = plotSigEp(dat, color(2,:), fid, sig0);

  load ./ProcData/SigEpsEp10s589KGre.dat.raw
  dat = SigEpsEp10s589KGre;
  sig0 = 190;
  p54 = plotSigEp(dat, color(3,:), fid, sig0);

  load ./ProcData/SigEpsEp18s295KGre.dat.raw
  dat = SigEpsEp18s295KGre;
  sig0 = 308;
  p61 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp30s422KEle.dat.raw
  dat = SigEpsEp30s422KEle;
  sig0 = 288;
  p63 = plotSigEp(dat, color(2,:), fid, sig0);

  load ./ProcData/SigEpsEp30s478KEle.dat.raw
  dat = SigEpsEp30s478KEle;
  sig0 = 270;
  p64 = plotSigEp(dat, color(3,:), fid, sig0);

  load ./ProcData/SigEpsEp50s561KEle.dat.raw
  dat = SigEpsEp50s561KEle;
  sig0 = 170;
  p72 = plotSigEp(dat, color(2,:), fid, sig0);

  load ./ProcData/SigEpsEp1000s294KEle.dat.raw
  dat = SigEpsEp1000s294KEle;
  sig0 = 305;
  p91 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp1000s422KEle.dat.raw
  dat = SigEpsEp1000s422KEle;
  sig0 = 290;
  p94 = plotSigEp(dat, color(2,:), fid, sig0);

  load ./ProcData/SigEpsEp900s478KEle.dat.raw
  dat = SigEpsEp900s478KEle;
  sig0 = 275;
  p96 = plotSigEp(dat, color(4,:), fid, sig0);

  load ./ProcData/SigEpsEp1000s478KEle.dat.raw
  dat = SigEpsEp1000s478KEle;
  sig0 = 276;
  p97 = plotSigEp(dat, color(4,:), fid, sig0);

  load ./ProcData/SigEpsEp1000s561KEle.dat.raw
  dat = SigEpsEp1000s561KEle;
  sig0 = 180;
  p98 = plotSigEp(dat, color(5,:), fid, sig0);

  load ./ProcData/SigEpsEp1150s561KEle.dat.raw
  dat = SigEpsEp1150s561KEle;
  sig0 = 180;
  p99 = plotSigEp(dat, color(5,:), fid, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p7 p8 p10 p11 p12 p21 p25 p27 p29 ...
          p31 p32 p33 p34 p35 p36 p37 ...
          p41 p42 p43 p44 ...
          p51 p52 p53 p54 ...
          p61 p63 p64 p72 ...
          p91 p94 p96 p97 p98 p99], ...
         '294 K 1.0e-3/s (Green)', ...
         '422 K 1.0e-3/s (Green)', ...
         '422 K 1.0e-3/s (Green)', ...
         '478 K 1.0e-3/s (Green)', ...
         '561 K 1.0e-3/s (Green)', ...
         '589 K 1.0e-3/s (Green)', ...
         '295 K 2.0e-3/s (Green)', ...
         '422 K 2.0e-3/s (Green)', ...
         '478 K 2.0e-3/s (Green)', ...
         '561 K 2.0e-3/s (Green)', ...
         '422 K 2.0e-2/s (Green)', ...
         '422 K 8.5e-2/s (Green)', ...
         '478 K 5.0e-2/s (Green)', ...
         '561 K 2.0e-2/s (Green)', ...
         '561 K 6.0e-2/s (Green)', ...
         '561 K 8.5e-2/s (Green)', ...
         '561 K 15.0e-2/s (Green)', ...
         '422 K 1.10/s (Green)', ...
         '478 K 0.75/s (Green)', ...
         '561 K 0.70/s (Green)', ...
         '561 K 1.20/s (Green)', ...
         '422 K 8.5/s (Green)', ...
         '422 K 9.0/s (Green)', ...
         '478 K 5.0/s (Green)', ...
         '589 K 10.0/s (Green)', ...
         '295 K 18/s (Green)', ...
         '422 K 30/s (Green)', ...
         '478 K 30/s (Green)', ...
         '561 K 50/s (Green)', ...
         '294 K 1000/s (Green)', ...
         '422 K 1000/s (Green)', ...
         '478 K 900/s (Green)', ...
         '478 K 1000/s (Green)', ...
         '561 K 1000/s (Green)', ...
         '561 K 1150/s (Green)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data from Fish-Cady
%
function plotFishCady(fid, color);

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./ProcData/SigEpsEp0001s295KFis.dat.raw
  dat = SigEpsEp0001s295KFis;
  sig0 = 300;
  p2 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp0001s298KCad.dat.raw
  dat = SigEpsEp0001s298KCad;
  sig0 = 315;
  p3 = plotSigEp(dat, color(2,:), fid, sig0);

  load ./ProcData/SigEpsEp2500s295KFis.dat.raw
  dat = SigEpsEp2500s295KFis;
  sig0 = 330;
  p104 = plotSigEp(dat, color(4,:), fid, sig0);

  load ./ProcData/SigEpsEp4000s298KCad.dat.raw
  dat = SigEpsEp4000s298KCad;
  sig0 = 350;
  p113 = plotSigEp(dat, color(3,:), fid, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p2 p3 p104 p113], ...
         '295 K 1.0e-3/s (Fish)', ...
         '298 K 1.0e-3/s (Cady)', ...
         '295 K 2500/s (Fish)', ...
         '298 K 4000/s (Cady)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data from Davidson
%
function plotDavidson(fid, color);

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./ProcData/SigEpsEp0001s300K01MPaDav.dat.raw
  dat = SigEpsEp0001s300K01MPaDav;
  sig0 = 281;
  p4 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp0001s367K01MPaDav.dat.raw
  dat = SigEpsEp0001s367K01MPaDav;
  sig0 = 255;
  p5 = plotSigEp(dat, color(5,:), fid, sig0);

  load ./ProcData/SigEpsEp0001s422K01MPaDav.dat.raw
  dat = SigEpsEp0001s422K01MPaDav;
  sig0 = 230;
  p6 = plotSigEp(dat, color(6,:), fid, sig0);

  load ./ProcData/SigEpsEp0001s478K01MPaDav.dat.raw
  dat = SigEpsEp0001s478K01MPaDav;
  sig0 = 188;
  p9 = plotSigEp(dat, color(9,:), fid, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p4 p5 p6 p9], ...
         '300 K 1.0e-3/s (Davidson)', ...
         '367 K 1.0e-3/s (Davidson)', ...
         '422 K 1.0e-3/s (Davidson)', ...
         '478 K 1.0e-3/s (Davidson)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data from ASMH
%
function plotASMH(fid, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./ProcData/SigEpsEp0002s298KASM.dat.raw
  dat = SigEpsEp0002s298KASM;
  sig0 = 243;
  p2 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp0002s373KASM.dat.raw
  dat = SigEpsEp0002s373KASM;
  sig0 = 235;
  p3 = plotSigEp(dat, color(2,:), fid, sig0);

  load ./ProcData/SigEpsEp0002s422KASM.dat.raw
  sig0 = 220;
  dat = SigEpsEp0002s422KASM;
  p4 = plotSigEp(dat, color(3,:), fid, sig0);

  load ./ProcData/SigEpsEp0002s477KASM.dat.raw
  sig0 = 185;
  dat = SigEpsEp0002s477KASM;
  p6 = plotSigEp(dat, color(4,:), fid, sig0);

  load ./ProcData/SigEpsEp0002s535KASM.dat.raw
  dat = SigEpsEp0002s535KASM;
  sig0 = 115;
  p8 = plotSigEp(dat, color(5,:), fid, sig0);

  load ./ProcData/SigEpsEp0002s589KASM.dat.raw
  dat = SigEpsEp0002s589KASM;
  sig0 = 20;
  p10 = plotSigEp(dat, color(7,:), fid, sig0);

  load ./ProcData/SigEpsEp0002s644KASM.dat.raw
  dat = SigEpsEp0002s644KASM;
  sig0 = 10;
  p11 = plotSigEp(dat, color(8,:), fid, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p2 p3 p4 p6 p8 p10 p11], ...
         '298 K 2.0e-3/s (ASMH)', ...
         '373 K 2.0e-3/s (ASMH)', ...
         '422 K 2.0e-3/s (ASMH)', ...
         '477 K 2.0e-3/s (ASMH)', ...
         '535 K 2.0e-3/s (ASMH)', ...
         '589 K 2.0e-3/s (ASMH)', ...
         '644 K 2.0e-3/s (ASMH)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data from Yadav
%
function plotYadav(fid, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./ProcData/SigEpsEp380s298KYad.dat.raw
  dat = SigEpsEp380s298KYad;
  sig0 = 263;
  p81 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp500s298KYad.dat.raw
  dat = SigEpsEp500s298KYad;
  sig0 = 310;
  p82 = plotSigEp(dat, color(2,:), fid, sig0);

  load ./ProcData/SigEpsEp2000s298KYad.dat.raw
  dat = SigEpsEp2000s298KYad;
  sig0 = 310;
  p106 = plotSigEp(dat, color(4,:), fid, sig0);

  load ./ProcData/SigEpsEp3600s298KYad.dat.raw
  dat = SigEpsEp3600s298KYad;
  sig0 = 340;
  p112 = plotSigEp(dat, color(5,:), fid, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.2]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p81 p82 p106 p112], ...
         '298 K 380/s (Yadav)', ...
         '298 K 500/s (Yadav)', ...
         '298 K 2000/s (Yadav)', ...
         '298 K 3600/s (Yadav)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data from Lee
%
function plotLee(fid, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./ProcData/SigEpsEp1000s298KLee.dat.raw
  dat = SigEpsEp1000s298KLee;
  sig0 = 325;
  p92 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp2000s298KLee.dat.raw
  dat = SigEpsEp2000s298KLee;
  sig0 = 340;
  p105 = plotSigEp(dat, color(4,:), fid, sig0);

  load ./ProcData/SigEpsEp3000s298KLee.dat.raw
  dat = SigEpsEp3000s298KLee;
  sig0 = 347;
  p111 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp4000s298KLee.dat.raw
  dat = SigEpsEp4000s298KLee;
  sig0 = 360;
  p114 = plotSigEp(dat, color(3,:), fid, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.26]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p92 p105 p111 p114], ...
         '298 K 1000/s (Lee)', ...
         '298 K 2000/s (Lee)', ...
         '298 K 3000/s (Lee)', ...
         '298 K 4000/s (Lee)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data from Rosenberg
%
function plotRosenberg(fid, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./ProcData/SigEpsEp1000s298KRos.dat.raw
  dat = SigEpsEp1000s298KRos;
  sig0 = 240;
  p93 = plotSigEp(dat, color(1,:), fid, sig0);

  load ./ProcData/SigEpsEp1000s463KRos.dat.raw
  dat = SigEpsEp1000s463KRos;
  sig0 = 150;
  p95 = plotSigEp(dat, color(3,:), fid, sig0);

  load ./ProcData/SigEpsEp1000s618KRos.dat.raw
  dat = SigEpsEp1000s618KRos;
  sig0 = 25;
  p910 = plotSigEp(dat, color(6,:), fid, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.26]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p93 p95 p910], ...
         '298 K 1000/s (Rosenberg)', ...
         '463 K 1000/s (Rosenberg)', ...
         '618 K 1000/s (Rosenberg)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data for Lesuer-Ramesh
%
function plotLesuerRamesh(fid, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./ProcData/SigEpsEp4000s298KLes.dat.raw
  dat = SigEpsEp4000s298KLes;
  sig0 = 345;
  p115 = plotSigEp(dat, color(3,:), fid, sig0);

  load ./ProcData/SigEpsEp8000s298KLes.dat.raw
  dat = SigEpsEp8000s298KLes;
  sig0 = 360;
  p116 = plotSigEp(dat, color(4,:), fid, sig0);

  load ./ProcData/SigEpsEp29000s298KRam.dat.raw
  dat = SigEpsEp29000s298KRam;
  sig0 = 355;
  p117 = plotSigEp(dat, color(5,:), fid, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.5]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p115 p116 p117], ...
         '298 K 4000/s (Lesuer)', ...
         '298 K 8000/s (Lesuer)', ...
         '298 K 29000/s (Ramesh)');
  %axis square;
  grid on;

%=======================================================================
% Plot stress-strain curves 
% and write intersection point 
%
function [p] = plotSigEp(dat, color, fid, sig0)

  P = dat(1,1);
  T = dat(1,2);
  edot = dat(1,3);
  epEx = dat(:,5);
  seqEx = dat(:,6);
  p = plot(epEx, seqEx, 'p-', 'LineWidth', 2); hold on;
  set(p,'LineWidth',2,'Color',color);

  ep = 0.0;
  p1 = plot(ep, sig0,'x','MarkerSize', 13, 'LineWidth', 2);
  set(p1, 'Color', color);
  fprintf(fid, '%g %g %g %g %g %g\n', ep, edot, T, P, ep, sig0);
  %ep = 0.05;
  %[p1] = intersectPoly(seqEx, epEx, ep);
  %plot(p1(1),p1(2),'kx','MarkerSize', 10, 'LineWidth', 3);
  %fprintf(fid, '%g %g %g %g %g %g\n', ep, epdot, T, Rc, p1(1), p1(2));
  %ep = 0.1;
  %[p1] = intersectPoly(seqEx, epEx, ep);
  %plot(p1(1),p1(2),'kx','MarkerSize', 10, 'LineWidth', 3);
  %fprintf(fid, '%g %g %g %g %g %g\n', ep, epdot, T, Rc, p1(1), p1(2));
  %ep = 0.2;
  %[p2] = intersectPoly(seqEx, epEx, ep);
  %plot(p2(1),p2(2),'kx','MarkerSize', 10, 'LineWidth', 3);
  %fprintf(fid, '%g %g %g %g %g %g\n', ep, epdot, T, Rc, p2(1), p2(2));

%====================================================================
%
% Calculate intersection with stress-strain curve at various strains
%
function [p] = intersectPoly(stress, strain, eps)

  %
  % Create vertical line
  %
  p1 = [eps 0.0];
  p2 = [eps 2500.0];

  %
  % Find intersection with polyline
  %
  p = p1;
  [n,m] = size(stress);
  for i=1:n-1
    p3(1) = strain(i,:);
    p3(2) = stress(i,:);
    p4(1) = strain(i+1,:);
    p4(2) = stress(i+1,:);
    [p, t1, t2] = intersect(p1,p2,p3,p4);
    if ((t2 >= 0.0) & (t2 <= 1.0))
      break;
    end
  end

%
% Find the intersection of two lines
%
function [p, t1, t2] = intersect(p1,p2,p3,p4)

  x1 = p1(1); x2 = p2(1); x3 = p3(1); x4 = p4(1);
  y1 = p1(2); y2 = p2(2); y3 = p3(2); y4 = p4(2);

  dx1 = x2 - x1;
  dy1 = y2 - y1;
  dx2 = x4 - x3;
  dy2 = y4 - y3;
  dx3 = x1 - x3;
  dy3 = y1 - y3;

  denom = dy2*dx1 - dx2*dy1;
  t1 = (dx2*dy3 - dy2*dx3)/denom;
  t2 = (dx1*dy3 - dy1*dx3)/denom;
  p(1) = x1 + t1*dx1;
  p(2) = y1 + t1*dy1;

