function fitVoceLines

  marker = ['o';'p';'v';'s';'d';'^';'h';'<';'x';'>';'+';'*'];
  color = [[0.90 0.10 0.10];[0.10 0.90 0.10];[0.10 0.10 0.90];...
           [0.75 0.25 1.00];[1.00 0.75 0.25];[0.15 0.30 0.70];...
           [0.30 0.50 0.80];[0.25 0.75 1.00];[0.66 0.60 0.00];...
           [0.60 0.20 0.00];[0.60 0.72 0.00];[0.30 0.55 0.60]];

  fid = fopen('AlDataTheta.dat','w');
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
 
  load ./SigeEpData/Theta000057s77KOga.dat;
  dat = Theta000057s77KOga;
  p1 = fitThetaFx(fid, dat, color(1,:), marker(1,:));

  load ./SigeEpData/Theta000057s201KOga.dat;
  dat = Theta000057s201KOga;
  p2 = fitThetaFx(fid, dat, color(2,:), marker(2,:));

  load ./SigeEpData/Theta000057s289KOga.dat;
  dat = Theta000057s289KOga;
  p3 = fitThetaFx(fid, dat, color(3,:), marker(3,:));

  load ./SigeEpData/Theta0000048s297KHog.dat;
  dat = Theta0000048s297KHog;
  p4 = fitThetaFx(fid, dat, color(4,:), marker(4,:));

  load ./SigeEpData/Theta000057s373KOga.dat;
  dat = Theta000057s373KOga;
  p5 = fitThetaFx(fid, dat, color(5,:), marker(5,:));

  load ./SigeEpData/Theta000057s473KOga.dat;
  dat = Theta000057s473KOga;
  p6 = fitThetaFx(fid, dat, color(6,:), marker(6,:));

  load ./SigeEpData/Theta0000010s533KHog.dat;
  dat = Theta0000010s533KHog;
  p7 = fitThetaFx(fid, dat, color(7,:), marker(7,:));

  load ./SigeEpData/Theta0000010s644KHog.dat;
  dat = Theta0000010s644KHog;
  p8 = fitThetaFx(fid, dat, color(8,:), marker(8,:));

  subplot(2,2,1);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,2);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,3);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  subplot(2,2,4);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  legend([p1 p2 p3 p4 p5 p6 p7 p8], ...
         '77 K 5.7e-4/s (Ogawa)', ...
         '201 K 5.7e-4/s (Ogawa)', ...
         '289 K 5.7e-4/s (Ogawa)', ...
         '297 K 4.8e-5/s (Hoge)', ...
         '373 K 5.7e-4/s (Ogawa)', ...
         '473 K 5.7e-4/s (Ogawa)', ...
         '533 K 1.0e-5/s (Hoge)', ...
         '644 K 1.0e-5/s (Hoge)','Location','Best');


