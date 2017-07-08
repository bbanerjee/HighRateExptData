%
% Compute the hardening part of the stress-strain curve
%
% The data are collected into bins based on the source instead
% of the strain rate (unlike Step8)
%
function calcSigeFromSigy

  marker = ['o';'p';'v';'s';'d';'^';'h';'<';'x';'>';'+';'*'];
  color = [[0.90 0.10 0.10];[0.10 0.90 0.10];[0.10 0.10 0.90];...
           [0.75 0.25 1.00];[1.00 0.75 0.25];[0.15 0.30 0.70];...
           [0.10 0.80 0.30];[0.25 0.75 1.00];[0.66 0.60 0.00];...
           [0.60 0.20 0.00];[0.60 0.72 0.00];[0.30 0.55 0.60]];

  rho = 2700.0;
  rho0 = 2700.0;
  k = 1.3806503e-23;
  b = 2.86e-10; % Wang, Physica Status Solidi A, 169(43), 1998, p. 46.

  g0e = 3.0;
  edot_0e = 1.0e9;
  q_e = 1.0;
  p_e = 0.75;

  matConst = [rho0 k b g0e edot_0e q_e p_e];

  fidA = fopen('MTSParams.dat','a');
  fprintf(fidA, 'g0e = 3.0\n');
  fprintf(fidA, 'edot_0e = 1.0e9\n');
  fprintf(fidA, 'q_e = 1.0\n');
  fprintf(fidA, 'p_e = 0.75\n');
  fclose(fidA);


  plotHoge(matConst, marker, color);
  plotGreenEleiche(matConst, marker, color);
  plotDavidson(matConst, marker, color);
  plotRosenberg(matConst, marker, color);
  plotLee(matConst, marker, color);
  plotYadav(matConst, marker, color);
  plotASMH(matConst, marker, color);
  plotOgawa(matConst, marker, color);
  plotLesuerRamesh(matConst, marker, color);
  plotFishCady(matConst, marker, color);

