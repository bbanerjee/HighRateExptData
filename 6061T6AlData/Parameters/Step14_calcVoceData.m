function calcVoceData

  marker = ['o';'p';'v';'s';'d';'^';'h';'<';'x';'>';'+';'*'];
  color = [[0.90 0.10 0.10];[0.10 0.90 0.10];[0.10 0.10 0.90];...
           [0.75 0.25 1.00];[1.00 0.75 0.25];[0.15 0.30 0.70];...
           [0.30 0.50 0.80];[0.25 0.75 1.00];[0.66 0.60 0.00];...
           [0.60 0.20 0.00];[0.60 0.72 0.00];[0.30 0.55 0.60]];

  load AlDataSiges.dat
  dat = AlDataSiges;
  siges = dat(:,1);

  plot0000Edot(siges(1:8), marker, color);
  plot0001Edot(siges(9:20), marker, color);
  plot0002Edot(siges(21:31), marker, color);
  plot01Edot(siges(32:38), marker, color);
  plot1Edot(siges(39:42), marker, color);
  plot10Edot(siges(43:46), marker, color);
  plot25Edot(siges(47:52), marker, color);
  plot55Edot(siges(53:55), marker, color);
  plot350Edot(siges(56:58), marker, color);
  plot1000Edot(siges(59:68), marker, color);
  plot2000Edot(siges(69:76), marker, color);
  plot4000Edot(siges(77:83), marker, color);