%====================================================================
%
% Load experimental data for strain rate of 1.0e-3/s
%
function plot0001Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/Theta0001s294KEle.dat;
  dat = Theta0001s294KEle;
  p1 = fitThetaFx(fid, dat, color(1,:), marker(1,:));

  load ./SigeEpData/Theta0001s295KFis.dat;
  dat = Theta0001s295KFis;
  p2 = fitThetaFx(fid, dat, color(1,:), marker(2,:));

  load ./SigeEpData/Theta0001s298KCad.dat;
  dat = Theta0001s298KCad;
  p3 = fitThetaFx(fid, dat, color(1,:), marker(3,:));

  load ./SigeEpData/Theta0001s300K01MPaDav.dat;
  dat = Theta0001s300K01MPaDav;
  p4 = fitThetaFx(fid, dat, color(1,:), marker(4,:));

  load ./SigeEpData/Theta0001s367K01MPaDav.dat;
  dat = Theta0001s367K01MPaDav;
  p5 = fitThetaFx(fid, dat, color(5,:), marker(5,:));

  load ./SigeEpData/Theta0001s422K01MPaDav.dat;
  dat = Theta0001s422K01MPaDav;
  p6 = fitThetaFx(fid, dat, color(6,:), marker(6,:));

  load ./SigeEpData/Theta0001s422KEle.dat;
  dat = Theta0001s422KEle;
  p7 = fitThetaFx(fid, dat, color(6,:), marker(7,:));

  load ./SigeEpData/Theta0001s422KGre.dat;
  dat = Theta0001s422KGre;
  p8 = fitThetaFx(fid, dat, color(6,:), marker(8,:));

  load ./SigeEpData/Theta0001s478K01MPaDav.dat;
  dat = Theta0001s478K01MPaDav;
  p9 = fitThetaFx(fid, dat, color(9,:), marker(9,:));

  load ./SigeEpData/Theta0001s478KEle.dat;
  dat = Theta0001s478KEle;
  p10 = fitThetaFx(fid, dat, color(9,:), marker(10,:));

  load ./SigeEpData/Theta0001s561KEle.dat;
  dat = Theta0001s561KEle;
  p11 = fitThetaFx(fid, dat, color(11,:), marker(11,:));

  load ./SigeEpData/Theta0001s589KGre.dat;
  dat = Theta0001s589KGre;
  p12 = fitThetaFx(fid, dat, color(12,:), marker(12,:));

  subplot(2,2,1);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,2);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,3);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  subplot(2,2,4);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  subplot(2,2,1);
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

%====================================================================
%
% Load experimental data for strain rate of 2.0e-3/s
%
function plot0002Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/Theta0002s295KGre.dat;
  dat = Theta0002s295KGre;
  p1 = fitThetaFx(fid, dat, color(1,:), marker(1,:));

  load ./SigeEpData/Theta0002s298KASM.dat;
  dat = Theta0002s298KASM;
  p2 = fitThetaFx(fid, dat, color(1,:), marker(2,:));

  load ./SigeEpData/Theta0002s373KASM.dat;
  dat = Theta0002s373KASM;
  p3 = fitThetaFx(fid, dat, color(2,:), marker(3,:));

  load ./SigeEpData/Theta0002s422KASM.dat;
  dat = Theta0002s422KASM;
  p4 = fitThetaFx(fid, dat, color(3,:), marker(4,:));

  load ./SigeEpData/Theta0002s422KEle.dat;
  dat = Theta0002s422KEle;
  p5 = fitThetaFx(fid, dat, color(3,:), marker(5,:));

  load ./SigeEpData/Theta0002s477KASM.dat;
  dat = Theta0002s477KASM;
  p6 = fitThetaFx(fid, dat, color(4,:), marker(6,:));

  load ./SigeEpData/Theta0002s478KEle.dat;
  dat = Theta0002s478KEle;
  p7 = fitThetaFx(fid, dat, color(4,:), marker(7,:));

  load ./SigeEpData/Theta0002s535KASM.dat;
  dat = Theta0002s535KASM;
  p8 = fitThetaFx(fid, dat, color(5,:), marker(8,:));

  load ./SigeEpData/Theta0002s561KEle.dat;
  dat = Theta0002s561KEle;
  p9 = fitThetaFx(fid, dat, color(6,:), marker(9,:));

  load ./SigeEpData/Theta0002s589KASM.dat;
  dat = Theta0002s589KASM;
  p10 = fitThetaFx(fid, dat, color(7,:), marker(10,:));

  load ./SigeEpData/Theta0002s644KASM.dat;
  dat = Theta0002s644KASM;
  p11 = fitThetaFx(fid, dat, color(8,:), marker(11,:));

  subplot(2,2,1);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,2);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,3);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  subplot(2,2,4);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
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

