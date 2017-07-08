%
% Calc data for Voce plots
%  (Uses files generated in Step9)
%
function calcVoceData

  marker = ['o';'p';'v';'s';'d';'^';'h';'<';'x';'>';'+';'*'];
  color = [[0.90 0.10 0.10];[0.10 0.90 0.10];[0.10 0.10 0.90];...
           [0.75 0.25 1.00];[1.00 0.75 0.25];[0.15 0.30 0.70];...
           [0.30 0.50 0.80];[0.25 0.75 1.00];[0.66 0.60 0.00];...
           [0.60 0.20 0.00];[0.60 0.72 0.00];[0.30 0.55 0.60]];

  plotHoge(marker, color);
  plotOgawa(marker, color);
  plotFish(marker, color);
  plotCady(marker, color);
  plotDavidson(marker, color);
  plotGreen(marker, color);
  plotASMH(marker, color);
  plotLee(marker, color);
  plotRosenberg(marker, color);
  plotYadav(marker, color);
  plotLesuer(marker, color);
  plotRamesh(marker, color);

%====================================================================
%
% Plot theta vs Fx for Hoge data
%
function plotHoge(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load SigeEpData/SigeEp0000010s533KHog.dat.satur
  load SigeEpData/SigeEp0000010s644KHog.dat.satur
  load SigeEpData/SigeEp0000048s297KHog.dat.satur
  load SigeEpData/SigeEp18s533KHog.dat.satur
  load SigeEpData/SigeEp23s644KHog.dat.satur
  load SigeEpData/SigeEp28s297KHog.dat.satur
  load SigeEpData/SigeEp54s644KHog.dat.satur
  load SigeEpData/SigeEp65s297KHog.dat.satur
  load SigeEpData/SigeEp130s533KHog.dat.satur

  filename = './ThetaData/ThetaHoge.dat';
  fid = fopen(filename, 'w');

  tang = SigeEp0000010s533KHog;
  fileTheta = './ThetaData/SigeEp0000010s533KHog.theta';
  p1 = plotThetaFx(fid, fileTheta, tang, color(1,:), marker(1,:));
  tang = SigeEp0000010s644KHog;
  fileTheta = './ThetaData/SigeEp0000010s644KHog.theta';
  p2 = plotThetaFx(fid, fileTheta, tang, color(2,:), marker(2,:));
  tang = SigeEp0000048s297KHog;
  fileTheta = './ThetaData/SigeEp0000048s297KHog.theta';
  p3 = plotThetaFx(fid, fileTheta, tang, color(3,:), marker(3,:));
  tang = SigeEp18s533KHog;
  fileTheta = './ThetaData/SigeEp18s533KHog.theta';
  p4 = plotThetaFx(fid, fileTheta, tang, color(4,:), marker(4,:));
  tang = SigeEp23s644KHog;
  fileTheta = './ThetaData/SigeEp23s644KHog.theta';
  p5 = plotThetaFx(fid, fileTheta, tang, color(5,:), marker(5,:));
  tang = SigeEp28s297KHog;
  fileTheta = './ThetaData/SigeEp28s297KHog.theta';
  p6 = plotThetaFx(fid, fileTheta, tang, color(6,:), marker(6,:));
  tang = SigeEp54s644KHog;
  fileTheta = './ThetaData/SigeEp54s644KHog.theta';
  p7 = plotThetaFx(fid, fileTheta, tang, color(7,:), marker(7,:));
  tang = SigeEp65s297KHog;
  fileTheta = './ThetaData/SigeEp65s297KHog.theta';
  p8 = plotThetaFx(fid, fileTheta, tang, color(8,:), marker(8,:));
  tang = SigeEp130s533KHog;
  fileTheta = './ThetaData/SigeEp130s533KHog.theta';
  p9 = plotThetaFx(fid, fileTheta, tang, color(9,:), marker(9,:));

  fclose(fid);



%====================================================================
%
% Plot theta vs Fx for Ogawa data
%
function plotOgawa(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load SigeEpData/SigeEp000057s77KOga.dat.satur
  load SigeEpData/SigeEp000057s201KOga.dat.satur
  load SigeEpData/SigeEp000057s289KOga.dat.satur
  load SigeEpData/SigeEp000057s373KOga.dat.satur
  load SigeEpData/SigeEp000057s473KOga.dat.satur
  load SigeEpData/SigeEp1500s201KOga.dat.satur
  load SigeEpData/SigeEp1500s289KOga.dat.satur
  load SigeEpData/SigeEp1500s373KOga.dat.satur
  load SigeEpData/SigeEp1500s473KOga.dat.satur
  load SigeEpData/SigeEp1500s77KOga.dat.satur

  filename = './ThetaData/ThetaOgawa.dat';
  fid = fopen(filename, 'w');

  tang = SigeEp000057s77KOga;
  fileTheta = './ThetaData/SigeEp000057s77KOga.theta';
  p1 = plotThetaFx(fid, fileTheta, tang, color(1,:), marker(1,:));
  tang = SigeEp000057s201KOga;
  fileTheta = './ThetaData/SigeEp000057s201KOga.theta';
  p2 = plotThetaFx(fid, fileTheta, tang, color(2,:), marker(2,:));
  tang = SigeEp000057s289KOga;
  fileTheta = './ThetaData/SigeEp000057s289KOga.theta';
  p3 = plotThetaFx(fid, fileTheta, tang, color(3,:), marker(3,:));
  tang = SigeEp000057s373KOga;
  fileTheta = './ThetaData/SigeEp000057s373KOga.theta';
  p4 = plotThetaFx(fid, fileTheta, tang, color(4,:), marker(4,:));
  tang = SigeEp000057s473KOga;
  fileTheta = './ThetaData/SigeEp000057s473KOga.theta';
  p5 = plotThetaFx(fid, fileTheta, tang, color(5,:), marker(5,:));
  tang = SigeEp1500s201KOga;
  fileTheta = './ThetaData/SigeEp1500s201KOga.theta';
  p6 = plotThetaFx(fid, fileTheta, tang, color(6,:), marker(6,:));
  tang = SigeEp1500s289KOga;
  fileTheta = './ThetaData/SigeEp1500s289KOga.theta';
  p7 = plotThetaFx(fid, fileTheta, tang, color(7,:), marker(7,:));
  tang = SigeEp1500s373KOga;
  fileTheta = './ThetaData/SigeEp1500s373KOga.theta';
  p8 = plotThetaFx(fid, fileTheta, tang, color(8,:), marker(8,:));
  tang = SigeEp1500s473KOga;
  fileTheta = './ThetaData/SigeEp1500s473KOga.theta';
  p9 = plotThetaFx(fid, fileTheta, tang, color(9,:), marker(9,:));
  tang = SigeEp1500s77KOga;
  fileTheta = './ThetaData/SigeEp1500s77KOga.theta';
  p10 = plotThetaFx(fid, fileTheta, tang, color(10,:), marker(10,:));

  fclose(fid);

%====================================================================
%
% Plot theta vs Fx for Fish data
%
function plotFish(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load SigeEpData/SigeEp0001s295KFis.dat.satur
  load SigeEpData/SigeEp2500s295KFis.dat.satur

  filename = './ThetaData/ThetaFish.dat';
  fid = fopen(filename, 'w');

  tang = SigeEp0001s295KFis;
  fileTheta = './ThetaData/SigeEp0001s295KFis.theta';
  p1 = plotThetaFx(fid, fileTheta, tang, color(1,:), marker(1,:));
  tang = SigeEp2500s295KFis;
  fileTheta = './ThetaData/SigeEp2500s295KFis.theta';
  p2 = plotThetaFx(fid, fileTheta, tang, color(2,:), marker(2,:));

  fclose(fid);

%====================================================================
%
% Plot theta vs Fx for Cady data
%
function plotCady(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load SigeEpData/SigeEp0001s298KCad.dat.satur
  load SigeEpData/SigeEp4000s298KCad.dat.satur

  filename = './ThetaData/ThetaCady.dat';
  fid = fopen(filename, 'w');

  tang = SigeEp0001s298KCad;
  fileTheta = './ThetaData/SigeEp0001s298KCad.theta';
  p1 = plotThetaFx(fid, fileTheta, tang, color(1,:), marker(1,:));
  tang = SigeEp4000s298KCad;
  fileTheta = './ThetaData/SigeEp4000s298KCad.theta';
  p2 = plotThetaFx(fid, fileTheta, tang, color(2,:), marker(2,:));

  fclose(fid);

%====================================================================
%
% Plot theta vs Fx for Davidson data
%
function plotDavidson(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load SigeEpData/SigeEp0001s300K01MPaDav.dat.satur
  load SigeEpData/SigeEp0001s367K01MPaDav.dat.satur
  load SigeEpData/SigeEp0001s422K01MPaDav.dat.satur
  load SigeEpData/SigeEp0001s478K01MPaDav.dat.satur

  filename = './ThetaData/ThetaDavidson.dat';
  fid = fopen(filename, 'w');

  tang = SigeEp0001s300K01MPaDav;
  fileTheta = './ThetaData/SigeEp0001s300K01MPaDav.theta';
  p1 = plotThetaFx(fid, fileTheta, tang, color(1,:), marker(1,:));
  tang = SigeEp0001s367K01MPaDav;
  fileTheta = './ThetaData/SigeEp0001s367K01MPaDav.theta';
  p2 = plotThetaFx(fid, fileTheta, tang, color(2,:), marker(2,:));
  tang = SigeEp0001s422K01MPaDav;
  fileTheta = './ThetaData/SigeEp0001s422K01MPaDav.theta';
  p3 = plotThetaFx(fid, fileTheta, tang, color(3,:), marker(3,:));
  tang = SigeEp0001s478K01MPaDav;
  fileTheta = './ThetaData/SigeEp0001s478K01MPaDav.theta';
  p4 = plotThetaFx(fid, fileTheta, tang, color(4,:), marker(4,:));

  fclose(fid);

%====================================================================
%
% Plot theta vs Fx for Green data
%
function plotGreen(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load SigeEpData/SigeEp0001s422KGre.dat.satur
  load SigeEpData/SigeEp0001s589KGre.dat.satur
  load SigeEpData/SigeEp0002s295KGre.dat.satur
  load SigeEpData/SigeEp9s422KGre.dat.satur
  load SigeEpData/SigeEp10s589KGre.dat.satur
  load SigeEpData/SigeEp18s295KGre.dat.satur

  filename = './ThetaData/ThetaGreen.dat';
  fid = fopen(filename, 'w');

  tang = SigeEp0001s422KGre;
  fileTheta = './ThetaData/SigeEp0001s422KGre.theta';
  p1 = plotThetaFx(fid, fileTheta, tang, color(1,:), marker(1,:));
  tang = SigeEp0001s589KGre;
  fileTheta = './ThetaData/SigeEp0001s589KGre.theta';
  p2 = plotThetaFx(fid, fileTheta, tang, color(2,:), marker(2,:));
  tang = SigeEp0002s295KGre;
  fileTheta = './ThetaData/SigeEp0002s295KGre.theta';
  p3 = plotThetaFx(fid, fileTheta, tang, color(3,:), marker(3,:));
  tang = SigeEp9s422KGre;
  fileTheta = './ThetaData/SigeEp9s422KGre.theta';
  p4 = plotThetaFx(fid, fileTheta, tang, color(4,:), marker(4,:));
  tang = SigeEp10s589KGre;
  fileTheta = './ThetaData/SigeEp10s589KGre.theta';
  p5 = plotThetaFx(fid, fileTheta, tang, color(5,:), marker(5,:));
  tang = SigeEp18s295KGre;
  fileTheta = './ThetaData/SigeEp18s295KGre.theta';
  p6 = plotThetaFx(fid, fileTheta, tang, color(6,:), marker(6,:));

  fclose(fid);

%====================================================================
%
% Plot theta vs Fx for ASMH data
%
function plotASMH(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load SigeEpData/SigeEp0002s298KASM.dat.satur
  load SigeEpData/SigeEp0002s373KASM.dat.satur
  load SigeEpData/SigeEp0002s422KASM.dat.satur
  load SigeEpData/SigeEp0002s477KASM.dat.satur
  load SigeEpData/SigeEp0002s535KASM.dat.satur
  load SigeEpData/SigeEp0002s589KASM.dat.satur
  load SigeEpData/SigeEp0002s644KASM.dat.satur

  filename = './ThetaData/ThetaASMH.dat';
  fid = fopen(filename, 'w');

  tang = SigeEp0002s298KASM;
  fileTheta = './ThetaData/SigeEp0002s298KASM.theta';
  p1 = plotThetaFx(fid, fileTheta, tang, color(1,:), marker(1,:));
  tang = SigeEp0002s373KASM;
  fileTheta = './ThetaData/SigeEp0002s373KASM.theta';
  p2 = plotThetaFx(fid, fileTheta, tang, color(2,:), marker(2,:));
  tang = SigeEp0002s422KASM;
  fileTheta = './ThetaData/SigeEp0002s422KASM.theta';
  p3 = plotThetaFx(fid, fileTheta, tang, color(3,:), marker(3,:));
  tang = SigeEp0002s477KASM;
  fileTheta = './ThetaData/SigeEp0002s477KASM.theta';
  p4 = plotThetaFx(fid, fileTheta, tang, color(4,:), marker(4,:));
  tang = SigeEp0002s535KASM;
  fileTheta = './ThetaData/SigeEp0002s535KASM.theta';
  p5 = plotThetaFx(fid, fileTheta, tang, color(5,:), marker(5,:));
  tang = SigeEp0002s589KASM;
  fileTheta = './ThetaData/SigeEp0002s589KASM.theta';
  p6 = plotThetaFx(fid, fileTheta, tang, color(6,:), marker(6,:));
  tang = SigeEp0002s644KASM;
  fileTheta = './ThetaData/SigeEp0002s644KASM.theta';
  p7 = plotThetaFx(fid, fileTheta, tang, color(7,:), marker(7,:));

  fclose(fid);

%====================================================================
%
% Plot theta vs Fx for Lee data
%
function plotLee(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load SigeEpData/SigeEp1000s298KLee.dat.satur
  load SigeEpData/SigeEp2000s298KLee.dat.satur
  load SigeEpData/SigeEp3000s298KLee.dat.satur
  load SigeEpData/SigeEp4000s298KLee.dat.satur

  filename = './ThetaData/ThetaLee.dat';
  fid = fopen(filename, 'w');

  tang = SigeEp1000s298KLee;
  fileTheta = './ThetaData/SigeEp1000s298KLee.theta';
  p1 = plotThetaFx(fid, fileTheta, tang, color(1,:), marker(1,:));
  tang = SigeEp2000s298KLee;
  fileTheta = './ThetaData/SigeEp2000s298KLee.theta';
  p2 = plotThetaFx(fid, fileTheta, tang, color(2,:), marker(2,:));
  tang = SigeEp3000s298KLee;
  fileTheta = './ThetaData/SigeEp3000s298KLee.theta';
  p3 = plotThetaFx(fid, fileTheta, tang, color(3,:), marker(3,:));
  tang = SigeEp4000s298KLee;
  fileTheta = './ThetaData/SigeEp4000s298KLee.theta';
  p4 = plotThetaFx(fid, fileTheta, tang, color(4,:), marker(4,:));

  fclose(fid);

%====================================================================
%
% Plot theta vs Fx for Rosenberg data
%
function plotRosenberg(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load SigeEpData/SigeEp1000s298KRos.dat.satur
  load SigeEpData/SigeEp1000s463KRos.dat.satur
  load SigeEpData/SigeEp1000s618KRos.dat.satur

  filename = './ThetaData/ThetaRosenberg.dat';
  fid = fopen(filename, 'w');

  tang = SigeEp1000s298KRos;
  fileTheta = './ThetaData/SigeEp1000s298KRos.theta';
  p1 = plotThetaFx(fid, fileTheta, tang, color(1,:), marker(1,:));
  tang = SigeEp1000s463KRos;
  fileTheta = './ThetaData/SigeEp1000s463KRos.theta';
  p2 = plotThetaFx(fid, fileTheta, tang, color(2,:), marker(2,:));
  tang = SigeEp1000s618KRos;
  fileTheta = './ThetaData/SigeEp1000s618KRos.theta';
  p3 = plotThetaFx(fid, fileTheta, tang, color(3,:), marker(3,:));

  fclose(fid);

%====================================================================
%
% Plot theta vs Fx for Yadav data
%
function plotYadav(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);
 
  load SigeEpData/SigeEp380s298KYad.dat.satur
  load SigeEpData/SigeEp500s298KYad.dat.satur
  load SigeEpData/SigeEp2000s298KYad.dat.satur
  load SigeEpData/SigeEp3600s298KYad.dat.satur

  filename = './ThetaData/ThetaYadav.dat';
  fid = fopen(filename, 'w');

  tang = SigeEp380s298KYad;
  fileTheta = './ThetaData/SigeEp380s298KYad.theta';
  p1 = plotThetaFx(fid, fileTheta, tang, color(1,:), marker(1,:));
  tang = SigeEp500s298KYad;
  fileTheta = './ThetaData/SigeEp500s298KYad.theta';
  p2 = plotThetaFx(fid, fileTheta, tang, color(2,:), marker(2,:));
  tang = SigeEp2000s298KYad;
  fileTheta = './ThetaData/SigeEp2000s298KYad.theta';
  p3 = plotThetaFx(fid, fileTheta, tang, color(3,:), marker(3,:));
  tang = SigeEp3600s298KYad;
  fileTheta = './ThetaData/SigeEp3600s298KYad.theta';
  p4 = plotThetaFx(fid, fileTheta, tang, color(4,:), marker(4,:));

  fclose(fid);

%====================================================================
%
% Plot theta vs Fx for Lesuer data
%
function plotLesuer(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);
 
  load SigeEpData/SigeEp4000s298KLes.dat.satur
  load SigeEpData/SigeEp8000s298KLes.dat.satur

  filename = './ThetaData/ThetaLesuer.dat';
  fid = fopen(filename, 'w');

  tang = SigeEp4000s298KLes;
  fileTheta = './ThetaData/SigeEp4000s298KLes.theta';
  p1 = plotThetaFx(fid, fileTheta, tang, color(1,:), marker(1,:));
  tang = SigeEp8000s298KLes;
  fileTheta = './ThetaData/SigeEp8000s298KLes.theta';
  p2 = plotThetaFx(fid, fileTheta, tang, color(2,:), marker(2,:));

  fclose(fid);

%====================================================================
%
% Plot theta vs Fx for Ramesh data
%
function plotRamesh(marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);
 
  load SigeEpData/SigeEp29000s298KRam.dat.satur

  filename = './ThetaData/ThetaRamesh.dat';
  fid = fopen(filename, 'w');

  tang = SigeEp29000s298KRam;
  fileTheta = './ThetaData/SigeEp29000s298KRam.theta';
  p1 = plotThetaFx(fid, fileTheta, tang, color(1,:), marker(1,:));

  fclose(fid);


%=======================================================================
% Plot Theta vs Fx
%
function [p1] = plotThetaFx(fid, fileTheta, tang, color, marker)

  % 
  % The data are in the form of a quadratic function
  %  sigma_e(ep) = a1*ep^2 + a2*ep + a3
  %
  a1 = tang(:,1);
  a2 = tang(:,2);
  a3 = tang(:,3);
  epes = tang(:,4);
  siges = tang(:,5)*1.0e6;
  Tes = tang(:,6);
  edot = tang(:,7);
  T0 = tang(:,8);
  P = tang(:,9);

  %
  % Compute sigma_e and theta
  %
  epmin = 0;
  epmax = epes;
  nep = 100;
  dep = (epmax-epmin)/nep;
  for i=1:nep+1
    ep = epmin + (i-1)*dep;
    sigma_e(i) = a1*ep^2 + a2*ep + a3;
    theta(i) = 2*a1*ep + a2;
  end

  %
  % Compute x axis for linear Voce law and tanh Voce law 
  %
  alpha = 10;
  count = 0;
  for i=1:length(sigma_e)
    ratio = sigma_e(i)/siges;
    if (theta(i) > 0 & ratio > 0)
      count = count + 1;
      x_0(count) = 1 - sigma_e(i)/siges;
      x_lin(count) = 1 - (sigma_e(i)/siges)^2;
      x_tanh(count) = 1 - tanh(alpha*sigma_e(i)/siges)/tanh(alpha);
      ttheta(count) = theta(i);
    end
  end

  %
  % Fit a line/quadratic to the data
  %
  [C,S] = polyfit(x_lin, ttheta, 1);

  %
  % Plot fit
  %
  xmin = 0.0;
  xmax = 1.0;
  nx = 100;
  xfit = linspace(xmin, xmax, nx);
  yfit = polyval(C, xfit);
  subplot(2,2,1);
  p0 = plot(xfit, yfit*1.0e-6, 'b--', 'LineWidth', 3); hold on;
  set(p0, 'Color', color);

  %
  % Write fit
  %
  fprintf(fid, '%g %g %g %g %g\n', C(1), C(2), edot, T0, P);

  %
  % Plot data
  %
  subplot(2,2,1);
  p1 = plot(x_lin, ttheta*1.0e-6); hold on;
  set(p1,'LineWidth',2,'Color',color);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim', [0 1]);
  xlabel('1 - (\sigma_e/\sigma_{es})^2', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(2,2,2);
  p4 = plot(x_tanh, ttheta*1.0e-6); hold on;
  set(p4,'LineWidth',2,'Color',color);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim', [0 1]);
  xlabel('1 - tanh(10\sigma_e/\sigma_{es})/tanh(10)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(2,2,3);
  p5 = plot(x_0, ttheta*1.0e-6, '.'); hold on;
  set(p5,'LineWidth',2,'Color',color);

  %
  % Write data
  %
  fidTheta = fopen(fileTheta, 'w');
  for i=1:length(x_lin)
    fprintf(fidTheta,'%g %g %g %g %g %g\n', x_lin(i), x_tanh(i), ttheta(i), ...
            edot, T0, P);
  end
  fclose(fidTheta);

%====================================================================
% Fit a curve to the data of the form
%   y = a1*x
% Assume that x is a n x 1 vector
%
function [CC, S] = curveFitPoly(x, y)

  n = length(y);

  xx = x.*x;
  yx = y.*x;

  b = sum(yx);
  A = sum(xx);
  C = b/A;

  CC = [C(1) 0];
  ypred = polyval(CC, x);
  resid = y - ypred;

  S = struct('R',A,'df',n-1,'normr',norm(resid));