%====================================================================
%
% Load experimental data from Ogawa
%
function plotOgawa(matConst, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);
 
  load ./ProcData/SigEpsEp000057s77KOga.dat.raw
  dat = SigEpsEp000057s77KOga;
  filename = './SigeEpData/SigeEp000057s77KOga.dat';
  sig0 = 275;
  p1 = plotSigEp(dat, matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp000057s201KOga.dat.raw
  dat = SigEpsEp000057s201KOga;
  filename = './SigeEpData/SigeEp000057s201KOga.dat';
  sig0 = 240;
  p2 = plotSigEp(dat, matConst, color(2,:), marker(2,:), filename, sig0);

  load ./ProcData/SigEpsEp000057s289KOga.dat.raw
  dat = SigEpsEp000057s289KOga;
  filename = './SigeEpData/SigeEp000057s289KOga.dat';
  sig0 = 235;
  p3 = plotSigEp(dat, matConst, color(3,:), marker(3,:), filename, sig0);

  load ./ProcData/SigEpsEp000057s373KOga.dat.raw
  dat = SigEpsEp000057s373KOga;
  filename = './SigeEpData/SigeEp000057s373KOga.dat';
  sig0 = 220;
  p5 = plotSigEp(dat, matConst, color(5,:), marker(5,:), filename, sig0);

  load ./ProcData/SigEpsEp000057s473KOga.dat.raw
  dat = SigEpsEp000057s473KOga;
  filename = './SigeEpData/SigeEp000057s473KOga.dat';
  sig0 = 175;
  p6 = plotSigEp(dat, matConst, color(6,:), marker(6,:), filename, sig0);

  load ./ProcData/SigEpsEp1500s77KOga.dat.raw
  dat = SigEpsEp1500s77KOga;
  filename = './SigeEpData/SigeEp1500s77KOga.dat';
  sig0 = 325;
  p101 = plotSigEp(dat, matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp1500s201KOga.dat.raw
  dat = SigEpsEp1500s201KOga;
  filename = './SigeEpData/SigeEp1500s201KOga.dat';
  sig0 = 270;
  p102 = plotSigEp(dat, matConst, color(2,:), marker(2,:), filename, sig0);

  load ./ProcData/SigEpsEp1500s289KOga.dat.raw
  dat = SigEpsEp1500s289KOga;
  filename = './SigeEpData/SigeEp1500s289KOga.dat';
  sig0 = 260;
  p103 = plotSigEp(dat, matConst, color(3,:), marker(3,:), filename, sig0);

  load ./ProcData/SigEpsEp1500s373KOga.dat.raw
  dat = SigEpsEp1500s373KOga;
  filename = './SigeEpData/SigeEp1500s373KOga.dat';
  sig0 = 240;
  p107 = plotSigEp(dat, matConst, color(5,:), marker(5,:), filename, sig0);

  load ./ProcData/SigEpsEp1500s473KOga.dat.raw
  dat = SigEpsEp1500s473KOga;
  filename = './SigeEpData/SigeEp1500s473KOga.dat';
  sig0 = 230;
  p108 = plotSigEp(dat, matConst, color(6,:), marker(6,:), filename, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
function plotHoge(matConst, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./ProcData/SigEpsEp0000048s297KHog.dat.raw
  dat = SigEpsEp0000048s297KHog;
  filename = './SigeEpData/SigeEp0000048s297KHog.dat';
  sig0 = 255;
  p4 = plotSigEp(dat, matConst, color(4,:), marker(4,:), filename, sig0);

  load ./ProcData/SigEpsEp0000010s533KHog.dat.raw
  dat = SigEpsEp0000010s533KHog;
  filename = './SigeEpData/SigeEp0000010s533KHog.dat';
  sig0 = 100;
  p7 = plotSigEp(dat, matConst, color(7,:), marker(7,:), filename, sig0);

  load ./ProcData/SigEpsEp0000010s644KHog.dat.raw
  dat = SigEpsEp0000010s644KHog;
  filename = './SigeEpData/SigeEp0000010s644KHog.dat';
  sig0 = 25;
  p8 = plotSigEp(dat, matConst, color(8,:), marker(8,:), filename, sig0);

  load ./ProcData/SigEpsEp28s297KHog.dat.raw
  dat = SigEpsEp28s297KHog;
  filename = './SigeEpData/SigeEp28s297KHog.dat';
  sig0 = 295;
  p62 = plotSigEp(dat, matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp18s533KHog.dat.raw
  dat = SigEpsEp18s533KHog;
  filename = './SigeEpData/SigeEp18s533KHog.dat';
  sig0 = 208;
  p65 = plotSigEp(dat, matConst, color(4,:), marker(4,:), filename, sig0);

  load ./ProcData/SigEpsEp23s644KHog.dat.raw
  dat = SigEpsEp23s644KHog;
  filename = './SigeEpData/SigeEp23s644KHog.dat';
  sig0 = 170;
  p66 = plotSigEp(dat, matConst, color(5,:), marker(5,:), filename, sig0);

  load ./ProcData/SigEpsEp65s297KHog.dat.raw
  dat = SigEpsEp65s297KHog;
  filename = './SigeEpData/SigeEp65s297KHog.dat';
  sig0 = 320;
  p71 = plotSigEp(dat, matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp54s644KHog.dat.raw
  dat = SigEpsEp54s644KHog;
  filename = './SigeEpData/SigeEp54s644KHog.dat';
  sig0 = 205;
  p73 = plotSigEp(dat, matConst, color(3,:), marker(3,:), filename, sig0);

  load ./ProcData/SigEpsEp130s533KHog.dat.raw
  dat = SigEpsEp130s533KHog;
  filename = './SigeEpData/SigeEp130s533KHog.dat';
  sig0 = 275;
  p83 = plotSigEp(dat, matConst, color(2,:), marker(2,:), filename, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
function plotGreenEleiche(matConst, marker, color);

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./ProcData/SigEpsEp0001s294KEle.dat.raw
  dat = SigEpsEp0001s294KEle;
  filename = './SigeEpData/SigeEp0001s294KEle.dat';
  sig0 = 310;
  p1 = plotSigEp(dat, matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp0001s422KEle.dat.raw
  dat = SigEpsEp0001s422KEle;
  filename = './SigeEpData/SigeEp0001s422KEle.dat';
  sig0 = 280;
  p7 = plotSigEp(dat, matConst, color(6,:), marker(6,:), filename, sig0);

  load ./ProcData/SigEpsEp0001s422KGre.dat.raw
  dat = SigEpsEp0001s422KGre;
  filename = './SigeEpData/SigeEp0001s422KGre.dat';
  sig0 = 270;
  p8 = plotSigEp(dat, matConst, color(6,:), marker(6,:), filename, sig0);

  load ./ProcData/SigEpsEp0001s478KEle.dat.raw
  dat = SigEpsEp0001s478KEle;
  filename = './SigeEpData/SigeEp0001s478KEle.dat';
  sig0 = 250;
  p10 = plotSigEp(dat, matConst, color(9,:), marker(9,:), filename, sig0);

  load ./ProcData/SigEpsEp0001s561KEle.dat.raw
  dat = SigEpsEp0001s561KEle;
  filename = './SigeEpData/SigeEp0001s561KEle.dat';
  sig0 = 130;
  p11 = plotSigEp(dat, matConst, color(11,:), marker(11,:), filename, sig0);

  load ./ProcData/SigEpsEp0001s589KGre.dat.raw
  dat = SigEpsEp0001s589KGre;
  filename = './SigeEpData/SigeEp0001s589KGre.dat';
  sig0 = 145;
  p12 = plotSigEp(dat, matConst, color(12,:), marker(12,:), filename, sig0);

  load ./ProcData/SigEpsEp0002s295KGre.dat.raw
  dat = SigEpsEp0002s295KGre;
  filename = './SigeEpData/SigeEp0002s295KGre.dat';
  sig0 = 305;
  p21 = plotSigEp(dat, matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp0002s422KEle.dat.raw
  dat = SigEpsEp0002s422KEle;
  filename = './SigeEpData/SigeEp0002s422KEle.dat';
  sig0 = 280;
  p25 = plotSigEp(dat, matConst, color(3,:), marker(3,:), filename, sig0);

  load ./ProcData/SigEpsEp0002s478KEle.dat.raw
  dat = SigEpsEp0002s478KEle;
  filename = './SigeEpData/SigeEp0002s478KEle.dat';
  sig0 = 240;
  p27 = plotSigEp(dat, matConst, color(4,:), marker(4,:), filename, sig0);

  load ./ProcData/SigEpsEp0002s561KEle.dat.raw
  dat = SigEpsEp0002s561KEle;
  filename = './SigeEpData/SigeEp0002s561KEle.dat';
  sig0 = 120;
  p29 = plotSigEp(dat, matConst, color(6,:), marker(6,:), filename, sig0);

  load ./ProcData/SigEpsEp002s422KEle.dat.raw
  dat = SigEpsEp002s422KEle;
  filename = './SigeEpData/SigeEp002s422KEle.dat';
  sig0 = 280;
  p31 = plotSigEp(dat, matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp0085s422KEle.dat.raw
  dat = SigEpsEp0085s422KEle;
  filename = './SigeEpData/SigeEp0085s422KEle.dat';
  sig0 = 288;
  p32 = plotSigEp(dat, matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp005s478KEle.dat.raw
  dat = SigEpsEp005s478KEle;
  filename = './SigeEpData/SigeEp005s478KEle.dat';
  sig0 = 253;
  p33 = plotSigEp(dat, matConst, color(2,:), marker(2,:), filename, sig0);

  load ./ProcData/SigEpsEp002s561KEle.dat.raw
  dat = SigEpsEp002s561KEle;
  filename = './SigeEpData/SigeEp002s561KEle.dat';
  sig0 = 131;
  p34 = plotSigEp(dat, matConst, color(3,:), marker(3,:), filename, sig0);

  load ./ProcData/SigEpsEp006s561KEle.dat.raw
  dat = SigEpsEp006s561KEle;
  filename = './SigeEpData/SigeEp006s561KEle.dat';
  sig0 = 143;
  p35 = plotSigEp(dat, matConst, color(3,:), marker(3,:), filename, sig0);

  load ./ProcData/SigEpsEp0085s561KEle.dat.raw
  dat = SigEpsEp0085s561KEle;
  filename = './SigeEpData/SigeEp0085s561KEle.dat';
  sig0 = 151;
  p36 = plotSigEp(dat, matConst, color(3,:), marker(3,:), filename, sig0);

  load ./ProcData/SigEpsEp015s561KEle.dat.raw
  dat = SigEpsEp015s561KEle;
  filename = './SigeEpData/SigeEp015s561KEle.dat';
  sig0 = 160;
  p37 = plotSigEp(dat, matConst, color(3,:), marker(3,:), filename, sig0);

  load ./ProcData/SigEpsEp11s422KEle.dat.raw
  dat = SigEpsEp11s422KEle;
  filename = './SigeEpData/SigeEp11s422KEle.dat';
  sig0 = 286;
  p41 = plotSigEp(dat, matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp075s478KEle.dat.raw
  dat = SigEpsEp075s478KEle;
  filename = './SigeEpData/SigeEp075s478KEle.dat';
  sig0 = 263;
  p42 = plotSigEp(dat, matConst, color(2,:), marker(2,:), filename, sig0);

  load ./ProcData/SigEpsEp070s561KEle.dat.raw
  dat = SigEpsEp070s561KEle;
  filename = './SigeEpData/SigeEp070s561KEle.dat';
  sig0 = 165;
  p43 = plotSigEp(dat, matConst, color(3,:), marker(3,:), filename, sig0);

  load ./ProcData/SigEpsEp12s561KEle.dat.raw
  dat = SigEpsEp12s561KEle;
  filename = './SigeEpData/SigeEp12s561KEle.dat';
  sig0 = 165;
  p44 = plotSigEp(dat, matConst, color(3,:), marker(3,:), filename, sig0);

  load ./ProcData/SigEpsEp85s422KEle.dat.raw
  dat = SigEpsEp85s422KEle;
  filename = './SigeEpData/SigeEp85s422KEle.dat';
  sig0 = 280;
  p51 = plotSigEp(dat, matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp9s422KGre.dat.raw
  dat = SigEpsEp9s422KGre;
  filename = './SigeEpData/SigeEp9s422KGre.dat';
  sig0 = 295;
  p52 = plotSigEp(dat, matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp5s478KEle.dat.raw
  dat = SigEpsEp5s478KEle;
  filename = './SigeEpData/SigeEp5s478KEle.dat';
  sig0 = 263;
  p53 = plotSigEp(dat, matConst, color(2,:), marker(2,:), filename, sig0);

  load ./ProcData/SigEpsEp10s589KGre.dat.raw
  dat = SigEpsEp10s589KGre;
  filename = './SigeEpData/SigeEp10s589KGre.dat';
  sig0 = 190;
  p54 = plotSigEp(dat, matConst, color(3,:), marker(3,:), filename, sig0);

  load ./ProcData/SigEpsEp18s295KGre.dat.raw
  dat = SigEpsEp18s295KGre;
  filename = './SigeEpData/SigeEp18s295KGre.dat';
  sig0 = 308;
  p61 = plotSigEp(dat, matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp30s422KEle.dat.raw
  dat = SigEpsEp30s422KEle;
  filename = './SigeEpData/SigeEp30s422KEle.dat';
  sig0 = 288;
  p63 = plotSigEp(dat, matConst, color(2,:), marker(2,:), filename, sig0);

  load ./ProcData/SigEpsEp30s478KEle.dat.raw
  dat = SigEpsEp30s478KEle;
  filename = './SigeEpData/SigeEp30s478KEle.dat';
  sig0 = 270;
  p64 = plotSigEp(dat, matConst, color(3,:), marker(3,:), filename, sig0);

  load ./ProcData/SigEpsEp50s561KEle.dat.raw
  dat = SigEpsEp50s561KEle;
  filename = './SigeEpData/SigeEp50s561KEle.dat';
  sig0 = 170;
  p72 = plotSigEp(dat, matConst, color(2,:), marker(2,:), filename, sig0);

  load ./ProcData/SigEpsEp1000s294KEle.dat.raw
  dat = SigEpsEp1000s294KEle;
  filename = './SigeEpData/SigeEp1000s294KEle.dat';
  sig0 = 305;
  p91 = plotSigEp(dat, matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp1000s422KEle.dat.raw
  dat = SigEpsEp1000s422KEle;
  filename = './SigeEpData/SigeEp1000s422KEle.dat';
  sig0 = 290;
  p94 = plotSigEp(dat, matConst, color(2,:), marker(2,:), filename, sig0);

  load ./ProcData/SigEpsEp900s478KEle.dat.raw
  dat = SigEpsEp900s478KEle;
  filename = './SigeEpData/SigeEp900s478KEle.dat';
  sig0 = 275;
  p96 = plotSigEp(dat, matConst, color(4,:), marker(4,:), filename, sig0);

  load ./ProcData/SigEpsEp1000s478KEle.dat.raw
  dat = SigEpsEp1000s478KEle;
  filename = './SigeEpData/SigeEp1000s478KEle.dat';
  sig0 = 276;
  p97 = plotSigEp(dat, matConst, color(4,:), marker(4,:), filename, sig0);

  load ./ProcData/SigEpsEp1000s561KEle.dat.raw
  dat = SigEpsEp1000s561KEle;
  filename = './SigeEpData/SigeEp1000s561KEle.dat';
  sig0 = 180;
  p98 = plotSigEp(dat, matConst, color(5,:), marker(5,:), filename, sig0);

  load ./ProcData/SigEpsEp1150s561KEle.dat.raw
  dat = SigEpsEp1150s561KEle;
  filename = './SigeEpData/SigeEp1150s561KEle.dat';
  sig0 = 180;
  p99 = plotSigEp(dat, matConst, color(5,:), marker(5,:), filename, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
function plotFishCady(matConst, marker, color);

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./ProcData/SigEpsEp0001s295KFis.dat.raw
  dat = SigEpsEp0001s295KFis;
  filename = './SigeEpData/SigeEp0001s295KFis.dat';
  sig0 = 300;
  p2 = plotSigEp(dat, matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp0001s298KCad.dat.raw
  dat = SigEpsEp0001s298KCad;
  filename = './SigeEpData/SigeEp0001s298KCad.dat';
  sig0 = 315;
  p3 = plotSigEp(dat, matConst, color(2,:), marker(2,:), filename, sig0);

  load ./ProcData/SigEpsEp2500s295KFis.dat.raw
  dat = SigEpsEp2500s295KFis;
  filename = './SigeEpData/SigeEp2500s295KFis.dat';
  sig0 = 330;
  p104 = plotSigEp(dat, matConst, color(4,:), marker(4,:), filename, sig0);

  load ./ProcData/SigEpsEp4000s298KCad.dat.raw
  dat = SigEpsEp4000s298KCad;
  filename = './SigeEpData/SigeEp4000s298KCad.dat';
  sig0 = 350;
  p113 = plotSigEp(dat, matConst, color(3,:), marker(3,:), filename, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
function plotDavidson(matConst, marker, color);

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./ProcData/SigEpsEp0001s300K01MPaDav.dat.raw
  dat = SigEpsEp0001s300K01MPaDav;
  filename = './SigeEpData/SigeEp0001s300K01MPaDav.dat';
  sig0 = 281;
  p4 = plotSigEp(dat(1:8,:), matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp0001s367K01MPaDav.dat.raw
  dat = SigEpsEp0001s367K01MPaDav;
  filename = './SigeEpData/SigeEp0001s367K01MPaDav.dat';
  sig0 = 255;
  p5 = plotSigEp(dat(1:8,:), matConst, color(5,:), marker(5,:), filename, sig0);

  load ./ProcData/SigEpsEp0001s422K01MPaDav.dat.raw
  dat = SigEpsEp0001s422K01MPaDav;
  filename = './SigeEpData/SigeEp0001s422K01MPaDav.dat';
  sig0 = 230;
  p6 = plotSigEp(dat(1:7,:), matConst, color(6,:), marker(6,:), filename, sig0);

  load ./ProcData/SigEpsEp0001s478K01MPaDav.dat.raw
  dat = SigEpsEp0001s478K01MPaDav;
  filename = './SigeEpData/SigeEp0001s478K01MPaDav.dat';
  sig0 = 188;
  p9 = plotSigEp(dat(1:7,:), matConst, color(9,:), marker(9,:), filename, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
function plotASMH(matConst, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./ProcData/SigEpsEp0002s298KASM.dat.raw
  dat = SigEpsEp0002s298KASM;
  filename = './SigeEpData/SigeEp0002s298KASM.dat';
  sig0 = 243;
  p2 = plotSigEp(dat, matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp0002s373KASM.dat.raw
  dat = SigEpsEp0002s373KASM;
  filename = './SigeEpData/SigeEp0002s373KASM.dat';
  sig0 = 235;
  p3 = plotSigEp(dat, matConst, color(2,:), marker(2,:), filename, sig0);

  load ./ProcData/SigEpsEp0002s422KASM.dat.raw
  dat = SigEpsEp0002s422KASM;
  filename = './SigeEpData/SigeEp0002s422KASM.dat';
  sig0 = 220;
  p4 = plotSigEp(dat, matConst, color(3,:), marker(3,:), filename, sig0);

  load ./ProcData/SigEpsEp0002s477KASM.dat.raw
  dat = SigEpsEp0002s477KASM;
  filename = './SigeEpData/SigeEp0002s477KASM.dat';
  sig0 = 185;
  p6 = plotSigEp(dat, matConst, color(4,:), marker(4,:), filename, sig0);

  load ./ProcData/SigEpsEp0002s535KASM.dat.raw
  dat = SigEpsEp0002s535KASM;
  filename = './SigeEpData/SigeEp0002s535KASM.dat';
  sig0 = 115;
  p8 = plotSigEp(dat, matConst, color(5,:), marker(5,:), filename, sig0);

  load ./ProcData/SigEpsEp0002s589KASM.dat.raw
  dat = SigEpsEp0002s589KASM;
  filename = './SigeEpData/SigeEp0002s589KASM.dat';
  sig0 = 20;
  p10 = plotSigEp(dat, matConst, color(7,:), marker(7,:), filename, sig0);

  load ./ProcData/SigEpsEp0002s644KASM.dat.raw
  dat = SigEpsEp0002s644KASM;
  filename = './SigeEpData/SigeEp0002s644KASM.dat';
  sig0 = 10;
  p11 = plotSigEp(dat, matConst, color(8,:), marker(8,:), filename, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.1]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
function plotYadav(matConst, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./ProcData/SigEpsEp380s298KYad.dat.raw
  dat = SigEpsEp380s298KYad;
  filename = './SigeEpData/SigeEp380s298KYad.dat';
  sig0 = 263;
  p81 = plotSigEp(dat, matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp500s298KYad.dat.raw
  dat = SigEpsEp500s298KYad;
  filename = './SigeEpData/SigeEp500s298KYad.dat';
  sig0 = 310;
  p82 = plotSigEp(dat, matConst, color(2,:), marker(2,:), filename, sig0);

  load ./ProcData/SigEpsEp2000s298KYad.dat.raw
  dat = SigEpsEp2000s298KYad;
  filename = './SigeEpData/SigeEp2000s298KYad.dat';
  sig0 = 310;
  p106 = plotSigEp(dat, matConst, color(4,:), marker(4,:), filename, sig0);

  load ./ProcData/SigEpsEp3600s298KYad.dat.raw
  dat = SigEpsEp3600s298KYad;
  filename = './SigeEpData/SigeEp3600s298KYad.dat';
  sig0 = 340;
  p112 = plotSigEp(dat, matConst, color(5,:), marker(5,:), filename, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.2]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
function plotLee(matConst, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./ProcData/SigEpsEp1000s298KLee.dat.raw
  dat = SigEpsEp1000s298KLee;
  filename = './SigeEpData/SigeEp1000s298KLee.dat';
  sig0 = 325;
  p92 = plotSigEp(dat, matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp2000s298KLee.dat.raw
  dat = SigEpsEp2000s298KLee;
  filename = './SigeEpData/SigeEp2000s298KLee.dat';
  sig0 = 340;
  p105 = plotSigEp(dat, matConst, color(4,:), marker(4,:), filename, sig0);

  load ./ProcData/SigEpsEp3000s298KLee.dat.raw
  dat = SigEpsEp3000s298KLee;
  filename = './SigeEpData/SigeEp3000s298KLee.dat';
  sig0 = 347;
  p111 = plotSigEp(dat, matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp4000s298KLee.dat.raw
  dat = SigEpsEp4000s298KLee;
  filename = './SigeEpData/SigeEp4000s298KLee.dat';
  sig0 = 360;
  p114 = plotSigEp(dat, matConst, color(3,:), marker(3,:), filename, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.26]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
function plotRosenberg(matConst, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./ProcData/SigEpsEp1000s298KRos.dat.raw
  dat = SigEpsEp1000s298KRos;
  filename = './SigeEpData/SigeEp1000s298KRos.dat';
  sig0 = 240;
  p93 = plotSigEp(dat, matConst, color(1,:), marker(1,:), filename, sig0);

  load ./ProcData/SigEpsEp1000s463KRos.dat.raw
  dat = SigEpsEp1000s463KRos;
  filename = './SigeEpData/SigeEp1000s463KRos.dat';
  sig0 = 150;
  p95 = plotSigEp(dat, matConst, color(3,:), marker(3,:), filename, sig0);

  load ./ProcData/SigEpsEp1000s618KRos.dat.raw
  dat = SigEpsEp1000s618KRos;
  filename = './SigeEpData/SigeEp1000s618KRos.dat';
  sig0 = 25;
  p910 = plotSigEp(dat, matConst, color(6,:), marker(6,:), filename, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.26]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
function plotLesuerRamesh(matConst, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./ProcData/SigEpsEp4000s298KLes.dat.raw
  dat = SigEpsEp4000s298KLes;
  filename = './SigeEpData/SigeEp4000s298KLes.dat';
  sig0 = 345;
  p115 = plotSigEp(dat, matConst, color(3,:), marker(3,:), filename, sig0);

  load ./ProcData/SigEpsEp8000s298KLes.dat.raw
  dat = SigEpsEp8000s298KLes;
  filename = './SigeEpData/SigeEp8000s298KLes.dat';
  sig0 = 360;
  p116 = plotSigEp(dat(1:53,:), matConst, color(4,:), marker(4,:), filename, sig0);

  load ./ProcData/SigEpsEp29000s298KRam.dat.raw
  dat = SigEpsEp29000s298KRam;
  filename = './SigeEpData/SigeEp29000s298KRam.dat';
  sig0 = 355;
  p117 = plotSigEp(dat, matConst, color(5,:), marker(5,:), filename, sig0);

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.5]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_e (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p115 p116 p117], ...
         '298 K 4000/s (Lesuer)', ...
         '298 K 8000/s (Lesuer)', ...
         '298 K 29000/s (Ramesh)');
  %axis square;
  grid on;

%=======================================================================
% Plot stress-strain curves 
%
function [p] = plotSigEp(dat, matConst, color, marker, filename, sig_ipa)

  %
  % Read data
  %
  P = dat(1,1);
  T0 = dat(1,2);
  edot = dat(1,3);
  ep = dat(:,5);
  sig_y = dat(:,6)*1.0e6;
  sig_ipa = sig_ipa*1.0e6;

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
      T = computeTemp(matConst, delT, sig_m, ep_m, edot, T0);
    else
      T = T0;
    end
    sige = computeScaledSige(matConst, T, sig_m, sig_ipa);
    Se = computeSe(matConst, T, edot);
    sig_e(i) = sige/Se;
    TT(i) = T;
  end
  p = plot(ep, sig_e*1.0e-6, 'p-', 'LineWidth', 2); hold on;
  set(p,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);

  %
  % Find the sturation value of sigma_e
  %
  sige_satur = -1.0;
  if (length(ep) > 2)
    %
    % Fit a quadratic to the data
    %
    count = 0;
    for i=1:length(ep)
      if (sig_e(i) > 0.0) 
        count = count+1;
        epp(count) = ep(i);
        sigmae(count) = sig_e(i);
      end
    end

    [C,S] = polyfit(epp, sigmae ,2);

    %
    % Find the location of the maximum
    %
    ep_satur = -C(2)/(2.0*C(1));
    sige_satur = C(1)*ep_satur^2 + C(2)*ep_satur + C(3);

    %
    % Plot fit
    %
    xmin = 0.0;
    xmax = max(ep_satur,max(ep));
    nx = 100;
    xfit = linspace(xmin, xmax, nx);
    yfit = polyval(C, xfit);
    p1 = plot(xfit, yfit*1.0e-6, 'b-', 'LineWidth', 3); hold on;
    set(p1, 'Color', color);
   
    p2 = plot(ep_satur, sige_satur*1.0e-6, 'kx', 'LineWidth', 3, 'MarkerSize', 10);

    %
    % Find the temperature at saturation
    %
    t = 0;
    if (ep_satur > ep(length(ep)))
      T_satur = TT(length(ep));
    else
      t = 1;
      for i=1:length(ep)-1
        if (ep_satur > ep(i) & ep_satur < ep(i+1))
          t = (ep_satur - ep(i))/(ep(i+1) - ep(i));
          break;
        end
      end
      T_satur = (1-t)*TT(i) + t*TT(i+1);
    end
    text(1.1*ep_satur, sige_satur*1.0e-6, num2str(T_satur));
    

    %
    %  Write the saturation stress info
    %
    filename1 = sprintf('%s.satur',filename);
    fid = fopen(filename1, 'w');
    fprintf(fid, '%g %g %g %g %g %g %g %g %g \n', ...
                 C(1), C(2), C(3), ...
                 ep_satur, sige_satur*1.0e-6, T_satur, ...
                 edot, T0, P);
    fclose(fid);

  end

  %
  % Write output file
  %
  fid = fopen(filename, 'w');
  for i=1:length(ep)
    fprintf(fid, '%g %g %g %g %g %g \n', ep(i), sig_e(i)*1.0e-6, TT(i), ...
                                         edot, T0, P);
  end
  fclose(fid);

  

%====================================================================
% Compute scaled sige
%
function [sige] = computeScaledSige(matConst, T, sigy, sig_ipa)

  rho0 = matConst(1);
  rho = rho0;
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
function [Se] = computeSe(matConst, T, edot)

  rho0 = matConst(1);
  rho = rho0;
  k = matConst(2);
  b = matConst(3);

  g0e = matConst(4);
  edot_0e = matConst(5);
  q_e = matConst(6);
  p_e = matConst(7);

  P = calcP(rho, rho0, T, T);
  Tm = calcTm(rho, rho0);
  mu = calcmu(rho, rho0, Tm, P, T);
  Se_q = (k*T/(g0e*mu*b^3)*log(edot_0e/edot))^(1/q_e);
  Se = (1 - Se_q)^(1/p_e);

%====================================================================
% Compute the adiabatic temperature
%
function [T] = computeTemp(matConst, delT, sig, ep, epdot, T0)

  format short e
  rho0 = matConst(1);
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