%====================================================================
%
% Load experimental data for strain rate of 0.02 - 0.10 /s
%
function plot01Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/Theta002s422KEle.dat;
  dat = Theta002s422KEle;
  p1 = fitThetaFx(fid, dat, color(1,:), marker(1,:));

  load ./SigeEpData/Theta0085s422KEle.dat;
  dat = Theta0085s422KEle;
  p2 = fitThetaFx(fid, dat, color(1,:), marker(2,:));

  load ./SigeEpData/Theta005s478KEle.dat;
  dat = Theta005s478KEle;
  p3 = fitThetaFx(fid, dat, color(2,:), marker(3,:));

  load ./SigeEpData/Theta002s561KEle.dat;
  dat = Theta002s561KEle;
  p4 = fitThetaFx(fid, dat, color(3,:), marker(4,:));

  load ./SigeEpData/Theta006s561KEle.dat;
  dat = Theta006s561KEle;
  p5 = fitThetaFx(fid, dat, color(3,:), marker(5,:));

  load ./SigeEpData/Theta0085s561KEle.dat;
  dat = Theta0085s561KEle;
  p6 = fitThetaFx(fid, dat, color(3,:), marker(6,:));

  load ./SigeEpData/Theta015s561KEle.dat;
  dat = Theta015s561KEle;
  p7 = fitThetaFx(fid, dat, color(3,:), marker(7,:));

  subplot(2,2,1);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,2);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,3);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  subplot(2,2,4);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  legend([p1 p2 p3 p4 p5 p6 p7], ...
         '422 K 2.0e-2/s (Green)', ...
         '422 K 8.5e-2/s (Green)', ...
         '478 K 5.0e-2/s (Green)', ...
         '561 K 2.0e-2/s (Green)', ...
         '561 K 6.0e-2/s (Green)', ...
         '561 K 8.5e-2/s (Green)', ...
         '561 K 15.0e-2/s (Green)');

%====================================================================
%
% Load experimental data for strain rate of 1.0/s
%
function plot1Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/Theta11s422KEle.dat;
  dat = Theta11s422KEle;
  p1 = fitThetaFx(fid, dat, color(1,:), marker(1,:));

  load ./SigeEpData/Theta075s478KEle.dat;
  dat = Theta075s478KEle;
  p2 = fitThetaFx(fid, dat, color(2,:), marker(2,:));

  load ./SigeEpData/Theta070s561KEle.dat;
  dat = Theta070s561KEle;
  p3 = fitThetaFx(fid, dat, color(3,:), marker(3,:));

  load ./SigeEpData/Theta12s561KEle.dat;
  dat = Theta12s561KEle;
  p4 = fitThetaFx(fid, dat, color(3,:), marker(4,:));

  subplot(2,2,1);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,2);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,3);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  subplot(2,2,4);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  legend([p1 p2 p3 p4], ...
         '422 K 1.10/s (Green)', ...
         '478 K 0.75/s (Green)', ...
         '561 K 0.70/s (Green)', ...
         '561 K 1.20/s (Green)');

%====================================================================
%
% Load experimental data for strain rate of 10.0/s
%
function plot10Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/Theta85s422KEle.dat;
  dat = Theta85s422KEle;
  p1 = fitThetaFx(fid, dat, color(1,:), marker(1,:));

  load ./SigeEpData/Theta9s422KGre.dat;
  dat = Theta9s422KGre;
  p2 = fitThetaFx(fid, dat, color(1,:), marker(2,:));

  load ./SigeEpData/Theta5s478KEle.dat;
  dat = Theta5s478KEle;
  p3 = fitThetaFx(fid, dat, color(2,:), marker(3,:));

  load ./SigeEpData/Theta10s589KGre.dat;
  dat = Theta10s589KGre;
  p4 = fitThetaFx(fid, dat, color(3,:), marker(4,:));

  subplot(2,2,1);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,2);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,3);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  subplot(2,2,4);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  legend([p1 p2 p3 p4], ...
         '422 K 8.5/s (Green)', ...
         '422 K 9.0/s (Green)', ...
         '478 K 5.0/s (Green)', ...
         '589 K 10.0/s (Green)');

