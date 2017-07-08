%
% Compare experimental stress-strain data with MTS model
%
function testMTSSt

  marker = ['o';'p';'v';'s';'d'];
  %color = [[0.15 0.3 0.7];[0.1 0.8 0.3];[0.75 0.25 1.0];...
  %         [0.25 0.75 1.0];[1.0 0.75 0.25]];
  color = [[0.9 0.1 0.1];[0.1 0.9 0.1];[0.1 0.1 0.9];...
           [0.75 0.25 1.0];[1.0 0.75 0.25]];

  %%plotRc15BC(marker, color);

  %plotJCRc30Tension(marker, color);
  %plotJCRc30Shear(marker, color);

  %plotASMHRc32(marker, color);
  %%plotRc32BC(marker, color);

  %plotLarsonRc38(marker, color);
  %plotLYRc38500(marker, color);
  %plotLYRc381500(marker, color);
  %plotLYRc382500(marker, color);

  %plotRc45Rc45_0001(marker, color);
  %plotRc45Rc45_1000(marker, color);

  %plotRc45Rc49_0001(marker, color);
  %plotRc45Rc49_1000(marker, color);

  %%plotRc54BC(marker, color);

%====================================================================
%
% Load experimental data from Johnson-Cook (Rc = 30)
%
function plotJCRc30Tension(marker, color)

  fig30 = figure;
  set(fig30,'Position',[213 473 706 372]);

  %
  % 570/s 298K
  %
  load SigEpsEp570298KRc30Ten.dat
  epEx = SigEpsEp570298KRc30Ten(:,2);
  seqEx = SigEpsEp570298KRc30Ten(:,3);
  pexp570298 = plot(epEx, seqEx, 'p-', 'LineWidth', 2); hold on;
  set(pexp570298,'LineWidth',2,'MarkerSize',6,'Color',color(1,:), ...
                 'Marker',marker(1,:));

  delT = 1.0e-6;
  epdot = 570.0;
  T = 298.0;
  rhomax = 7850.0;
  epmax = max(epEx);
  Rc = 30;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(1,:));

  %
  % 604/s 500K
  %
  load SigEpsEp604500KRc30Ten.dat
  epEx = SigEpsEp604500KRc30Ten(:,2);
  seqEx = SigEpsEp604500KRc30Ten(:,3);
  pexp604500 = plot(epEx, seqEx, 's-', 'LineWidth', 2); hold on;
  set(pexp604500,'LineWidth',2,'MarkerSize',6,'Color',color(2,:),...
                 'Marker',marker(2,:));

  delT = 1.0e-6;
  epdot = 604.0;
  T = 500.0;
  rhomax = 7850.0;
  epmax = max(epEx);
  Rc = 30;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(2,:));

  %
  % 650/s 735K
  %
  load SigEpsEp650735KRc30Ten.dat
  epEx = SigEpsEp650735KRc30Ten(:,2);
  seqEx = SigEpsEp650735KRc30Ten(:,3);
  pexp650735 = plot(epEx, seqEx, 'v-', 'LineWidth', 2); hold on;
  set(pexp650735,'LineWidth',2,'MarkerSize',6,'Color',color(3,:),...
                 'Marker',marker(3,:));

  delT = 1.0e-6;
  epdot = 650.0;
  T = 735.0;
  rhomax = 7850.0;
  epmax = max(epEx);
  Rc = 30;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(3,:));

  set(gca, 'XLim', [0 0.2], 'YLim', [0 2000] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 30', 'FontName', 'bookman', 'FontSize', 16);
  legend([pexp570298 pexp604500 pexp650735], ...
         '570/s 298 K', ...
         '604/s 500 K', ...
         '650/s 735 K');
  %axis square;

%====================================================================
function plotJCRc30Shear(marker, color)

  fig30 = figure;
  set(fig30,'Position',[213 473 706 372]);

  %
  % 0.002/s 298K
  %
  load SigEpsEp0002298KRc30Ten.dat;
  epEx = SigEpsEp0002298KRc30Ten(:,2);
  seqEx = SigEpsEp0002298KRc30Ten(:,3);
  pexp0002298 = plot(epEx, seqEx, 'o-', 'LineWidth', 2); hold on;
  set(pexp0002298,'LineWidth',2,'MarkerSize',6,'Color',color(1,:), ...
                  'Marker', marker(1,:));

  delT = 1.0;
  epdot = 0.002;
  T = 298.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  Rc = 30.0;
  [s1, e1] = isoMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatiso  = plot(e1, s1*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatiso,'LineWidth',3,'MarkerSize',6, 'Color',color(1,:));

  %
  % 0.009/s 298K
  %
  load SigEpsEp0009298KRc30Shear.dat;
  epEx = SigEpsEp0009298KRc30Shear(:,2);
  seqEx = SigEpsEp0009298KRc30Shear(:,3);
  pexp0009298 = plot(epEx, seqEx, 's-', 'LineWidth', 3); hold on;
  set(pexp0009298,'LineWidth',2,'MarkerSize',6,'Color',color(2,:), ...
                  'Marker', marker(2,:));

  delT = 1.0;
  epdot = 0.009;
  T = 298.0;
  rhomax = 7831.0;
  epmax = max(epEx)+0.1;
  Rc = 30.0;
  [s1, e1] = isoMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatiso  = plot(e1, s1*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatiso,'LineWidth',3,'MarkerSize',6, 'Color',color(2,:));

  %
  % 0.10/s 298K
  %
%  load SigEpsEp010298KRc30Shear.dat;
%  epEx = SigEpsEp010298KRc30Shear(:,2);
%  seqEx = SigEpsEp010298KRc30Shear(:,3);
%  pexp01298 = plot(epEx, seqEx, 'v-', 'LineWidth', 3); hold on;
%  set(pexp01298,'LineWidth',3,'MarkerSize',6,'Color',[0.2 0.8 0.2]);

%  delT = 0.1;
%  epdot = 0.1;
%  T = 298.0;
%  rhomax = 7831.0;
%  epmax = max(epEx);
%  [s1, e1] = isoMTS(epdot, T, delT, rhomax, epmax, Rc);
%  pmatiso  = plot(e1, s1*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
%  set(pmatiso,'LineWidth',2,'MarkerSize',6, 'Color',[0.2 0.8 0.2]);

  %
  % 1.1/s 298K
  %
  load SigEpsEp1_1298KRc30Shear.dat;
  epEx = SigEpsEp1_1298KRc30Shear(:,2);
  seqEx = SigEpsEp1_1298KRc30Shear(:,3);
  pexp1298 = plot(epEx, seqEx, 'v-', 'LineWidth', 3); hold on;
  set(pexp1298,'LineWidth',2,'MarkerSize',6,'Color',color(3,:), ...
                  'Marker', marker(3,:));

  delT = 0.01;
  epdot = 1.1;
  T = 298.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  [s1, e1] = isoMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatiso  = plot(e1, s1*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatiso,'LineWidth',3,'MarkerSize',6, 'Color',color(3,:));

  set(gca, 'XLim', [0 1.0], 'YLim', [0 2000] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('Effective Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('Effective True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 30', 'FontName', 'bookman', 'FontSize', 16);
  %legend([pexp0002298 pexp0009298 pexp01298 pexp1298], ...
  %       '0.002/s 298 K (Tension) JC(1985)', ...
  %       '0.009/s 298 K (Shear) JC(1985)', ...
  %       '0.1/s 298 K (Shear) JC(1995)', ...
  %       '1.1/s 298 K (Shear) JC(1995)');
  legend([pexp0002298 pexp0009298 pexp1298], ...
         '0.002/s 298 K (Tension)', ...
         '0.009/s 298 K (Shear)', ...
         '1.1/s 298 K (Shear)');
  %axis square;

%====================================================================
%
% Load experimental data from Aerospace Structural Metals handbook
%
function plotASMHRc32(marker, color)

  fig40 = figure;
  set(fig40,'Position',[213 473 706 372]);

  %
  % 0.002/s 298K Rc 32
  %
  load SigEpsEp0002298KRc32.dat;
  epEx = SigEpsEp0002298KRc32(:,2);
  seqEx = SigEpsEp0002298KRc32(:,3);
  pexp0002298 = plot(epEx, seqEx, 'o-', 'LineWidth', 2); hold on;
  set(pexp0002298,'LineWidth',2,'MarkerSize',6,'Color',color(1,:), ...
                  'Marker', marker(1,:));

  Rc = 32.0;
  delT = 1.0;
  epdot = 0.002;
  T = 298.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  [s1, e1] = isoMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatiso  = plot(e1, s1*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatiso,'LineWidth',3,'MarkerSize',6, 'Color',color(1,:));

  %
  % 0.002/s 422K Rc 32
  %
  load SigEpsEp0002422KRc32.dat;
  epEx = SigEpsEp0002422KRc32(:,2);
  seqEx = SigEpsEp0002422KRc32(:,3);
  pexp0002422 = plot(epEx, seqEx, 'o-', 'LineWidth', 2); hold on;
  set(pexp0002422,'LineWidth',2,'MarkerSize',6,'Color',color(2,:), ...
                  'Marker', marker(2,:));

  delT = 1.0;
  epdot = 0.002;
  T = 422.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  [s1, e1] = isoMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatiso  = plot(e1, s1*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatiso,'LineWidth',3,'MarkerSize',6, 'Color',color(2,:));

  %
  % 0.002/s 589K Rc 32
  %
  load SigEpsEp0002589KRc32.dat;
  epEx = SigEpsEp0002589KRc32(:,2);
  seqEx = SigEpsEp0002589KRc32(:,3);
  pexp0002589 = plot(epEx, seqEx, 'o-', 'LineWidth', 2); hold on;
  set(pexp0002589,'LineWidth',2,'MarkerSize',6,'Color',color(3,:), ...
                  'Marker', marker(3,:));

  delT = 1.0;
  epdot = 0.002;
  T = 589.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  Rc = 32.0;
  [s1, e1] = isoMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatiso  = plot(e1, s1*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatiso,'LineWidth',3,'MarkerSize',6, 'Color',color(3,:));

  %
  % 0.002/s 644K Rc 32
  %
  load SigEpsEp0002644KRc32.dat;
  epEx = SigEpsEp0002644KRc32(:,2);
  seqEx = SigEpsEp0002644KRc32(:,3);
  pexp0002644 = plot(epEx, seqEx, 'o-', 'LineWidth', 2); hold on;
  set(pexp0002644,'LineWidth',2,'MarkerSize',6,'Color',color(4,:), ...
                  'Marker', marker(4,:));

  delT = 1.0;
  epdot = 0.002;
  T = 644.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  Rc = 32;
  [s1, e1] = isoMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatiso  = plot(e1, s1*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatiso,'LineWidth',3,'MarkerSize',6, 'Color',color(4,:));

  set(gca, 'XLim', [0 0.2], 'YLim', [0 2000] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 32', 'FontName', 'bookman', 'FontSize', 16);
  legend([pexp0002298 pexp0002422 pexp0002589 pexp0002644], ...
         '0.002/s 298 K', ...
         '0.002/s 422 K', ...
         '0.002/s 589 K', ...
         '0.002/s 644 K');
  %axis square;
         
%====================================================================
%
% Load experimental data from Larson (Rc = 38)
%
function plotLarsonRc38(marker, color)

  fig20 = figure;
  set(fig20,'Position',[213 473 706 372]);

  %
  % 0.0002/s 258 K
  %
  load SigEpsEp0002258KRc38.dat;
  epEx = SigEpsEp0002258KRc38(:,2);
  seqEx = SigEpsEp0002258KRc38(:,3);
  pexp00002258 = plot(epEx, seqEx, 'p-', 'LineWidth', 2); hold on;
  set(pexp00002258,'LineWidth',2,'MarkerSize',6,'Color',color(1,:), ...
                  'Marker', marker(1,:));

  delT = 10.0;
  epdot = 0.0002;
  T = 258.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  Rc = 38.0;
  [s1, e1] = isoMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatiso  = plot(e1, s1*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatiso,'LineWidth',3,'MarkerSize',6, 'Color',color(1,:));

  %
  % 0.0002/s 298 K
  %
  load SigEpsEp0002298KRc38.dat;
  epEx = SigEpsEp0002298KRc38(:,2);
  seqEx = SigEpsEp0002298KRc38(:,3);
  pexp00002298 = plot(epEx, seqEx, 'd-', 'LineWidth', 2); hold on;
  set(pexp00002298,'LineWidth',2,'MarkerSize',6,'Color',color(2,:), ...
                  'Marker', marker(2,:));

  delT = 10.0;
  epdot = 0.0002;
  T = 298.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  Rc = 38.0;
  [s1, e1] = isoMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatiso  = plot(e1, s1*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatiso,'LineWidth',3,'MarkerSize',6, 'Color',color(2,:));

  %
  % 0.0002/s 373 K
  %
  load SigEpsEp0002373KRc38.dat;
  epEx = SigEpsEp0002373KRc38(:,2);
  seqEx = SigEpsEp0002373KRc38(:,3);
  pexp00002373 = plot(epEx, seqEx, 's-', 'LineWidth', 2); hold on;
  set(pexp00002373,'LineWidth',2,'MarkerSize',6,'Color',color(3,:), ...
                  'Marker', marker(3,:));

  delT = 10.0;
  epdot = 0.0002;
  T = 373.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  Rc = 38.0;
  [s1, e1] = isoMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatiso  = plot(e1, s1*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatiso,'LineWidth',3,'MarkerSize',6, 'Color',color(3,:));

  set(gca, 'XLim', [0 0.8], 'YLim', [0 2000] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 38', 'FontName', 'bookman', 'FontSize', 16);
  legend([pexp00002258 pexp00002298 pexp00002373], ...
         '0.0002/s 258 K', ...
         '0.0002/s 298 K', ...
         '0.0002/s 373 K');
  %axis square;

%====================================================================
function plotLYRc38500(marker, color)

  fig50 = figure;
  set(fig50,'Position',[213 473 706 372]);
  
  %
  % 500/s 298K
  %
  load SigEpsEp500298KRc38.dat
  epEx = SigEpsEp500298KRc38(:,2);
  seqEx = SigEpsEp500298KRc38(:,3);
  pexp500298 = plot(epEx, seqEx, 'o-', 'LineWidth', 2); hold on;
  set(pexp500298,'LineWidth',2,'MarkerSize',6,'Color',color(1,:), ...
                  'Marker', marker(1,:));

  delT = 1.0e-6;
  epdot = 500.0;
  T = 298.0;
  rhomax = 7850.0;
  epmax = max(epEx);
  Rc = 38;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(1,:));

  %
  % 500/s 573K
  %
  load SigEpsEp500573KRc38.dat
  epEx = SigEpsEp500573KRc38(:,2);
  seqEx = SigEpsEp500573KRc38(:,3);
  pexp500573 = plot(epEx, seqEx, 'd-', 'LineWidth', 2); hold on;
  set(pexp500573,'LineWidth',2,'MarkerSize',6,'Color',color(2,:), ...
                  'Marker', marker(2,:));

  delT = 1.0e-6;
  epdot = 500.0;
  T = 573.0;
  rhomax = 7850.0;
  epmax = max(epEx);
  Rc = 38;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(2,:));

  %
  % 500/s 773K
  %
  load SigEpsEp500773KRc38.dat
  epEx = SigEpsEp500773KRc38(:,2);
  seqEx = SigEpsEp500773KRc38(:,3);
  pexp500773 = plot(epEx, seqEx, '^-', 'LineWidth', 2); hold on;
  set(pexp500773,'LineWidth',2,'MarkerSize',6,'Color',color(3,:), ...
                  'Marker', marker(3,:));

  delT = 1.0e-6;
  epdot = 500.0;
  T = 773.0;
  rhomax = 7850.0;
  epmax = max(epEx);
  Rc = 38;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(3,:));

  set(gca, 'XLim', [0 0.12], 'YLim', [0 2000] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 38', 'FontName', 'bookman', 'FontSize', 16);
  legend([pexp500298 pexp500573 pexp500773], ...
         '500/s 298 K', ...
         '500/s 573 K', ...
         '500/s 773 K');
  %axis square;
         
  %====================================================================


function plotLYRc381500(marker, color)

  E = 213.0e9;
  fig60 = figure;
  set(fig60,'Position',[213 473 706 372]);

  %
  % 1500/s 298K
  %
  load SigEpsEp1500298KRc38.dat
  epEx = SigEpsEp1500298KRc38(:,2);
  seqEx = SigEpsEp1500298KRc38(:,3);
  pexp1500298 = plot(epEx, seqEx, 'o-', 'LineWidth', 2); hold on;
  set(pexp1500298,'LineWidth',2,'MarkerSize',6,'Color',color(1,:), ...
                  'Marker', marker(1,:));

  delT = 1.0e-6;
  epdot = 1500.0;
  T = 298.0;
  rhomax = 7850.0;
  epmax = max(epEx);
  Rc = 38;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(1,:));

  %
  % 1500/s 573K
  %
  load SigEpsEp1500573KRc38.dat
  epEx = SigEpsEp1500573KRc38(:,2);
  seqEx = SigEpsEp1500573KRc38(:,3);
  pexp1500573 = plot(epEx, seqEx, 's-', 'LineWidth', 2); hold on;
  set(pexp1500573,'LineWidth',2,'MarkerSize',6,'Color',color(2,:), ...
                  'Marker', marker(2,:));

  delT = 1.0e-6;
  epdot = 1500.0;
  T = 573.0;
  rhomax = 7850.0;
  epmax = max(epEx);
  Rc = 38;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(2,:));

  %
  % 1500/s 973K
  %
  load SigEpsEp1500973KRc38.dat
  epEx = SigEpsEp1500973KRc38(:,2);
  seqEx = SigEpsEp1500973KRc38(:,3);
  pexp1500973 = plot(epEx, seqEx, 'd-', 'LineWidth', 2); hold on;
  set(pexp1500973,'LineWidth',2,'MarkerSize',6,'Color',color(3,:), ...
                  'Marker', marker(3,:));

  delT = 1.0e-6;
  epdot = 1500.0;
  T = 973.0;
  rhomax = 7850.0;
  epmax = max(epEx);
  Rc = 38;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(3,:));

  %
  % 1500/s 1173K
  %
  load SigEpsEp15001173KRc38.dat
  epEx = SigEpsEp15001173KRc38(:,2);
  seqEx = SigEpsEp15001173KRc38(:,3);
  pexp15001173 = plot(epEx, seqEx, 'v-', 'LineWidth', 2); hold on;
  set(pexp15001173,'LineWidth',2,'MarkerSize',6,'Color',color(4,:), ...
                  'Marker', marker(4,:));

  delT = 1.0e-6;
  epdot = 1500.0;
  T = 1173.0;
  rhomax = 7850.0;
  epmax = max(epEx);
  Rc = 38;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(4,:));

  %
  % 1500/s 1373K
  %
  load SigEpsEp15001373KRc38.dat
  epEx = SigEpsEp15001373KRc38(:,2);
  seqEx = SigEpsEp15001373KRc38(:,3);
  pexp15001373 = plot(epEx, seqEx, 'p-', 'LineWidth', 2); hold on;
  set(pexp15001373,'LineWidth',2,'MarkerSize',6,'Color',color(5,:), ...
                  'Marker', marker(5,:));

  delT = 1.0e-6;
  epdot = 1500.0;
  T = 1373.0;
  rhomax = 7850.0;
  epmax = max(epEx);
  Rc = 38;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(5,:));

  set(gca, 'XLim', [0 0.24], 'YLim', [0 2000] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 38', 'FontName', 'bookman', 'FontSize', 16);
  legend([pexp1500298 pexp1500573 pexp1500973 pexp15001173 pexp15001373], ...
         '1500/s 298 K', ...
         '1500/s 573 K', ...
         '1500/s 873 K', ...
         '1500/s 1173 K', ...
         '1500/s 1373 K');
  %axis square
         
  %====================================================================
         
function plotLYRc382500(marker, color)

  E = 213.0e9;
  fig70 = figure;
  set(fig70,'Position',[213 473 706 372]);

  %
  % 2500/s 773K
  %
  load SigEpsEp2500773KRc38.dat
  epEx = SigEpsEp2500773KRc38(:,2);
  seqEx = SigEpsEp2500773KRc38(:,3);
  pexp2500773 = plot(epEx, seqEx, 'o-', 'LineWidth', 2); hold on;
  set(pexp2500773,'LineWidth',2,'MarkerSize',6,'Color',color(1,:), ...
                  'Marker', marker(1,:));

  delT = 1.0e-6;
  epdot = 2500.0;
  T = 773.0;
  rhomax = 7850.0;
  epmax = max(epEx);
  Rc = 38;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(1,:));

  %
  % 2500/s 973K
  %
  load SigEpsEp2500973KRc38.dat
  epEx = SigEpsEp2500973KRc38(:,2);
  seqEx = SigEpsEp2500973KRc38(:,3);
  pexp2500973 = plot(epEx, seqEx, 's-', 'LineWidth', 2); hold on;
  set(pexp2500973,'LineWidth',2,'MarkerSize',6,'Color',color(2,:), ...
                  'Marker', marker(2,:));

  delT = 1.0e-6;
  epdot = 2500.0;
  T = 973.0;
  rhomax = 7850.0;
  epmax = max(epEx);
  Rc = 38;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(2,:));

  %
  % 2500/s 1173K
  %
  load SigEpsEp25001173KRc38.dat
  epEx = SigEpsEp25001173KRc38(:,2);
  seqEx = SigEpsEp25001173KRc38(:,3);
  pexp25001173 = plot(epEx, seqEx, 'd-', 'LineWidth', 2); hold on;
  set(pexp25001173,'LineWidth',2,'MarkerSize',6,'Color',color(3,:), ...
                  'Marker', marker(3,:));

  delT = 1.0e-6;
  epdot = 2500.0;
  T = 1173.0;
  rhomax = 7850.0;
  epmax = max(epEx);
  Rc = 38;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(3,:));

  %
  % 2500/s 1373K
  %
  load SigEpsEp25001373KRc38.dat
  epEx = SigEpsEp25001373KRc38(:,2);
  seqEx = SigEpsEp25001373KRc38(:,3);
  pexp25001373 = plot(epEx, seqEx, 'v-', 'LineWidth', 2); hold on;
  set(pexp25001373,'LineWidth',2,'MarkerSize',6,'Color',color(4,:), ...
                  'Marker', marker(4,:));

  delT = 1.0e-6;
  epdot = 2500.0;
  T = 1373.0;
  rhomax = 7850.0;
  epmax = max(epEx);
  Rc = 38;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(4,:));

  set(gca, 'XLim', [0 0.35], 'YLim', [0 2000] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 38', 'FontName', 'bookman', 'FontSize', 16);
  legend([pexp2500773 pexp2500973 pexp25001173 pexp25001373], ...
         '2500/s 773 K', ...
         '2500/s 973 K', ...
         '2500/s 1173 K', ...
         '2500/s 1373 K');
  %axis square;

  %====================================================================
         
function plotRc45Rc45_0001(marker, color)

  E = 213.0e9;
  fig01 = figure;
  set(fig01,'Position',[213 473 706 372]);

  %
  % Plot experimental data for 4340 steel Rc 45 (Rc45 et al)
  % (data in the form of shear stress vs shear strain)
  % (quasistatic)
  %
  load SigEpsEp0001173KRc45.dat
  epEx = SigEpsEp0001173KRc45(:,2);
  seqEx = SigEpsEp0001173KRc45(:,3);
  pexp00001173 = plot(epEx, seqEx, 'r.-', 'LineWidth', 2); hold on;
  set(pexp00001173,'LineWidth',2,'MarkerSize',6,'Color',color(1,:), ...
                  'Marker', marker(1,:));

  delT = 10.0;
  epdot = 0.0001;
  T = 173.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  Rc = 45.0;
  [s1, e1] = isoMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatiso  = plot(e1, s1*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatiso,'LineWidth',3,'MarkerSize',6, 'Color',color(1,:));

  load SigEpsEp0001298KRc45.dat
  epEx = SigEpsEp0001298KRc45(:,2);
  seqEx = SigEpsEp0001298KRc45(:,3);
  pexp00001298 = plot(epEx, seqEx, 'g.-', 'LineWidth', 2); hold on;
  set(pexp00001298,'LineWidth',2,'MarkerSize',6,'Color',color(2,:), ...
                  'Marker', marker(2,:));

  delT = 10.0;
  epdot = 0.0001;
  T = 298.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  Rc = 45.0;
  [s1, e1] = isoMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatiso  = plot(e1, s1*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatiso,'LineWidth',3,'MarkerSize',6, 'Color',color(2,:));

  load SigEpsEp0001373KRc45.dat
  epEx = SigEpsEp0001373KRc45(:,2);
  seqEx = SigEpsEp0001373KRc45(:,3);
  pexp00001373 = plot(epEx, seqEx, 'b.-', 'LineWidth', 2); hold on;
  set(pexp00001373,'LineWidth',2,'MarkerSize',6,'Color',color(3,:), ...
                  'Marker', marker(3,:));

  delT = 10.0;
  epdot = 0.0001;
  T = 373.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  Rc = 45.0;
  [s1, e1] = isoMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatiso  = plot(e1, s1*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatiso,'LineWidth',3,'MarkerSize',6, 'Color',color(3,:));

  set(gca, 'XLim', [0 0.3], 'YLim', [0 2000] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('Effective True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('Effective True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 45', 'FontName', 'bookman', 'FontSize', 16);
  legend([pexp00001173 pexp00001298 pexp00001373], ...
         '0.0001/s 173 K', ...
         '0.0001/s 298 K', ...
         '0.0001/s 373 K');
  %axis square;

  %====================================================================


function plotRc45Rc45_1000(marker, color)

  E = 213.0e9;
  fig11 = figure;
  set(fig11,'Position',[213 473 706 372]);

  %
  % Plot experimental data for 4340 steel Rc 45 (Rc45 et al)
  % (data in the form of shear stress vs shear strain)
  % (dynamic)
  %
  load SigEpsEp1000173KRc45.dat
  epEx = SigEpsEp1000173KRc45(:,2);
  seqEx = SigEpsEp1000173KRc45(:,3);
  pexp1000173 = plot(epEx, seqEx, 'r.-', 'LineWidth', 2); hold on;
  set(pexp1000173,'LineWidth',2,'MarkerSize',6,'Color',color(1,:), ...
                  'Marker', marker(1,:));

  delT = 1.0e-6;
  epdot = 1000.0;
  T = 173.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  Rc = 45.0;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(1,:));

  load SigEpsEp1000298KRc45.dat
  epEx = SigEpsEp1000298KRc45(:,2);
  seqEx = SigEpsEp1000298KRc45(:,3);
  pexp1000298 = plot(epEx, seqEx, 'g.-', 'LineWidth', 2); hold on;
  set(pexp1000298,'LineWidth',2,'MarkerSize',6,'Color',color(2,:), ...
                  'Marker', marker(2,:));

  delT = 1.0e-6;
  epdot = 1000.0;
  T = 298.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  Rc = 45.0;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(2,:));

  load SigEpsEp1000373KRc45.dat
  epEx = SigEpsEp1000373KRc45(:,2);
  seqEx = SigEpsEp1000373KRc45(:,3);
  pexp1000373 = plot(epEx, seqEx, 'b.-', 'LineWidth', 2); hold on;
  set(pexp1000373,'LineWidth',2,'MarkerSize',6,'Color',color(3,:), ...
                  'Marker', marker(3,:));

  delT = 1.0e-6;
  epdot = 1000.0;
  T = 373.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  Rc = 45.0;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(3,:));

  set(gca, 'XLim', [0 0.1], 'YLim', [0 2000] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('Effective True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('Effective True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 45', 'FontName', 'bookman', 'FontSize', 16);
  legend([pexp1000173 pexp1000298 pexp1000373], ...
         '1000/s 173 K', ...
         '1000/s 298 K', ...
         '1000/s 373 K');
  %axis square;

  %====================================================================

function plotRc45Rc49_0001(marker, color)

  E = 213.0e9;
  fig00 = figure;
  set(fig00,'Position',[213 473 706 372]);

  %
  % Plot experimental data for 4340 steel Rc 49 (Rc49 et al)
  % (data in the form of shear stress vs shear strain)
  % (quasistatic)
  %
  load SigEpsEp0001173KRc49.dat
  epEx = SigEpsEp0001173KRc49(:,2);
  seqEx = SigEpsEp0001173KRc49(:,3);
  pexp00001173 = plot(epEx, seqEx, 'r.-', 'LineWidth', 2); hold on;
  set(pexp00001173,'LineWidth',2,'MarkerSize',6,'Color',color(1,:), ...
                  'Marker', marker(1,:));

  delT = 10.0;
  epdot = 0.0001;
  T = 173.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  Rc = 49.0;
  [s1, e1] = isoMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatiso  = plot(e1, s1*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatiso,'LineWidth',3,'MarkerSize',6, 'Color',color(1,:));

  load SigEpsEp0001298KRc49.dat
  epEx = SigEpsEp0001298KRc49(:,2);
  seqEx = SigEpsEp0001298KRc49(:,3);
  pexp00001298 = plot(epEx, seqEx, 'g.-', 'LineWidth', 2); hold on;
  set(pexp00001298,'LineWidth',2,'MarkerSize',6,'Color',color(2,:), ...
                  'Marker', marker(2,:));

  delT = 10.0;
  epdot = 0.0001;
  T = 298.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  Rc = 49.0;
  [s1, e1] = isoMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatiso  = plot(e1, s1*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatiso,'LineWidth',3,'MarkerSize',6, 'Color',color(2,:));

  load SigEpsEp0001373KRc49.dat
  epEx = SigEpsEp0001373KRc49(:,2);
  seqEx = SigEpsEp0001373KRc49(:,3);
  pexp00001373 = plot(epEx, seqEx, 'b.-', 'LineWidth', 2); hold on;
  set(pexp00001373,'LineWidth',2,'MarkerSize',6,'Color',color(3,:), ...
                  'Marker', marker(3,:));

  delT = 10.0;
  epdot = 0.0001;
  T = 373.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  Rc = 49.0;
  [s1, e1] = isoMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatiso  = plot(e1, s1*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatiso,'LineWidth',3,'MarkerSize',6, 'Color',color(3,:));

  set(gca, 'XLim', [0 0.25], 'YLim', [0 2000] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('Effective Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('Effective True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 49', 'FontName', 'bookman', 'FontSize', 16);
  legend([pexp00001173 pexp00001298 pexp00001373], ...
         '0.0001/s 173 K', ...
         '0.0001/s 298 K', ...
         '0.0001/s 373 K');
  %axis square;

  %====================================================================

function plotRc45Rc49_1000(marker, color)

  E = 213.0e9;
  fig10 = figure;
  set(fig10,'Position',[213 473 706 372]);

  %
  % Plot experimental data for 4340 steel Rc 49 (Rc49 et al)
  % (data in the form of shear stress vs shear strain)
  % (dynamic)
  %
  load SigEpsEp1000173KRc49.dat
  epEx = SigEpsEp1000173KRc49(:,2);
  seqEx = SigEpsEp1000173KRc49(:,3);
  pexp1000173 = plot(epEx, seqEx, 'r.-', 'LineWidth', 2); hold on;
  set(pexp1000173,'LineWidth',2,'MarkerSize',6,'Color',color(1,:), ...
                  'Marker', marker(1,:));

  delT = 1.0e-6;
  epdot = 1000.0;
  T = 173.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  Rc = 49.0;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(1,:));

  load SigEpsEp1000298KRc49.dat
  epEx = SigEpsEp1000298KRc49(:,2);
  seqEx = SigEpsEp1000298KRc49(:,3);
  pexp1000298 = plot(epEx, seqEx, 'g.-', 'LineWidth', 2); hold on;
  set(pexp1000298,'LineWidth',2,'MarkerSize',6,'Color',color(2,:), ...
                  'Marker', marker(2,:));

  delT = 1.0e-6;
  epdot = 1000.0;
  T = 298.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  Rc = 49.0;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(2,:));

  load SigEpsEp1000373KRc49.dat
  epEx = SigEpsEp1000373KRc49(:,2);
  seqEx = SigEpsEp1000373KRc49(:,3);
  pexp1000373 = plot(epEx, seqEx, 'b.-', 'LineWidth', 2); hold on;
  set(pexp1000373,'LineWidth',2,'MarkerSize',6,'Color',color(3,:), ...
                  'Marker', marker(3,:));

  delT = 1.0e-6;
  epdot = 1000.0;
  T = 373.0;
  rhomax = 7831.0;
  epmax = max(epEx);
  Rc = 49.0;
  [s2, e2] = adiMTS(epdot, T, delT, rhomax, epmax, Rc);
  pmatadi  = plot(e2, s2*1.0e-6, 'k-.', 'LineWidth', 2); hold on;
  set(pmatadi,'LineWidth',3,'MarkerSize',6, 'Color',color(3,:));

  set(gca, 'XLim', [0 0.1], 'YLim', [0 2000] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('Effective Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('Effective True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 49', 'FontName', 'bookman', 'FontSize', 16);
  legend([pexp1000173 pexp1000298 pexp1000373], ...
         '1000/s 173 K', ...
         '1000/s 298 K', ...
         '1000/s 373 K');
  %axis square;

%====================================================================
function [p] = calcP(rho, rho0, T, T0)

  % Data from Brown and Gust 79
  eta = rho/rho0;
  C0 = 3935.0;
  S_alpha = 1.578;
  Gamma0 = 1.69;

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

function [Cp] = calcCp(T)

  Tc = 1040.0;
  if (T == Tc)
    T = T - 1.0;
  end
  if (T < Tc) 
    t = 1 - T/Tc;
    A = 190.14;
    B = -273.75;
    C = 418.30;
    n = 0.2;
    Cp = A + B*t + C/t^n;
  else
    t = T/Tc - 1.0;
    A = 465.21;
    B = 267.52;
    C = 58.16;
    n = 0.35;
    Cp = A + B*t + C/t^n;
  end

function [Tm] = calcTm(rho, rho0)

  %
  % Constants and derivative from Guinan and Steinberg, 1974
  %
  B0 = 1.66e11; 
  dB_dp0 = 5.29;
  G0 = 0.819e11;
  dG_dp0 = 1.8;

  %
  % Calculate the pressure 
  %
  eta = rho/rho0;
  p = calcP(rho, rho0, 300, 300);

  %
  % BPS parameters for Fe at T = 300K and p = 0
  %
  kappa = 1;  %Screw dislocation
  z = 8.0; % bcc lattice
  b2rhoTm = 0.64;
  b2rhoTm = b2rhoTm+0.14;
  alpha = 2.9;
  lambda = 1.30; % bcc lattice
  a = 5.4057*0.53e-10;
  vws = a^3/2; % bcc crystal
  kbTm = (kappa*lambda*vws*G0)/(8.0*pi*log(z-1.0))*log(alpha^2/(4.0*b2rhoTm));
  kb = 1.3806503e-23;
  Tm0 = kbTm/kb; 

  %
  % Calculate the bulk and shear factors
  %
  Bfac = 1.0 + dB_dp0/B0*p;
  Gfac = dG_dp0/G0*p;

  eta = Bfac^(1/dB_dp0);
  %
  % Calculate Tm at pressure p
  %
  Tm = Tm0/eta*(1.0 + Gfac/eta^(1/3));

function [mu] = calcmu(rho, rho0, Tm, P, T)

  mu0 = 90.0e9;
  zeta = 0.04;
  dmu_dp = 1.8;
  dmu_dp_mu0 = dmu_dp/mu0;
  C = 0.080;
  m = 55.947;
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

%
% Isothermal MTS data for stress vs strain 
%
function [sig, eps] = isoMTS(epdot, T0, delT, rhomax, epmax, Rc)

  rho0 = 7830.0;
  tmax = epmax/epdot;
  m = tmax/delT;
  ep = 0.0;
  delrho = (rhomax - rho0)/m;
  rho = rho0+0.1;
  T = T0;
  for i=1:m
    sig(i) = MTS(epdot, ep, T, T0, rho, rho0, Rc);
    eps(i) = ep;
    ep = ep + epdot*delT;
    rho = rho + delrho;
  end

%
% Adiabatic MTS data for stress vs strain 
%
function [sig, eps] = adiMTS(epdot, T0, delT, rhomax, epmax, Rc)

  rho0 = 7830.0;
  tmax = epmax/epdot;
  m = tmax/delT;
  delrho = (rhomax - rho0)/m;
  rho = rho0+0.1;
  T = T0;
  ep = 0.0;
  for i=1:m
    sig(i) = MTS(epdot, ep, T, T0, rho, rho0,  Rc);
    eps(i) = ep;
    ep = ep + epdot*delT;
    Cp = calcCp(T);
    fac = 0.9/(rho*Cp);
    T = T + sig(i)*epdot*fac*delT; 
    rho = rho + delrho;
  end

%
% Get MTS yield stress
%
function [sigy] = MTS(epdot, ep, T, T0, rho, rho0, Rc)

  %
  % Compute mu_0 (value of mu at T = 0)
  %
  P = calcP(rho, rho0, 0, 0);
  Tm = calcTm(rho, rho0);
  mu_0 = calcmu(rho, rho0, Tm, P, 0);
  format short e
  [mu_0 P Tm]

  %
  % Compute mu
  %
  P = calcP(rho, rho0, T, T0);
  Tm = calcTm(rho, rho0);
  mu = calcmu(rho, rho0, Tm, P, T);

  %
  % Get sigma_es0 and g_0es
  %
  [sigma_es0, g_0es] = getSigma_es0(Rc, T);

  %
  % Compute sigma_es
  %
  edot_0es = 1.0e7;
  kappa = 1.3806503e-23;
  b = 2.48e-10;
  sigma_es = sigma_es0*(epdot/edot_0es)^(kappa*T/(mu*b^3*g_0es)); 

  %
  % Get theta_0 and theta_IV
  %
  [theta_0, theta_IV] = getTheta0(Rc, epdot, T); 

  %
  % Compute sigma_e
  %
  sigma_e = computeSigma_e(theta_0, theta_IV, sigma_es, ep);

  %
  % Compute s_e
  %
  g_0e = 1.6;
  epdot_0e = 1.0e7;
  p_e = 2.0/3.0;
  q_e = 1.0;
  fac_e = (kappa*T/(mu*b^3*g_0e)*log(epdot_0e/epdot))^(1/q_e);
  s_e = (1.0 - fac_e)^(1/p_e);
  if (fac_e > 1.0) 
    ff_e = [mu T epdot fac_e]
    s_e = 0.0;
  else
    s_e = (1.0 - fac_e)^(1/p_e);
  end

  %
  % Get sigma_i and g_0i
  %
  [sigma_i, g_0i] = getSigmai(Rc, T);

  %
  % Compute s_i
  %
  epdot_0i = 1.0e8;
  p_i = 2.0/3.0;
  q_i = 1.0;
  fac_i = (kappa*T/(mu*b^3*g_0i)*log(epdot_0i/epdot))^(1/q_i);
  if (fac_i > 1.0) 
    ff_i = [mu T epdot fac_i]
    s_i = 0.0;
  else
    s_i = (1.0 - fac_i)^(1/p_i);
  end

  %
  % Compute sigma/mu
  %
  sigma_a = 50.0e6;

  %
  % Compute sigma_y/mu
  %
  sigma_mu = sigma_a/mu + s_i*sigma_i/mu_0 + s_e*sigma_e/mu_0;

  %
  % Compute sigy
  %
  sigy = sigma_mu*mu;
  %[sigy sigma_a s_i sigma_i s_e sigma_e mu mu_0]

%
% Integrate dsigma_e/dep
%
function [sigma_e] = computeSigma_e(theta_0, theta_IV, sigma_es, ep)

  if (ep == 0)
    sigma_e = 0.0;
    return;
  end

  alpha = 3.0;
  sigma_e = 0;
  dep = ep/100;
  for i=1:101
    FX = tanh(alpha*sigma_e/sigma_es)/tanh(alpha);
    sigma_e = sigma_e + dep*(theta_0*(1.0-FX) + theta_IV*FX);
    if (sigma_e > sigma_es)
      sigma_e = sigma_es;
      break;
    end
  end

%
% Hardness vs yield stress 
%
function calcSigY(Tt,Rc)

  % Hardness (from ASMH)
  T = [205 315 425 540 650 705];
  sigy = [1860 1620 1365 1160 860 740];
  sigu = [1980 1760 1500 1240 1020 860];
  plot(T, sigy, 'r', T, sigu, 'b');
  HRC = [53 49.5 46 39 31 24];
  plot(HRC, sigy, 'r', HRC, sigu, 'b'); hold on;

  % Hardness (from other stress-strain data)
  Rc = [30 38 45 49 55]
  sy = [792 950 1268 1459 1756]
  p = polyfit(Rc, log(sy), 1)
  for i=1:100
    rrc(i) = 22 + (55-22)/100*i;
    ss(i) = p(1)*rrc(i) + p(2);
  end
  plot(Rc, sy,'go-')
  plot(rrc, exp(ss), 'm-')

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

%
% Calc theta_0 and theta_IV
%
function [theta_0, theta_IV] = getTheta0(Rc, epdot, T)

%  if (T > 1040)
%    theta_0 = 5774.8 - 2.818*T;
%  else
%    theta_0 = 14014 - 10.046*T;
%  end
%  theta_IV = 0.0;
%  theta_0 = theta_0*1.0e6;
%  if (theta_0 < 0.0) 
%    theta_0 = 0.0;
%  end

  if (T > 1040)
    theta_0 = 7515.9 - 3.7796*T;
  else
    theta_0 = 15719 - 10.495*T;
  end
  theta_IV = 0.0;
  theta_0 = theta_0*1.0e6;
  if (theta_0 < 0.0) 
    theta_0 = 0.0;
  end

%
% Get sigma_es0 and g_0es
%
function [sigma_es0, g_0es] = getSigma_es0(Rc, T)

  %
  % Multiple temperature fit (sig-eps) - raw (T = Tmax)
  %
  if (T > 1040)
    g_0es = 0.294;
    sigma_es0 = 478.36;
  else
    if (Rc == 30)
      g_0es = 0.088;
      sigma_es0 = 1316.1;
    elseif (Rc == 38)
      g_0es = 0.232;
      sigma_es0 = 1058.4;
    elseif (Rc == 45)
      g_0es = 0.336;
      sigma_es0 = 173.5;
    elseif (Rc == 49)
      g_0es = 1.245;
      sigma_es0 = 274.9;
    else
      g_0es = 0.284;
      sigma_es0 = 705.5;
      %g_0es = 0.016559*Rc - 0.40501;
      %sigma_es0 = -63.899*Rc + 3293.4;
    end
  end
  sigma_es0 = sigma_es0*1.0e6;

%
% Get sigma_i and g_0i
%
function [sigma_i, g_0i] = getSigmai(Rc, T)

  %
  % Multiple temperature fit (sig-eps) - using raw stress-strain
  %
  if (T > 1040)
    g_0i = 0.57582;
    sigma_i = 896.14;
  else
    FisherRawData = [[30   8.6760e+08   3.3102e+00];...
                     [38   1.5281e+09   4.1229e-01];...
                     [45   1.6366e+09   1.0460e+00];...
                     [49   1.7521e+09   1.2648e+00]];
    if (Rc == 30)
      sigma_i = 8.6760e+02;
      g_0i = 3.3102e+00;
    elseif (Rc == 38)
      sigma_i = 1.5281e+03;
      g_0i = 4.1229e-01;
    elseif (Rc == 45)
      sigma_i = 1.6366e+03;
      g_0i = 1.0460e+00;
    elseif (Rc == 49)
      sigma_i = 1.7521e+03;
      g_0i = 1.2648e+00;
    else
      g_0i    = -0.1195*Rc + 6.814;
      sigma_i =  44.628*Rc - 361.33;
    end
  end
  sigma_i = sigma_i*1.0e6;

