function testMTSFinalError
  close all;
  marker = ['o';'p';'v';'s';'d';'^';'h';'<';'x';'>';'+';'*'];
  color = [[0.90 0.10 0.10];[0.10 0.90 0.10];[0.10 0.10 0.90];...
           [0.75 0.25 1.00];[1.00 0.75 0.25];[0.15 0.30 0.70];...
           [0.10 0.80 0.30];[0.25 0.75 1.00];[0.66 0.60 0.00];...
           [0.60 0.20 0.00];[0.60 0.72 0.00];[0.30 0.55 0.60]];

  fid = fopen('AlDataEp0.dat', 'w');
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
  set(fig10,'Position',[182 150 1131 813]);
%   set(fig10,'Position',[0 0 1131 813]);
 
  sig0 = [275 240 235 255 220 175 100 25];

  load SigEpsEp000057s77KOga.dat.raw
  dat = SigEpsEp000057s77KOga;
  
  
  delT = 10;
  epdot = 5.7e-4;
  T = 77.0;
  epmax = max(dat(:,5));
  p1 = adiMTS(epdot, T, delT, epmax, dat, marker(1,:), color(1,:));
  
  load SigEpsEp000057s201KOga.dat.raw
  dat = SigEpsEp000057s201KOga;
  
  
  delT = 10;
  epdot = 5.7e-4;
  T = 201.0;
  epmax = max(dat(:,5));
  p2 = adiMTS(epdot, T, delT, epmax, dat, marker(2,:), color(2,:));
  
  load SigEpsEp000057s289KOga.dat.raw
  dat = SigEpsEp000057s289KOga;
  

  delT = 10;
  epdot = 5.7e-4;
  T = 289.0;
  epmax = max(dat(:,5));
  p3 = adiMTS(epdot, T, delT, epmax, dat, marker(3,:), color(3,:));
  
  load SigEpsEp0000048s297KHog.dat.raw
  dat = SigEpsEp0000048s297KHog;


  delT = 10;
  epdot = 4.8e-5;
  T = 297.0;
  epmax = max(dat(:,5));
  p4 = adiMTS(epdot, T, delT, epmax, dat, marker(4,:), color(4,:));
  
  load SigEpsEp000057s373KOga.dat.raw
  dat = SigEpsEp000057s373KOga;

  
  delT = 10;
  epdot = 5.7e-4;
  T = 373.0;
  epmax = max(dat(:,5));
  p5 = adiMTS(epdot, T, delT, epmax, dat, marker(5,:), color(5,:));

  load SigEpsEp000057s473KOga.dat.raw
  dat = SigEpsEp000057s473KOga;


  delT = 10;
  epdot = 5.7e-4;
  T = 473.0;
  epmax = max(dat(:,5));
  p6 = adiMTS(epdot, T, delT, epmax, dat, marker(6,:), color(6,:));
  
  load SigEpsEp0000010s533KHog.dat.raw
  dat = SigEpsEp0000010s533KHog;


  delT = 10;
  epdot = 5.7e-4;
  T = 533.0;
  epmax = max(dat(:,5));
  p7 = adiMTS(epdot, T, delT, epmax, dat, marker(7,:), color(7,:));
  
  load SigEpsEp0000010s644KHog.dat.raw
  dat = SigEpsEp0000010s644KHog;

  
  delT = 10;
  epdot = 5.7e-4;
  T = 644.0;
  epmax = max(dat(:,5));
  p8 = adiMTS(epdot, T, delT, epmax, dat, marker(8,:), color(8,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'YLim',[-100 100]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('% Error = (Sim. / Expt.-1)x100 ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 150 1131 813]);

  sig0 = [310 300 300 281 255 230 280 270 188 250 130 145];

  load SigEpsEp0001s294KEle.dat.raw
  dat = SigEpsEp0001s294KEle;
  
  
  delT = 5;
  epdot = 2.0e-3;
  T = 294.0;
  epmax = max(dat(:,5));
  p1 = adiMTS(epdot, T, delT, epmax, dat, marker(1,:), color(1,:));

  load SigEpsEp0001s295KFis.dat.raw
  dat = SigEpsEp0001s295KFis;

  
  delT = 5;
  epdot = 1.0e-3;
  T = 295.0;
  epmax = max(dat(:,5));
  p2 = adiMTS(epdot, T, delT, epmax, dat, marker(2,:), color(2,:));

  load SigEpsEp0001s298KCad.dat.raw
  dat = SigEpsEp0001s298KCad;

  
  delT = 5;
  epdot = 1.0e-3;
  T = 298.0;
  epmax = max(dat(:,5));
  p3 = adiMTS(epdot, T, delT, epmax, dat, marker(3,:), color(3,:));
  
  

  load SigEpsEp0001s300K01MPaDav.dat.raw
  dat = SigEpsEp0001s300K01MPaDav;

  
  delT = 5;
  epdot = 1.0e-3;
  T = 300.0;
  epmax = max(dat(:,5));
  p4 = adiMTS(epdot, T, delT, epmax, dat, marker(4,:), color(4,:));

  load SigEpsEp0001s367K01MPaDav.dat.raw
  dat = SigEpsEp0001s367K01MPaDav;

  
  delT = 5;
  epdot = 1.0e-3;
  T = 367.0;
  epmax = max(dat(:,5));
  p5 = adiMTS(epdot, T, delT, epmax, dat, marker(5,:), color(5,:));

  load SigEpsEp0001s422K01MPaDav.dat.raw
  dat = SigEpsEp0001s422K01MPaDav;

  
  delT = 5;
  epdot = 1.0e-3;
  T = 422.0;
  epmax = max(dat(:,5));
  p6 = adiMTS(epdot, T, delT, epmax, dat, marker(6,:), color(6,:));

  load SigEpsEp0001s422KEle.dat.raw
  dat = SigEpsEp0001s422KEle;

  
  delT = 5;
  epdot = 1.0e-3;
  T = 422.0;
  epmax = max(dat(:,5));
  p7 = adiMTS(epdot, T, delT, epmax, dat, marker(7,:), color(7,:));

  load SigEpsEp0001s422KGre.dat.raw
  dat = SigEpsEp0001s422KGre;
  
  
  delT = 5;
  epdot = 1.0e-3;
  T = 422.0;
  epmax = max(dat(:,5));
  p8 = adiMTS(epdot, T, delT, epmax, dat, marker(8,:), color(8,:));

  load SigEpsEp0001s478K01MPaDav.dat.raw
  dat = SigEpsEp0001s478K01MPaDav;

  
  delT = 5;
  epdot = 1.0e-3;
  T = 478.0;
  epmax = max(dat(:,5));
  p9 = adiMTS(epdot, T, delT, epmax, dat, marker(9,:), color(9,:));

  load SigEpsEp0001s478KEle.dat.raw
  dat = SigEpsEp0001s478KEle;

  
  delT = 5;
  epdot = 1.0e-3;
  T = 478.0;
  epmax = max(dat(:,5));
  p10 = adiMTS(epdot, T, delT, epmax, dat, marker(10,:), color(10,:));

  load SigEpsEp0001s561KEle.dat.raw
  dat = SigEpsEp0001s561KEle;

  
  delT = 5;
  epdot = 1.0e-3;
  T = 561.0;
  epmax = max(dat(:,5));
  p11 = adiMTS(epdot, T, delT, epmax, dat, marker(11,:), color(11,:));

  load SigEpsEp0001s589KGre.dat.raw
  dat = SigEpsEp0001s589KGre;

  
  delT = 5;
  epdot = 1.0e-3;
  T = 589.0;
  epmax = max(dat(:,5));
  p12 = adiMTS(epdot, T, delT, epmax, dat, marker(12,:), color(12,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'YLim',[-100 100]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('% Error = (Sim. / Expt.-1)x100 ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 150 1131 813]);

  sig0 = [305 265 250 230 280 210 240 140 120 55 30];

  load SigEpsEp0002s295KGre.dat.raw
  dat = SigEpsEp0002s295KGre;

  
  delT = 0.3;
  epdot = 2.0e-3;
  T = 295.0;
  epmax = max(dat(:,5));
  p1 = adiMTS(epdot, T, delT, epmax, dat, marker(1,:), color(1,:));
  
  load SigEpsEp0002s298KASM.dat.raw
  dat = SigEpsEp0002s298KASM;

  
  delT = 0.3;
  epdot = 2.0e-3;
  T = 298.0;
  epmax = max(dat(:,5));
  p2 = adiMTS(epdot, T, delT, epmax, dat, marker(2,:), color(2,:));

  load SigEpsEp0002s373KASM.dat.raw
  dat = SigEpsEp0002s373KASM;

  
  delT = 0.3;
  epdot = 2.0e-3;
  T = 373.0;
  epmax = max(dat(:,5));
  p3 = adiMTS(epdot, T, delT, epmax, dat, marker(3,:), color(3,:));
  
  load SigEpsEp0002s422KASM.dat.raw
  dat = SigEpsEp0002s422KASM;

  
  delT = 0.3;
  epdot = 2.0e-3;
  T = 422.0;
  epmax = max(dat(:,5));
  p4 = adiMTS(epdot, T, delT, epmax, dat, marker(4,:), color(4,:));

  load SigEpsEp0002s422KEle.dat.raw
  dat = SigEpsEp0002s422KEle;

  
  delT = 0.3;
  epdot = 2.0e-3;
  T = 422.0;
  epmax = max(dat(:,5));
  p5 = adiMTS(epdot, T, delT, epmax, dat, marker(5,:), color(5,:));

  load SigEpsEp0002s477KASM.dat.raw
  dat = SigEpsEp0002s477KASM;

  
  delT = 0.3;
  epdot = 2.0e-3;
  T = 477.0;
  epmax = max(dat(:,5));
  p6 = adiMTS(epdot, T, delT, epmax, dat, marker(6,:), color(6,:));

  load SigEpsEp0002s478KEle.dat.raw
  dat = SigEpsEp0002s478KEle;

  
  delT = 0.3;
  epdot = 2.0e-3;
  T = 478.0;
  epmax = max(dat(:,5));
  p7 = adiMTS(epdot, T, delT, epmax, dat, marker(7,:), color(7,:));

  load SigEpsEp0002s535KASM.dat.raw
  dat = SigEpsEp0002s535KASM;

  
  delT = 0.3;
  epdot = 2.0e-3;
  T = 535.0;
  epmax = max(dat(:,5));
  p8 = adiMTS(epdot, T, delT, epmax, dat, marker(8,:), color(8,:));

  load SigEpsEp0002s561KEle.dat.raw
  dat = SigEpsEp0002s561KEle;

  
  delT = 0.3;
  epdot = 2.0e-3;
  T = 561.0;
  epmax = max(dat(:,5));
  p9 = adiMTS(epdot, T, delT, epmax, dat, marker(9,:), color(9,:));

  load SigEpsEp0002s589KASM.dat.raw
  dat = SigEpsEp0002s589KASM;

  
  delT = 0.3;
  epdot = 2.0e-3;
  T = 589.0;
  epmax = max(dat(:,5));
  p10 = adiMTS(epdot, T, delT, epmax, dat, marker(10,:), color(10,:));

  load SigEpsEp0002s644KASM.dat.raw
  dat = SigEpsEp0002s644KASM;

  
  delT = 0.3;
  epdot = 2.0e-3;
  T = 644.0;
  epmax = max(dat(:,5));
  p11 = adiMTS(epdot, T, delT, epmax, dat, marker(11,:), color(11,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'YLim',[-100 100]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('% Error = (Sim. / Expt.-1)x100 ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 150 1131 813]);

  sig0 = [280 288 253 131 143 151 160];

  load SigEpsEp002s422KEle.dat.raw
  dat = SigEpsEp002s422KEle;

  
  delT = 3.5e-2;
  epdot = 2.0e-2;
  T = 422.0;
  epmax = max(dat(:,5));
  p1 = adiMTS(epdot, T, delT, epmax, dat, marker(1,:), color(1,:));

  load SigEpsEp0085s422KEle.dat.raw
  dat = SigEpsEp0085s422KEle;

  
  delT = 3.5e-2;
  epdot = 8.5e-2;
  T = 422.0;
  epmax = max(dat(:,5));
  p2 = adiMTS(epdot, T, delT, epmax, dat, marker(2,:), color(2,:));

  load SigEpsEp005s478KEle.dat.raw
  dat = SigEpsEp005s478KEle;

  
  delT = 3.5e-2;
  epdot = 5.0e-2;
  T = 478.0;
  epmax = max(dat(:,5));
  p3 = adiMTS(epdot, T, delT, epmax, dat, marker(3,:), color(3,:));

  load SigEpsEp002s561KEle.dat.raw
  dat = SigEpsEp002s561KEle;

  
  delT = 3.5e-2;
  epdot = 2.0e-2;
  T = 561.0;
  epmax = max(dat(:,5));
  p4 = adiMTS(epdot, T, delT, epmax, dat, marker(4,:), color(4,:));

  load SigEpsEp006s561KEle.dat.raw
  dat = SigEpsEp006s561KEle;

  
  delT = 3.5e-2;
  epdot = 6.0e-2;
  T = 561.0;
  epmax = max(dat(:,5));
  p5 = adiMTS(epdot, T, delT, epmax, dat, marker(5,:), color(5,:));

  load SigEpsEp0085s561KEle.dat.raw
  dat = SigEpsEp0085s561KEle;

  
  delT = 3.5e-2;
  epdot = 8.5e-2;
  T = 561.0;
  epmax = max(dat(:,5));
  p6 = adiMTS(epdot, T, delT, epmax, dat, marker(6,:), color(6,:));

  load SigEpsEp015s561KEle.dat.raw
  dat = SigEpsEp015s561KEle;

  
  delT = 0.03;
  epdot = 15.0e-2;
  T = 561.0;
  epmax = max(dat(:,5));
  p7 = adiMTS(epdot, T, delT, epmax, dat, marker(7,:), color(7,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'YLim',[-100 100]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('% Error = (Sim. / Expt.-1)x100 ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 150 1131 813]);

  sig0 = [286 263 165 165];

  load SigEpsEp11s422KEle.dat.raw
  dat = SigEpsEp11s422KEle;
  
  
  delT = 6.4e-4;
  epdot = 1.1;
  T = 422.0;
  epmax = max(dat(:,5));
  p1 = adiMTS(epdot, T, delT, epmax, dat, marker(1,:), color(1,:));

  load SigEpsEp075s478KEle.dat.raw
  dat = SigEpsEp075s478KEle;

  
  delT = 6.4e-4;
  epdot = 0.75;
  T = 478.0;
  epmax = max(dat(:,5));
  p2 = adiMTS(epdot, T, delT, epmax, dat, marker(2,:), color(2,:));

  load SigEpsEp070s561KEle.dat.raw
  dat = SigEpsEp070s561KEle;

  
  delT = 6.4e-4;
  epdot = 0.70;
  T = 561.0;
  epmax = max(dat(:,5));
  p3 = adiMTS(epdot, T, delT, epmax, dat, marker(3,:), color(3,:));

  load SigEpsEp12s561KEle.dat.raw
  dat = SigEpsEp12s561KEle;

  
  delT = 6.4e-4;
  epdot = 1.20;
  T = 561.0;
  epmax = max(dat(:,5));
  p4 = adiMTS(epdot, T, delT, epmax, dat, marker(4,:), color(4,:));
  
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'YLim',[-100 100]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('% Error = (Sim. / Expt.-1)x100 ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 150 1131 813]);

  sig0 = [280 295 263 190];

  load SigEpsEp85s422KEle.dat.raw
  dat = SigEpsEp85s422KEle;

  
  delT = 8e-4;
  epdot = 8.5;
  T = 422.0;
  epmax = max(dat(:,5));
  p1 = adiMTS(epdot, T, delT, epmax, dat, marker(1,:), color(1,:));
  
  load SigEpsEp9s422KGre.dat.raw
  dat = SigEpsEp9s422KGre;

  
  delT = 8.0e-4
  epdot = 9;
  T = 422.0;
  epmax = max(dat(:,5));
  p2 = adiMTS(epdot, T, delT, epmax, dat, marker(2,:), color(2,:));


  load SigEpsEp5s478KEle.dat.raw
  dat = SigEpsEp5s478KEle;

  
  delT = 8.0e-4
  epdot = 9.0;
  T = 478.0;
  epmax = max(dat(:,5));
  p3 = adiMTS(epdot, T, delT, epmax, dat, marker(3,:), color(3,:));

  load SigEpsEp10s589KGre.dat.raw
  dat = SigEpsEp10s589KGre;

  
  delT = 8.0e-4
  epdot = 10.0
  T = 589.0;
  epmax = max(dat(:,5));
  p4 = adiMTS(epdot, T, delT, epmax, dat, marker(4,:), color(4,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'YLim',[-100 100]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('% Error = (Sim. / Expt.-1)x100 ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 150 1131 813]);

  sig0 = [308 295 288 270 208 170];

  load SigEpsEp18s295KGre.dat.raw
  dat = SigEpsEp18s295KGre;

  
  delT = 5.0e-5
  epdot = 18.0
  T = 295.0;
  epmax = max(dat(:,5));
  p1 = adiMTS(epdot, T, delT, epmax, dat, marker(1,:), color(1,:));

  load SigEpsEp28s297KHog.dat.raw
  dat = SigEpsEp28s297KHog;

  
  delT = 5.0e-5
  epdot = 28.0
  T = 297.0;
  epmax = max(dat(:,5));
  p2 = adiMTS(epdot, T, delT, epmax, dat, marker(2,:), color(2,:));

  load SigEpsEp30s422KEle.dat.raw
  dat = SigEpsEp30s422KEle;

  
  delT = 5.0e-5
  epdot = 30.0
  T = 422.0;
  epmax = max(dat(:,5));
  p3 = adiMTS(epdot, T, delT, epmax, dat, marker(3,:), color(3,:));

  load SigEpsEp30s478KEle.dat.raw
  dat = SigEpsEp30s478KEle;

  
  delT = 5.0e-5
  epdot = 30.0
  T = 478.0;
  epmax = max(dat(:,5));
  p4 = adiMTS(epdot, T, delT, epmax, dat, marker(4,:), color(4,:));

  load SigEpsEp18s533KHog.dat.raw
  dat = SigEpsEp18s533KHog;

  
  delT = 5.0e-5
  epdot = 18.0
  T = 533.0;
  epmax = max(dat(:,5));
  p5 = adiMTS(epdot, T, delT, epmax, dat, marker(5,:), color(5,:));

  load SigEpsEp23s644KHog.dat.raw
  dat = SigEpsEp23s644KHog;

  
  delT = 5.0e-5
  epdot = 23.0
  T = 644.0;
  epmax = max(dat(:,5));
  p6 = adiMTS(epdot, T, delT, epmax, dat, marker(6,:), color(6,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'YLim',[-100 100]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('% Error = (Sim. / Expt.-1)x100 ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 150 1131 813]);

  sig0 = [320 170 205];

  load SigEpsEp65s297KHog.dat.raw
  dat = SigEpsEp65s297KHog;

  
  delT = 8.0e-6;
  epdot = 65.0;
  T = 297.0;
  epmax = max(dat(:,5));
  p1 = adiMTS(epdot, T, delT, epmax, dat, marker(1,:), color(1,:));

  load SigEpsEp50s561KEle.dat.raw
  dat = SigEpsEp50s561KEle;

  
  delT = 8.0e-6;
  epdot = 50.0;
  T = 561.0;
  epmax = max(dat(:,5));
  p2 = adiMTS(epdot, T, delT, epmax, dat, marker(2,:), color(2,:));

  load SigEpsEp54s644KHog.dat.raw
  dat = SigEpsEp54s644KHog;

  
  delT = 8.0e-6;
  epdot = 54.0;
  T = 644.0;
  epmax = max(dat(:,5));
  p3 = adiMTS(epdot, T, delT, epmax, dat, marker(3,:), color(3,:));
  
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'YLim',[-100 100]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('% Error = (Sim. / Expt.-1)x100 ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p1 p2 p3], ...
         '297 K 65/s (Hoge)', ...
         '561 K 50/s (Green)', ...
         '533 K 54/s (Hoge)');
  %axis square;
  grid on;

%====================================================================
%
% Load experimental data for strain rate of 350.0/s
%
function plot350Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 150 1131 813]);

  sig0 = [263 310 275];

  load SigEpsEp380s298KYad.dat.raw
  dat = SigEpsEp380s298KYad;

  
  delT = 5e-6;
  epdot = 380.0;
  T = 298.0;
  epmax = max(dat(:,5));
  p1 = adiMTS(epdot, T, delT, epmax, dat, marker(1,:), color(1,:));

  load SigEpsEp500s298KYad.dat.raw
  dat = SigEpsEp500s298KYad;

  
  delT = 5.0e-6;
  epdot = 500.0;
  T = 298.0;
  epmax = max(dat(:,5));
  p2 = adiMTS(epdot, T, delT, epmax, dat, marker(2,:), color(2,:));

  load SigEpsEp130s533KHog.dat.raw
  dat = SigEpsEp130s533KHog;

  
  delT = 5.0e-6;
  epdot = 130.0;
  T = 533.0;
  epmax = max(dat(:,5));
  p3 = adiMTS(epdot, T, delT, epmax, dat, marker(3,:), color(3,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'YLim',[-100 100]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('% Error = (Sim. / Expt.-1)x100 ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 150 1131 813]);

  sig0 = [305 325 300 290 220 275 276 180 180 70];

  load SigEpsEp1000s294KEle.dat.raw
  dat = SigEpsEp1000s294KEle;

  
  delT = 28.00e-7;
  epdot = 1000.0;
  T = 294.0;
  epmax = max(dat(:,5));
  p1 = adiMTS(epdot, T, delT, epmax, dat, marker(1,:), color(1,:));

  load SigEpsEp1000s298KLee.dat.raw
  dat = SigEpsEp1000s298KLee;

  
  delT = 28.00e-7;
  epdot = 1000.0;
  T = 298.0;
  epmax = max(dat(:,5));
  p2 = adiMTS(epdot, T, delT, epmax, dat, marker(2,:), color(2,:));

  load SigEpsEp1000s298KRos.dat.raw
  dat = SigEpsEp1000s298KRos;

  
  delT = 28.00e-7;
  epdot = 1000.0;
  T = 298.0;
  epmax = max(dat(:,5));
  p3 = adiMTS(epdot, T, delT, epmax, dat, marker(3,:), color(3,:));
  
  

  load SigEpsEp1000s422KEle.dat.raw
  dat = SigEpsEp1000s422KEle;

  
  delT = 28.00e-7;
  epdot = 1000.0;
  T = 422.0;
  epmax = max(dat(:,5));
  p4 = adiMTS(epdot, T, delT, epmax, dat, marker(4,:), color(4,:));
  
  

  load SigEpsEp1000s463KRos.dat.raw
  dat = SigEpsEp1000s463KRos;

  
  delT = 28.00e-7;
  epdot = 1000.0;
  T = 463.0;
  epmax = max(dat(:,5));
  p5 = adiMTS(epdot, T, delT, epmax, dat, marker(5,:), color(5,:));
  

  load SigEpsEp900s478KEle.dat.raw
  dat = SigEpsEp900s478KEle;

  
  delT = 28.00e-7;
  epdot = 900.0;
  T = 478.0;
  epmax = max(dat(:,5));
  p6 = adiMTS(epdot, T, delT, epmax, dat, marker(6,:), color(6,:));
  

  load SigEpsEp1000s478KEle.dat.raw
  dat = SigEpsEp1000s478KEle;

  
  delT = 28.00e-7;
  epdot = 1000.0;
  T = 478.0;
  epmax = max(dat(:,5));
  p7 = adiMTS(epdot, T, delT, epmax, dat, marker(7,:), color(7,:));
  

  load SigEpsEp1000s561KEle.dat.raw
  dat = SigEpsEp1000s561KEle;

  
  delT = 28.00e-7;
  epdot = 1000.0;
  T = 561.0;
  epmax = max(dat(:,5));
  p8 = adiMTS(epdot, T, delT, epmax, dat, marker(8,:), color(8,:));
  

  load SigEpsEp1150s561KEle.dat.raw
  dat = SigEpsEp1150s561KEle;

  
  delT = 28.00e-7;
  epdot = 1150.0;
  T = 561.0;
  epmax = max(dat(:,5));
  p9 = adiMTS(epdot, T, delT, epmax, dat, marker(9,:), color(9,:));

  load SigEpsEp1000s618KRos.dat.raw
  dat = SigEpsEp1000s618KRos;

  
  delT = 28.00e-7;
  epdot = 1000.0;
  T = 618.0;
  epmax = max(dat(:,5));
  p10 = adiMTS(epdot, T, delT, epmax, dat, marker(10,:), color(10,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'YLim',[-100 100]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('% Error = (Sim. / Expt.-1)x100 ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 150 1131 813]);

  sig0 = [325 270 260 315 340 310 240 230];

  load SigEpsEp1500s77KOga.dat.raw
  dat = SigEpsEp1500s77KOga;

  
  delT = 28.00e-7;
  epdot = 1500.0;
  T = 77.0;
  epmax = max(dat(:,5));
  p1 = adiMTS(epdot, T, delT, epmax, dat, marker(1,:), color(1,:));

  load SigEpsEp1500s201KOga.dat.raw
  dat = SigEpsEp1500s201KOga;

  
  delT = 28.00e-7;
  epdot = 1500.0;
  T = 201.0;
  epmax = max(dat(:,5));
  p2 = adiMTS(epdot, T, delT, epmax, dat, marker(2,:), color(2,:));
  

  load SigEpsEp1500s289KOga.dat.raw
  dat = SigEpsEp1500s289KOga;

  
  delT = 28.00e-7;
  epdot = 1500.0;
  T = 289.0;
  epmax = max(dat(:,5));
  p3 = adiMTS(epdot, T, delT, epmax, dat, marker(3,:), color(3,:));

  load SigEpsEp2500s295KFis.dat.raw
  dat = SigEpsEp2500s295KFis;

  
  delT = 28.00e-7;
  epdot = 2500.0;
  T = 295.0;
  epmax = max(dat(:,5));
  p4 = adiMTS(epdot, T, delT, epmax, dat, marker(4,:), color(4,:));

  load SigEpsEp2000s298KLee.dat.raw
  dat = SigEpsEp2000s298KLee;

  
  delT = 28.00e-7;
  epdot = 2000.0;
  T = 298.0;
  epmax = max(dat(:,5));
  p5 = adiMTS(epdot, T, delT, epmax, dat, marker(5,:), color(5,:));

  load SigEpsEp2000s298KYad.dat.raw
  dat = SigEpsEp2000s298KYad;

  
  delT = 28.00e-7;
  epdot = 2000.0;
  T = 298.0;
  epmax = max(dat(:,5));
  p6 = adiMTS(epdot, T, delT, epmax, dat, marker(6,:), color(6,:));
  

  load SigEpsEp1500s373KOga.dat.raw
  dat = SigEpsEp1500s373KOga;

  
  delT = 28.00e-7;
  epdot = 1500.0;
  T = 373.0;
  epmax = max(dat(:,5));
  p7 = adiMTS(epdot, T, delT, epmax, dat, marker(7,:), color(7,:));
  

  load SigEpsEp1500s473KOga.dat.raw
  dat = SigEpsEp1500s473KOga;

  
  delT = 28.00e-7;
  epdot = 1500.0;
  T = 473.0;
  epmax = max(dat(:,5));
  p8 = adiMTS(epdot, T, delT, epmax, dat, marker(8,:), color(8,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'YLim',[-100 100]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('% Error = (Sim. / Expt.-1)x100 ', 'FontName', 'bookman', 'FontSize', 16);
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
  set(fig10,'Position',[182 150 1131 813]);

  sig0 = [347 340 350 360 345 370 355];

  load SigEpsEp3000s298KLee.dat.raw
  dat = SigEpsEp3000s298KLee;

  
  delT = 28.00e-7;
  epdot = 3000.0;
  T = 298.0;
  epmax = max(dat(:,5));
  p1 = adiMTS(epdot, T, delT, epmax, dat, marker(1,:), color(1,:));

  load SigEpsEp3600s298KYad.dat.raw
  dat = SigEpsEp3600s298KYad;

  
  delT = 28.00e-7;
  epdot = 3600.0;
  T = 298.0;
  epmax = max(dat(:,5));
  p2 = adiMTS(epdot, T, delT, epmax, dat, marker(2,:), color(2,:));
  

  load SigEpsEp4000s298KCad.dat.raw
  dat = SigEpsEp4000s298KCad;

  
  delT = 28.00e-7;
  epdot = 4000.0;
  T = 298.0;
  epmax = max(dat(:,5));
  p3 = adiMTS(epdot, T, delT, epmax, dat, marker(3,:), color(3,:));
  

  load SigEpsEp4000s298KLee.dat.raw
  dat = SigEpsEp4000s298KLee;

  
  delT = 28.00e-7;
  epdot = 4000.0;
  T = 298.0;
  epmax = max(dat(:,5));
  p4 = adiMTS(epdot, T, delT, epmax, dat, marker(4,:), color(4,:));
  

  load SigEpsEp4000s298KLes.dat.raw
  dat = SigEpsEp4000s298KLes;

  
  delT = 28.00e-7;
  epdot = 4000.0;
  T = 298.0;
  epmax = max(dat(:,5));
  p5 = adiMTS(epdot, T, delT, epmax, dat, marker(5,:), color(5,:));
  

  load SigEpsEp8000s298KLes.dat.raw
  dat = SigEpsEp8000s298KLes;

  
  delT = 28.00e-7;
  epdot = 8000.0;
  T = 298.0;
  epmax = max(dat(:,5));
  p6 = adiMTS(epdot, T, delT, epmax, dat, marker(6,:), color(6,:));
  

  load SigEpsEp29000s298KRam.dat.raw
  dat = SigEpsEp29000s298KRam;

  
  delT = 28.00e-7;
  epdot = 29000.0;
  T = 298.0;
  epmax = max(dat(:,5));
  p7 = adiMTS(epdot, T, delT, epmax, dat, marker(7,:), color(7,:));
  

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'YLim',[-100 100]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('% Error = (Sim. / Expt.-1)x100 ', 'FontName', 'bookman', 'FontSize', 16);
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
function [p] = plotSigEp(dat, marker, color, fid, sig0)

  P = dat(1,1);
  T = dat(1,2);
  edot = dat(1,3);
  epEx = dat(:,5);
  seqEx = dat(:,6);
%   p = plot(epEx, seqEx, 'p-', 'LineWidth', 2); hold on;
%   set(p,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);

  ep = 0.0;
%   p1 = plot(ep, sig0,'x','MarkerSize', 13, 'LineWidth', 2);
%   set(p1, 'Color', color);
%   fprintf(fid, '%g %g %g %g %g %g\n', ep, edot, T, P, ep, sig0);
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
  
function [p] = adiMTS(epdot, T0, delT, epmax, dat, marker, color)

  rho0 = 2700.0;
  rhomax = 2720.0;
  tmax = epmax/epdot;
  m = tmax/delT;
  if m < 1
      epdot
      T0
      delT
      epmax
      m
      tmax
  end
  delrho = (rhomax - rho0)/m;
  rho = rho0+0.1;
  T = T0;
  epEx = dat(:,5);
  seqEx = dat(:,6);
  [n,m] = size(epEx)
  for i=1:n
    sigSim(i) = MTS(epdot, epEx(i), T, T0, rho, rho0)/1.0e6;
    PerError(i) = 100*(sigSim(i) - seqEx(i))/seqEx(i);
    Cp = calcCp(T);
    fac = 0.9/(rho*Cp);
    T = T + sigSim(i)*epdot*fac*delT; 
%     rho = rho + delrho;
  end
  
p  = plot(epEx, PerError, 'k-.', 'LineWidth', 2); hold on;
set(p,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);
% set(p,'LineWidth',3,'Color',color);

%
% Get MTS yield stress
%
function [sigy] = MTS(epdot, ep, T, T0, rho, rho0)

  %
  % Compute mu_0 (value of mu at T = 0)
  %
  P = calcP(rho, rho0, 0, 0);
  Tm = calcTm(rho, rho0);
  mu_0 = calcmu(rho, rho0, Tm, P, 0);
  format short e
%   getmu0 = [mu_0 P Tm]

  %
  % Compute mu
  %
  P = calcP(rho, rho0, T, T0);
  Tm = calcTm(rho, rho0);
  mu = calcmu(rho, rho0, Tm, P, T);
%   getmu = [mu P Tm]

  %
  % Get sigma_es0 and g_0es
  %
  %load sigma0esG0es.dat
  %sigma_es0 = sigma0esG0es(1)/1.0e6;
  %g_0es = sigma0esG0es(2);
  sigma_es0 = 1.842e8;
  g_0es = 0.562784;
  
  %
  % Compute sigma_es
  %
  edot_0es = 1.0e13;
  b = 2.86e-10;
  kappa = 1.3806503e-23;
  sigma_es = sigma_es0*(epdot/edot_0es)^(kappa*T/(mu*b^3*g_0es));
%   getsigma_es = [sigma_es sigma_es0 g_0es edot_0es epdot  T mu]

  %
  % Get theta_0 
  %
  theta_0 = getTheta0(T0); 
  theta_1 = getTheta1(T0);
 

  %
  % Compute sigma_e
  %
  sigma_e = computeSigma_e(theta_0, sigma_es, ep, theta_1);
%   getsigma_e = [sigma_e theta_0 ep]

  %
  % Compute s_e
  %
  g_0e = 1.6;
  epdot_0e = 1.0e9;
  p_e = 0.75;
  q_e = 1.0;


  fac_e = (kappa*T/(mu*b^3*g_0e)*log(epdot_0e/epdot))^(1/q_e);
  s_e = (1.0 - fac_e)^(1/p_e);
  if (fac_e > 1.0) 
    ff_e = [mu T epdot fac_e]
    s_e = 0.0;
  else
    s_e = (1.0 - fac_e)^(1/p_e);
  end
%   gets_e = [s_e fac_e g_0e epdot_0e p_e q_e]
  %
  % Get sigma_i and g_0i
  %
  %load sigmaIg0i.dat
  %sigma_i = sigmaIg0i(1);
  %g_0i = sigmaIg0i(2);
  
  sigma_i = 444.5e6;
  g_0i = 0.91;
  %
  % Compute s_i
  %
  epdot_0i = 1.0e9;
  p_i = 0.75;
  q_i = 1.0;
  fac_i = (kappa*T/(mu*b^3*g_0i)*log(epdot_0i/epdot))^(1/q_i);
  if (fac_i > 1.0) 
    ff_i = [mu T epdot fac_i]
    s_i = 0.0;
  else
    s_i = (1.0 - fac_i)^(1/p_i);
  end

%   gets_i = [s_i fac_i g_0i sigma_i epdot_0i p_i q_i]
  %
  % Compute sigma/mu
  %
  sigma_a = 10.0e6;

  %
  % Compute sigma_y/mu
  %
  sigma_mu = sigma_a/mu + s_i*sigma_i/mu_0 + s_e*sigma_e/mu_0;

%   getsigma_mu =  [sigma_mu sigma_a sigma_i sigma_i s_i s_e mu_0 mu]
  %
  % Compute sigy
  %
  sigy = sigma_mu*mu;
  
%   getsigy = [sigy sigma_mu mu]
  %[sigy sigma_a s_i sigma_i s_e sigma_e mu mu_0]
  Test1 = 0;

%
% Integrate dsigma_e/dep
%
function [sigma_e] = computeSigma_e(theta_0, sigma_es, ep, theta_1)

  if (ep == 0)
    sigma_e = 0.0;
    return;
  end

  alpha = 2.0;
  sigma_e = 0;
  dep = ep/100;
  for i=1:101
    FX = tanh(alpha*sigma_e/sigma_es)/tanh(alpha);
    sigma_e = sigma_e + dep*(theta_0*(1.0-FX));
    if (sigma_e > sigma_es)
      sigma_e = sigma_es;
      break;
    end
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
  
%=================================================================== 
% Get theta0 
% 
function [theta_0] = getTheta0(T);
load theta0.dat;
theta_0 = theta0(2) + theta0(1)*T;
theta_0 = theta_0*1.0e6;
theta_0 = 7373.1e6

function [theta_1] = getTheta1(T);

theta_1 = 1386.76e6;