%====================================================================
%
% Load experimental data for strain rate of 25.0/s
%
function plot25Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/Theta18s295KGre.dat;
  dat = Theta18s295KGre;
  p1 = fitThetaFx(fid, dat, color(1,:), marker(1,:));

  load ./SigeEpData/Theta28s297KHog.dat;
  dat = Theta28s297KHog;
  p2 = fitThetaFx(fid, dat, color(1,:), marker(2,:));

  load ./SigeEpData/Theta30s422KEle.dat;
  dat = Theta30s422KEle;
  p3 = fitThetaFx(fid, dat, color(2,:), marker(3,:));

  load ./SigeEpData/Theta30s478KEle.dat;
  dat = Theta30s478KEle;
  p4 = fitThetaFx(fid, dat, color(3,:), marker(4,:));

  load ./SigeEpData/Theta18s533KHog.dat;
  dat = Theta18s533KHog;
  p5 = fitThetaFx(fid, dat, color(4,:), marker(5,:));

  load ./SigeEpData/Theta23s644KHog.dat;
  dat = Theta23s644KHog;
  p6 = fitThetaFx(fid, dat, color(5,:), marker(6,:));

  subplot(2,2,1);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,2);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,3);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  subplot(2,2,4);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  legend([p1 p2 p3 p4 p5 p6], ...
         '295 K 18/s (Green)', ...
         '297 K 28/s (Hoge)', ...
         '422 K 30/s (Green)', ...
         '478 K 30/s (Green)', ...
         '533 K 18/s (Hoge)', ...
         '644 K 23/s (Hoge)');

%====================================================================
%
% Load experimental data for strain rate of 55.0/s
%
function plot55Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/Theta65s297KHog.dat;
  dat = Theta65s297KHog;
  p1 = fitThetaFx(fid, dat, color(1,:), marker(1,:));

  load ./SigeEpData/Theta50s561KEle.dat;
  dat = Theta50s561KEle;
  p2 = fitThetaFx(fid, dat, color(2,:), marker(2,:));

  load ./SigeEpData/Theta54s644KHog.dat;
  dat = Theta54s644KHog;
  p3 = fitThetaFx(fid, dat, color(3,:), marker(3,:));

  subplot(2,2,1);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,2);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,3);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  subplot(2,2,4);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  legend([p1 p2 p3], ...
         '297 K 65/s (Hoge)', ...
         '561 K 50/s (Green)', ...
         '644 K 54/s (Hoge)');

%====================================================================
%
% Load experimental data for strain rate of 350.0/s
%
function plot350Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/Theta380s298KYad.dat;
  dat = Theta380s298KYad;
  p1 = fitThetaFx(fid, dat, color(1,:), marker(1,:));

  load ./SigeEpData/Theta500s298KYad.dat;
  dat = Theta500s298KYad;
  p2 = fitThetaFx(fid, dat, color(1,:), marker(2,:));

  load ./SigeEpData/Theta130s533KHog.dat;
  dat = Theta130s533KHog;
  p3 = fitThetaFx(fid, dat, color(2,:), marker(3,:));

  subplot(2,2,1);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,2);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,3);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  subplot(2,2,4);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  legend([p1 p2 p3], ...
         '298 K 380/s (Yadav)', ...
         '298 K 500/s (Yadav)', ...
         '533 K 130/s (Hoge)');

%====================================================================
%
% Load experimental data for strain rate of 1000.0/s
%
function plot1000Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/Theta1000s294KEle.dat;
  dat = Theta1000s294KEle;
  p1 = fitThetaFx(fid, dat, color(1,:), marker(1,:));

  load ./SigeEpData/Theta1000s298KLee.dat;
  dat = Theta1000s298KLee;
  p2 = fitThetaFx(fid, dat, color(1,:), marker(2,:));

  load ./SigeEpData/Theta1000s298KRos.dat;
  dat = Theta1000s298KRos;
  p3 = fitThetaFx(fid, dat, color(1,:), marker(3,:));

  load ./SigeEpData/Theta1000s422KEle.dat;
  dat = Theta1000s422KEle;
  p4 = fitThetaFx(fid, dat, color(2,:), marker(4,:));

  load ./SigeEpData/Theta1000s463KRos.dat;
  dat = Theta1000s463KRos;
  p5 = fitThetaFx(fid, dat, color(3,:), marker(5,:));

  load ./SigeEpData/Theta900s478KEle.dat;
  dat = Theta900s478KEle;
  p6 = fitThetaFx(fid, dat, color(4,:), marker(6,:));

  load ./SigeEpData/Theta1000s478KEle.dat;
  dat = Theta1000s478KEle;
  p7 = fitThetaFx(fid, dat, color(4,:), marker(7,:));

  load ./SigeEpData/Theta1000s561KEle.dat;
  dat = Theta1000s561KEle;
  p8 = fitThetaFx(fid, dat, color(5,:), marker(8,:));

  load ./SigeEpData/Theta1150s561KEle.dat;
  dat = Theta1150s561KEle;
  p9 = fitThetaFx(fid, dat, color(5,:), marker(9,:));

  load ./SigeEpData/Theta1000s618KRos.dat;
  dat = Theta1000s618KRos;
  p10 = fitThetaFx(fid, dat, color(6,:), marker(10,:));

  subplot(2,2,1);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,2);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,3);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  subplot(2,2,4);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
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