%====================================================================
%
% Load experimental data for strain rate of 1.0e-5/s, 4.8e-5/s, 5.7e-4/s
%
function plot0000Edot(siges, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);
 
  load ./SigeEpData/TangSige000057s77KOga.dat;
  tang = TangSige000057s77KOga;
  filename = './SigeEpData/Theta000057s77KOga.dat';
  p1 = plotThetaFx(filename, tang, color(1,:), marker(1,:), siges(1));

  load ./SigeEpData/TangSige000057s201KOga.dat;
  tang = TangSige000057s201KOga;
  filename = './SigeEpData/Theta000057s201KOga.dat';
  p2 = plotThetaFx(filename, tang, color(2,:), marker(2,:), siges(2));

  load ./SigeEpData/TangSige000057s289KOga.dat;
  tang = TangSige000057s289KOga;
  filename = './SigeEpData/Theta000057s289KOga.dat';
  p3 = plotThetaFx(filename, tang, color(3,:), marker(3,:), siges(3));

  load ./SigeEpData/TangSige0000048s297KHog.dat;
  tang = TangSige0000048s297KHog;
  filename = './SigeEpData/Theta0000048s297KHog.dat';
  p4 = plotThetaFx(filename, tang, color(4,:), marker(4,:), siges(4));

  load ./SigeEpData/TangSige000057s373KOga.dat;
  tang = TangSige000057s373KOga;
  filename = './SigeEpData/Theta000057s373KOga.dat';
  p5 = plotThetaFx(filename, tang, color(5,:), marker(5,:), siges(5));

  load ./SigeEpData/TangSige000057s473KOga.dat;
  tang = TangSige000057s473KOga;
  filename = './SigeEpData/Theta000057s473KOga.dat';
  p6 = plotThetaFx(filename, tang, color(6,:), marker(6,:), siges(6));

  load ./SigeEpData/TangSige0000010s533KHog.dat;
  tang = TangSige0000010s533KHog;
  filename = './SigeEpData/Theta0000010s533KHog.dat';
  p7 = plotThetaFx(filename, tang, color(7,:), marker(7,:), siges(7));

  load ./SigeEpData/TangSige0000010s644KHog.dat;
  tang = TangSige0000010s644KHog;
  filename = './SigeEpData/Theta0000010s644KHog.dat';
  p8 = plotThetaFx(filename, tang, color(8,:), marker(8,:), siges(8));

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
function plot0001Edot(siges, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/TangSige0001s294KEle.dat;
  tang = TangSige0001s294KEle;
  filename = './SigeEpData/Theta0001s294KEle.dat';
  p1 = plotThetaFx(filename, tang, color(1,:), marker(1,:), siges(1));

  load ./SigeEpData/TangSige0001s295KFis.dat;
  tang = TangSige0001s295KFis;
  filename = './SigeEpData/Theta0001s295KFis.dat';
  p2 = plotThetaFx(filename, tang, color(1,:), marker(2,:), siges(2));

  load ./SigeEpData/TangSige0001s298KCad.dat;
  tang = TangSige0001s298KCad;
  filename = './SigeEpData/Theta0001s298KCad.dat';
  p3 = plotThetaFx(filename, tang, color(1,:), marker(3,:), siges(3));

  load ./SigeEpData/TangSige0001s300K01MPaDav.dat;
  tang = TangSige0001s300K01MPaDav;
  filename = './SigeEpData/Theta0001s300K01MPaDav.dat';
  p4 = plotThetaFx(filename, tang, color(1,:), marker(4,:), siges(4));

  load ./SigeEpData/TangSige0001s367K01MPaDav.dat;
  tang = TangSige0001s367K01MPaDav;
  filename = './SigeEpData/Theta0001s367K01MPaDav.dat';
  p5 = plotThetaFx(filename, tang, color(5,:), marker(5,:), siges(5));

  load ./SigeEpData/TangSige0001s422K01MPaDav.dat;
  tang = TangSige0001s422K01MPaDav;
  filename = './SigeEpData/Theta0001s422K01MPaDav.dat';
  p6 = plotThetaFx(filename, tang, color(6,:), marker(6,:), siges(6));

  load ./SigeEpData/TangSige0001s422KEle.dat;
  tang = TangSige0001s422KEle;
  filename = './SigeEpData/Theta0001s422KEle.dat';
  p7 = plotThetaFx(filename, tang, color(6,:), marker(7,:), siges(7));

  load ./SigeEpData/TangSige0001s422KGre.dat;
  tang = TangSige0001s422KGre;
  filename = './SigeEpData/Theta0001s422KGre.dat';
  p8 = plotThetaFx(filename, tang, color(6,:), marker(8,:), siges(8));

  load ./SigeEpData/TangSige0001s478K01MPaDav.dat;
  tang = TangSige0001s478K01MPaDav;
  filename = './SigeEpData/Theta0001s478K01MPaDav.dat';
  p9 = plotThetaFx(filename, tang, color(9,:), marker(9,:), siges(9));

  load ./SigeEpData/TangSige0001s478KEle.dat;
  tang = TangSige0001s478KEle;
  filename = './SigeEpData/Theta0001s478KEle.dat';
  p10 = plotThetaFx(filename, tang, color(9,:), marker(10,:), siges(10));

  load ./SigeEpData/TangSige0001s561KEle.dat;
  tang = TangSige0001s561KEle;
  filename = './SigeEpData/Theta0001s561KEle.dat';
  p11 = plotThetaFx(filename, tang, color(11,:), marker(11,:), siges(11));

  load ./SigeEpData/TangSige0001s589KGre.dat;
  tang = TangSige0001s589KGre;
  filename = './SigeEpData/Theta0001s589KGre.dat';
  p12 = plotThetaFx(filename, tang, color(12,:), marker(12,:), siges(12));

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
function plot0002Edot(siges, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/TangSige0002s295KGre.dat;
  tang = TangSige0002s295KGre;
  filename = './SigeEpData/Theta0002s295KGre.dat';
  p1 = plotThetaFx(filename, tang, color(1,:), marker(1,:), siges(1));

  load ./SigeEpData/TangSige0002s298KASM.dat;
  tang = TangSige0002s298KASM;
  filename = './SigeEpData/Theta0002s298KASM.dat';
  p2 = plotThetaFx(filename, tang, color(1,:), marker(2,:), siges(2));

  load ./SigeEpData/TangSige0002s373KASM.dat;
  tang = TangSige0002s373KASM;
  filename = './SigeEpData/Theta0002s373KASM.dat';
  p3 = plotThetaFx(filename, tang, color(2,:), marker(3,:), siges(3));

  load ./SigeEpData/TangSige0002s422KASM.dat;
  tang = TangSige0002s422KASM;
  filename = './SigeEpData/Theta0002s422KASM.dat';
  p4 = plotThetaFx(filename, tang, color(3,:), marker(4,:), siges(4));

  load ./SigeEpData/TangSige0002s422KEle.dat;
  tang = TangSige0002s422KEle;
  filename = './SigeEpData/Theta0002s422KEle.dat';
  p5 = plotThetaFx(filename, tang, color(3,:), marker(5,:), siges(5));

  load ./SigeEpData/TangSige0002s477KASM.dat;
  tang = TangSige0002s477KASM;
  filename = './SigeEpData/Theta0002s477KASM.dat';
  p6 = plotThetaFx(filename, tang, color(4,:), marker(6,:), siges(6));

  load ./SigeEpData/TangSige0002s478KEle.dat;
  tang = TangSige0002s478KEle;
  filename = './SigeEpData/Theta0002s478KEle.dat';
  p7 = plotThetaFx(filename, tang, color(4,:), marker(7,:), siges(7));

  load ./SigeEpData/TangSige0002s535KASM.dat;
  tang = TangSige0002s535KASM;
  filename = './SigeEpData/Theta0002s535KASM.dat';
  p8 = plotThetaFx(filename, tang, color(5,:), marker(8,:), siges(8));

  load ./SigeEpData/TangSige0002s561KEle.dat;
  tang = TangSige0002s561KEle;
  filename = './SigeEpData/Theta0002s561KEle.dat';
  p9 = plotThetaFx(filename, tang, color(6,:), marker(9,:), siges(9));

  load ./SigeEpData/TangSige0002s589KASM.dat;
  tang = TangSige0002s589KASM;
  filename = './SigeEpData/Theta0002s589KASM.dat';
  p10 = plotThetaFx(filename, tang, color(7,:), marker(10,:), siges(10));

  load ./SigeEpData/TangSige0002s644KASM.dat;
  tang = TangSige0002s644KASM;
  filename = './SigeEpData/Theta0002s644KASM.dat';
  p11 = plotThetaFx(filename, tang, color(8,:), marker(11,:), siges(11));

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
function plot01Edot(siges, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/TangSige002s422KEle.dat;
  tang = TangSige002s422KEle;
  filename = './SigeEpData/Theta002s422KEle.dat';
  p1 = plotThetaFx(filename, tang, color(1,:), marker(1,:), siges(1));

  load ./SigeEpData/TangSige0085s422KEle.dat;
  tang = TangSige0085s422KEle;
  filename = './SigeEpData/Theta0085s422KEle.dat';
  p2 = plotThetaFx(filename, tang, color(1,:), marker(2,:), siges(2));

  load ./SigeEpData/TangSige005s478KEle.dat;
  tang = TangSige005s478KEle;
  filename = './SigeEpData/Theta005s478KEle.dat';
  p3 = plotThetaFx(filename, tang, color(2,:), marker(3,:), siges(3));

  load ./SigeEpData/TangSige002s561KEle.dat;
  tang = TangSige002s561KEle;
  filename = './SigeEpData/Theta002s561KEle.dat';
  p4 = plotThetaFx(filename, tang, color(3,:), marker(4,:), siges(4));

  load ./SigeEpData/TangSige006s561KEle.dat;
  tang = TangSige006s561KEle;
  filename = './SigeEpData/Theta006s561KEle.dat';
  p5 = plotThetaFx(filename, tang, color(3,:), marker(5,:), siges(5));

  load ./SigeEpData/TangSige0085s561KEle.dat;
  tang = TangSige0085s561KEle;
  filename = './SigeEpData/Theta0085s561KEle.dat';
  p6 = plotThetaFx(filename, tang, color(3,:), marker(6,:), siges(6));

  load ./SigeEpData/TangSige015s561KEle.dat;
  tang = TangSige015s561KEle;
  filename = './SigeEpData/Theta015s561KEle.dat';
  p7 = plotThetaFx(filename, tang, color(3,:), marker(7,:), siges(7));

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
function plot1Edot(siges, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/TangSige11s422KEle.dat;
  tang = TangSige11s422KEle;
  filename = './SigeEpData/Theta11s422KEle.dat';
  p1 = plotThetaFx(filename, tang, color(1,:), marker(1,:), siges(1));

  load ./SigeEpData/TangSige075s478KEle.dat;
  tang = TangSige075s478KEle;
  filename = './SigeEpData/Theta075s478KEle.dat';
  p2 = plotThetaFx(filename, tang, color(2,:), marker(2,:), siges(2));

  load ./SigeEpData/TangSige070s561KEle.dat;
  tang = TangSige070s561KEle;
  filename = './SigeEpData/Theta070s561KEle.dat';
  p3 = plotThetaFx(filename, tang, color(3,:), marker(3,:), siges(3));

  load ./SigeEpData/TangSige12s561KEle.dat;
  tang = TangSige12s561KEle;
  filename = './SigeEpData/Theta12s561KEle.dat';
  p4 = plotThetaFx(filename, tang, color(3,:), marker(4,:), siges(4));

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
function plot10Edot(siges, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/TangSige85s422KEle.dat;
  tang = TangSige85s422KEle;
  filename = './SigeEpData/Theta85s422KEle.dat';
  p1 = plotThetaFx(filename, tang, color(1,:), marker(1,:), siges(1));

  load ./SigeEpData/TangSige9s422KGre.dat;
  tang = TangSige9s422KGre;
  filename = './SigeEpData/Theta9s422KGre.dat';
  p2 = plotThetaFx(filename, tang, color(1,:), marker(2,:), siges(2));

  load ./SigeEpData/TangSige5s478KEle.dat;
  tang = TangSige5s478KEle;
  filename = './SigeEpData/Theta5s478KEle.dat';
  p3 = plotThetaFx(filename, tang, color(2,:), marker(3,:), siges(3));

  load ./SigeEpData/TangSige10s589KGre.dat;
  tang = TangSige10s589KGre;
  filename = './SigeEpData/Theta10s589KGre.dat';
  p4 = plotThetaFx(filename, tang, color(3,:), marker(4,:), siges(4));

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
function plot25Edot(siges, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/TangSige18s295KGre.dat;
  tang = TangSige18s295KGre;
  filename = './SigeEpData/Theta18s295KGre.dat';
  p1 = plotThetaFx(filename, tang, color(1,:), marker(1,:), siges(1));

  load ./SigeEpData/TangSige28s297KHog.dat;
  tang = TangSige28s297KHog;
  filename = './SigeEpData/Theta28s297KHog.dat';
  p2 = plotThetaFx(filename, tang, color(1,:), marker(2,:), siges(2));

  load ./SigeEpData/TangSige30s422KEle.dat;
  tang = TangSige30s422KEle;
  filename = './SigeEpData/Theta30s422KEle.dat';
  p3 = plotThetaFx(filename, tang, color(2,:), marker(3,:), siges(3));

  load ./SigeEpData/TangSige30s478KEle.dat;
  tang = TangSige30s478KEle;
  filename = './SigeEpData/Theta30s478KEle.dat';
  p4 = plotThetaFx(filename, tang, color(3,:), marker(4,:), siges(4));

  load ./SigeEpData/TangSige18s533KHog.dat;
  tang = TangSige18s533KHog;
  filename = './SigeEpData/Theta18s533KHog.dat';
  p5 = plotThetaFx(filename, tang, color(4,:), marker(5,:), siges(5));

  load ./SigeEpData/TangSige23s644KHog.dat;
  tang = TangSige23s644KHog;
  filename = './SigeEpData/Theta23s644KHog.dat';
  p6 = plotThetaFx(filename, tang, color(5,:), marker(6,:), siges(6));

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
function plot55Edot(siges, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/TangSige65s297KHog.dat;
  tang = TangSige65s297KHog;
  filename = './SigeEpData/Theta65s297KHog.dat';
  p1 = plotThetaFx(filename, tang, color(1,:), marker(1,:), siges(1));

  load ./SigeEpData/TangSige50s561KEle.dat;
  tang = TangSige50s561KEle;
  filename = './SigeEpData/Theta50s561KEle.dat';
  p2 = plotThetaFx(filename, tang, color(2,:), marker(2,:), siges(2));

  load ./SigeEpData/TangSige54s644KHog.dat;
  tang = TangSige54s644KHog;
  filename = './SigeEpData/Theta54s644KHog.dat';
  p3 = plotThetaFx(filename, tang, color(3,:), marker(3,:), siges(3));

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
function plot350Edot(siges, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/TangSige380s298KYad.dat;
  tang = TangSige380s298KYad;
  filename = './SigeEpData/Theta380s298KYad.dat';
  p1 = plotThetaFx(filename, tang, color(1,:), marker(1,:), siges(1));

  load ./SigeEpData/TangSige500s298KYad.dat;
  tang = TangSige500s298KYad;
  filename = './SigeEpData/Theta500s298KYad.dat';
  p2 = plotThetaFx(filename, tang, color(1,:), marker(2,:), siges(2));

  load ./SigeEpData/TangSige130s533KHog.dat;
  tang = TangSige130s533KHog;
  filename = './SigeEpData/Theta130s533KHog.dat';
  p3 = plotThetaFx(filename, tang, color(2,:), marker(3,:), siges(3));

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
function plot1000Edot(siges, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/TangSige1000s294KEle.dat;
  tang = TangSige1000s294KEle;
  filename = './SigeEpData/Theta1000s294KEle.dat';
  p1 = plotThetaFx(filename, tang, color(1,:), marker(1,:), siges(1));

  load ./SigeEpData/TangSige1000s298KLee.dat;
  tang = TangSige1000s298KLee;
  filename = './SigeEpData/Theta1000s298KLee.dat';
  p2 = plotThetaFx(filename, tang, color(1,:), marker(2,:), siges(2));

  load ./SigeEpData/TangSige1000s298KRos.dat;
  tang = TangSige1000s298KRos;
  filename = './SigeEpData/Theta1000s298KRos.dat';
  p3 = plotThetaFx(filename, tang, color(1,:), marker(3,:), siges(3));

  load ./SigeEpData/TangSige1000s422KEle.dat;
  tang = TangSige1000s422KEle;
  filename = './SigeEpData/Theta1000s422KEle.dat';
  p4 = plotThetaFx(filename, tang, color(2,:), marker(4,:), siges(4));

  load ./SigeEpData/TangSige1000s463KRos.dat;
  tang = TangSige1000s463KRos;
  filename = './SigeEpData/Theta1000s463KRos.dat';
  p5 = plotThetaFx(filename, tang, color(3,:), marker(5,:), siges(5));

  load ./SigeEpData/TangSige900s478KEle.dat;
  tang = TangSige900s478KEle;
  filename = './SigeEpData/Theta900s478KEle.dat';
  p6 = plotThetaFx(filename, tang, color(4,:), marker(6,:), siges(6));

  load ./SigeEpData/TangSige1000s478KEle.dat;
  tang = TangSige1000s478KEle;
  filename = './SigeEpData/Theta1000s478KEle.dat';
  p7 = plotThetaFx(filename, tang, color(4,:), marker(7,:), siges(7));

  load ./SigeEpData/TangSige1000s561KEle.dat;
  tang = TangSige1000s561KEle;
  filename = './SigeEpData/Theta1000s561KEle.dat';
  p8 = plotThetaFx(filename, tang, color(5,:), marker(8,:), siges(8));

  load ./SigeEpData/TangSige1150s561KEle.dat;
  tang = TangSige1150s561KEle;
  filename = './SigeEpData/Theta1150s561KEle.dat';
  p9 = plotThetaFx(filename, tang, color(5,:), marker(9,:), siges(9));

  load ./SigeEpData/TangSige1000s618KRos.dat;
  tang = TangSige1000s618KRos;
  filename = './SigeEpData/Theta1000s618KRos.dat';
  p10 = plotThetaFx(filename, tang, color(6,:), marker(10,:), siges(10));

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
function plot2000Edot(siges, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/TangSige1500s77KOga.dat;
  tang = TangSige1500s77KOga;
  filename = './SigeEpData/Theta1500s77KOga.dat';
  p1 = plotThetaFx(filename, tang, color(1,:), marker(1,:), siges(1));

  load ./SigeEpData/TangSige1500s201KOga.dat;
  tang = TangSige1500s201KOga;
  filename = './SigeEpData/Theta1500s201KOga.dat';
  p2 = plotThetaFx(filename, tang, color(2,:), marker(2,:), siges(2));

  load ./SigeEpData/TangSige1500s289KOga.dat;
  tang = TangSige1500s289KOga;
  filename = './SigeEpData/Theta1500s289KOga.dat';
  p3 = plotThetaFx(filename, tang, color(3,:), marker(3,:), siges(3));

  load ./SigeEpData/TangSige2500s295KFis.dat;
  tang = TangSige2500s295KFis;
  filename = './SigeEpData/Theta2500s295KFis.dat';
  p4 = plotThetaFx(filename, tang, color(4,:), marker(4,:), siges(4));

  load ./SigeEpData/TangSige2000s298KLee.dat;
  tang = TangSige2000s298KLee;
  filename = './SigeEpData/Theta2000s298KLee.dat';
  p5 = plotThetaFx(filename, tang, color(4,:), marker(5,:), siges(5));

  load ./SigeEpData/TangSige2000s298KYad.dat;
  tang = TangSige2000s298KYad;
  filename = './SigeEpData/Theta2000s298KYad.dat';
  p6 = plotThetaFx(filename, tang, color(4,:), marker(6,:), siges(6));

  load ./SigeEpData/TangSige1500s373KOga.dat;
  tang = TangSige1500s373KOga;
  filename = './SigeEpData/Theta1500s373KOga.dat';
  p7 = plotThetaFx(filename, tang, color(5,:), marker(7,:), siges(7));

  load ./SigeEpData/TangSige1500s473KOga.dat;
  tang = TangSige1500s473KOga;
  filename = './SigeEpData/Theta1500s473KOga.dat';
  p8 = plotThetaFx(filename, tang, color(6,:), marker(8,:), siges(8));

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
function plot4000Edot(siges, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ./SigeEpData/TangSige3000s298KLee.dat;
  tang = TangSige3000s298KLee;
  filename = './SigeEpData/Theta3000s298KLee.dat';
  p1 = plotThetaFx(filename, tang, color(1,:), marker(1,:), siges(1));

  load ./SigeEpData/TangSige3600s298KYad.dat;
  tang = TangSige3600s298KYad;
  filename = './SigeEpData/Theta3600s298KYad.dat';
  p2 = plotThetaFx(filename, tang, color(2,:), marker(2,:), siges(2));

  load ./SigeEpData/TangSige4000s298KCad.dat;
  tang = TangSige4000s298KCad;
  filename = './SigeEpData/Theta4000s298KCad.dat';
  p3 = plotThetaFx(filename, tang, color(3,:), marker(3,:), siges(3));

  load ./SigeEpData/TangSige4000s298KLee.dat;
  tang = TangSige4000s298KLee;
  filename = './SigeEpData/Theta4000s298KLee.dat';
  p4 = plotThetaFx(filename, tang, color(3,:), marker(4,:), siges(4));

  load ./SigeEpData/TangSige4000s298KLes.dat;
  tang = TangSige4000s298KLes;
  filename = './SigeEpData/Theta4000s298KLes.dat';
  p5 = plotThetaFx(filename, tang, color(3,:), marker(5,:), siges(5));

  load ./SigeEpData/TangSige8000s298KLes.dat;
  tang = TangSige8000s298KLes;
  filename = './SigeEpData/Theta8000s298KLes.dat';
  p6 = plotThetaFx(filename, tang, color(4,:), marker(6,:), siges(6));

  load ./SigeEpData/TangSige29000s298KRam.dat;
  tang = TangSige29000s298KRam;
  filename = './SigeEpData/Theta29000s298KRam.dat';
  p7 = plotThetaFx(filename, tang, color(5,:), marker(7,:), siges(7));

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
function [p] = plotThetaFx(filename, tang, color, marker, siges)

  %
  % Load tang_sige data
  %
  sigma_e = tang(:,1);
  theta = tang(:,2);
  T = tang(:,3);
  edot = tang(1,4);
  T0 = tang(1,5);
  P = tang(1,6);

  %
  % Compute x axis for linear Voce law and tanh Voce law (alpha = 1,2,3)
  %
  alpha1 = 1;
  alpha2 = 2;
  alpha3 = 3;
  count = 0;
  for i=1:length(sigma_e)
    if (theta(i) > 0)
      count = count + 1;
      x_lin(count) = sigma_e(i)/siges;
      x_tanh1(count) = tanh(alpha1*sigma_e(i)/siges)/tanh(alpha1);
      x_tanh2(count) = tanh(alpha2*sigma_e(i)/siges)/tanh(alpha2);
      x_tanh3(count) = tanh(alpha3*sigma_e(i)/siges)/tanh(alpha3);
      ttheta(count) = theta(i);
      tT(count) = T(i);
    end
  end

  %
  % Plot data
  %
  subplot(2,2,1);
  p1 = plot(x_lin, ttheta); hold on;
  set(p1,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim', [0 1]);
  xlabel('\sigma_e/\sigma_{es}', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(2,2,2);
  %p2 = plot(sigma_e, theta); hold on;
  %p21 = plot(siges, 0, 'x', 'LineWidth', 3, 'Markersize',20,'Marker',marker,'Color',color ); hold on;
  p2 = plot(x_tanh1, ttheta); hold on;
  set(p2,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim', [0 1]);
  xlabel('tanh(\sigma_e/\sigma_{es})/tanh(1)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(2,2,3);
  p3 = plot(x_tanh2, ttheta); hold on;
  set(p3,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim', [0 1]);
  xlabel('tanh(2\sigma_e/\sigma_{es})/tanh(2)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(2,2,4);
  p4 = plot(x_tanh3, ttheta); hold on;
  set(p4,'LineWidth',2,'Color',color,'MarkerSize',8,'Marker',marker);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim', [0 1]);
  xlabel('tanh(3\sigma_e/\sigma_{es})/tanh(3)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  p = p1;
  %
  % Write data
  %
  fid = fopen(filename, 'w');
  for i=1:length(x_lin)
    fprintf(fid,'%g %g %g %g %g %g %g %g %g\n', x_lin(i), x_tanh1(i), ...
            x_tanh2(i), x_tanh3(i), ttheta(i), tT(i), edot, T0, P);
  end
  fclose(fid);