%====================================================================
%
% Load experimental data for strain rate of 2000.0/s
%
function plot2000Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/Theta1500s77KOga.dat;
  dat = Theta1500s77KOga;
  p1 = fitThetaFx(fid, dat, color(1,:), marker(1,:));

  load ./SigeEpData/Theta1500s201KOga.dat;
  dat = Theta1500s201KOga;
  p2 = fitThetaFx(fid, dat, color(2,:), marker(2,:));

  load ./SigeEpData/Theta1500s289KOga.dat;
  dat = Theta1500s289KOga;
  p3 = fitThetaFx(fid, dat, color(3,:), marker(3,:));

  load ./SigeEpData/Theta2500s295KFis.dat;
  dat = Theta2500s295KFis;
  p4 = fitThetaFx(fid, dat, color(4,:), marker(4,:));

  load ./SigeEpData/Theta2000s298KLee.dat;
  dat = Theta2000s298KLee;
  p5 = fitThetaFx(fid, dat, color(4,:), marker(5,:));

  load ./SigeEpData/Theta2000s298KYad.dat;
  dat = Theta2000s298KYad;
  p6 = fitThetaFx(fid, dat, color(4,:), marker(6,:));

  load ./SigeEpData/Theta1500s373KOga.dat;
  dat = Theta1500s373KOga;
  p7 = fitThetaFx(fid, dat, color(5,:), marker(7,:));

  load ./SigeEpData/Theta1500s473KOga.dat;
  dat = Theta1500s473KOga;
  p8 = fitThetaFx(fid, dat, color(6,:), marker(8,:));

  subplot(2,2,1);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,2);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,3);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  subplot(2,2,4);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  legend([p1 p2 p3 p4 p5 p6 p7 p8], ...
         '77 K 1500/s (Ogawa)', ...
         '201 K 1500/s (Ogawa)', ...
         '289 K 1500/s (Ogawa)', ...
         '295 K 2500/s (Fish)', ...
         '298 K 2000/s (Lee)', ...
         '298 K 2000/s (Yadav)', ...
         '373 K 1500/s (Ogawa)', ...
         '473 K 1500/s (Ogawa)');

%====================================================================
%
% Load experimental data for strain rate of 4000.0/s
%
function plot4000Edot(fid, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/Theta3000s298KLee.dat;
  dat = Theta3000s298KLee;
  p1 = fitThetaFx(fid, dat, color(1,:), marker(1,:));

  load ./SigeEpData/Theta3600s298KYad.dat;
  dat = Theta3600s298KYad;
  p2 = fitThetaFx(fid, dat, color(2,:), marker(2,:));

  load ./SigeEpData/Theta4000s298KCad.dat;
  dat = Theta4000s298KCad;
  p3 = fitThetaFx(fid, dat, color(3,:), marker(3,:));

  load ./SigeEpData/Theta4000s298KLee.dat;
  dat = Theta4000s298KLee;
  p4 = fitThetaFx(fid, dat, color(3,:), marker(4,:));

  load ./SigeEpData/Theta4000s298KLes.dat;
  dat = Theta4000s298KLes;
  p5 = fitThetaFx(fid, dat, color(3,:), marker(5,:));

  load ./SigeEpData/Theta8000s298KLes.dat;
  dat = Theta8000s298KLes;
  p6 = fitThetaFx(fid, dat, color(4,:), marker(6,:));

  load ./SigeEpData/Theta29000s298KRam.dat;
  dat = Theta29000s298KRam;
  p7 = fitThetaFx(fid, dat, color(5,:), marker(7,:));

  subplot(2,2,1);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,2);
  %set(gca, 'XLim',[0 250], 'YLim', [0 6000]);
  subplot(2,2,3);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  subplot(2,2,4);
  %set(gca, 'XLim',[0 0.3], 'YLim', [0 700]);
  legend([p1 p2 p3 p4 p5 p6 p7], ...
         '298 K 3000/s (Lee)', ...
         '298 K 3600/s (Yadav)', ...
         '298 K 4000/s (Cady)', ...
         '298 K 4000/s (Lee)', ...
         '298 K 4000/s (Lesuer)', ...
         '298 K 8000/s (Lesuer)', ...
         '298 K 29000/s (Ramesh)');

%=======================================================================
% Plot stress-strain curves 
% and write intersection point 
%
function [p1] = fitThetaFx(fid, dat, color, marker)

  %
  % Load theta_fx data
  %
  fx1 = dat(:,1);
  fx2 = dat(:,2);
  fx3 = dat(:,3);
  fx4 = dat(:,4);
  theta = dat(:,5);
  T = dat(:,6);
  edot = dat(1,7);
  T0 = dat(1,8);
  P = dat(1,9);
  Tmax = max(T);

  %
  % Fit straight lines to the data
  %
  if (length(theta) > 1)
    subplot(2,2,1);
    [p_1, theta0_1, theta1_1] = fitLine(fx1, theta, color, marker);
    subplot(2,2,2);
    [p_2, theta0_2, theta1_2] = fitLine(fx2, theta, color, marker);
    subplot(2,2,3);
    [p_3, theta0_3, theta1_3] = fitLine(fx3, theta, color, marker);
    subplot(2,2,4);
    [p_4, theta0_4, theta1_4] = fitLine(fx4, theta, color, marker);
  else
    theta0_1 = theta(1); theta1_1 = theta(1);
    theta0_2 = theta(1); theta1_2 = theta(1);
    theta0_3 = theta(1); theta1_3 = theta(1);
    theta0_4 = theta(1); theta1_4 = theta(1);
  end

  %
  % Plot data
  %
  subplot(2,2,1);
  p1 = plot(fx1, theta); hold on;
  set(p1,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim', [0 1]);
  xlabel('\sigma_e/\sigma_{es}', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(2,2,2);
  p2 = plot(fx2, theta); hold on;
  set(p2,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim', [0 1]);
  xlabel('tanh(\sigma_e/\sigma_{es})/tanh(1)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(2,2,3);
  p3 = plot(fx3, theta); hold on;
  set(p3,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim', [0 1]);
  xlabel('tanh(2\sigma_e/\sigma_{es})/tanh(2)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(2,2,4);
  p4 = plot(fx4, theta); hold on;
  set(p4,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim', [0 1]);
  xlabel('tanh(3\sigma_e/\sigma_{es})/tanh(3)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  %
  % Write data
  %
  fprintf(fid,'%g %g %g %g %g %g %g %g %g %g %g %g\n', ...
          theta0_1, theta1_1, theta0_2, theta1_2, ...
          theta0_3, theta1_3, theta0_4, theta1_4, ...
          Tmax, edot, T0, P);

%====================================================================
% Fit a straight line to the data and plot
%
function [p, theta0, theta1] = fitLine(fx, theta, color, marker)

  fit = polyfit(fx,theta,1);
  xmin = 0;
  xmax = 1.0;
  nx = 3;
  dx = xmax/nx;
  for i=1:nx+1
    xfit(i) = xmin + (i-1)*dx;
  end
  yfit = polyval(fit, xfit);
  p = plot(xfit, yfit, 'b--', 'LineWidth', 3); hold on;
  set(p,'LineWidth',2,'Color',color,'MarkerSize',5,'Marker',marker);

  theta0 = fit(2);
  theta1 = fit(1) + fit(2);

