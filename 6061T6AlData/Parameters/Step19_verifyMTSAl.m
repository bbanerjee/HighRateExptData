%
% Compare experimental stress-strain data with MTS model
%
function plotTrueSigEps

  marker = ['o';'p';'v';'s';'d';'^';'h';'<';'x';'>';'+';'*'];
  %color = [[0.15 0.3 0.7];[0.1 0.8 0.3];[0.75 0.25 1.0];...
  %         [0.25 0.75 1.0];[1.0 0.75 0.25]];
  color = [[0.90 0.10 0.10];[0.10 0.90 0.10];[0.10 0.10 0.90];...
           [0.75 0.25 1.00];[1.00 0.75 0.25];[0.15 0.30 0.70];...
           [0.10 0.80 0.30];[0.25 0.75 1.00];[0.66 0.60 0.00];...
           [0.60 0.20 0.00];[0.60 0.72 0.00];[0.30 0.55 0.60]];

  %
  % Read MTS parameters
  %
  rho0 = 2700.0;
  k = 1.3806503e-23;
  b = 2.86e-10;
  
  sig_a = 0.0e6;
  edot_0i = 5.0e8;
  p_i = 0.75;
  q_i = 1.0;
  
  sig_i_lo = 3.6074e+08;
  sig_i = 3.90893e+08;
  sig_i_hi = 4.2164e+08;
  g_0i_lo = 0.521963;
  g_0i = 0.632549;
  g_0i_hi = 0.828349;
  
  g_0e = 3.0;
  edot_0e = 1.0e9;
  q_e = 1.0;
  p_e = 0.75;
  
  edot_es0 = 1.0e8;
  sig_0es_lo = 1.14664e+08;
  sig_0es = 1.53125e+08;
  sig_0es_hi = 2.04489e+08;
  g_0es_lo = 0.229375;
  g_0es = 0.327672;
  g_0es_hi = 0.573397;
  
  a_00 = 2.35363e+09;
  a_10 = 6.85122e+07;
  a_20 = -2.47691e+06;
  a_30 = -120643;
  a_01 = 3.39128e+08;
  a_11 = 9.2115e+06;
  a_21 = -349738;
  a_31 = -15523.5;

  a_00 = 2.82383e+09
  a_10 = 7.82432e+07
  a_20 = -2.91794e+06
  a_30 = -132993

  paramMTS(1) = rho0;
  paramMTS(2) = k;
  paramMTS(3) = b;
  
  paramMTS(4) = sig_a;
  paramMTS(5) = edot_0i;
  paramMTS(6) = p_i;
  paramMTS(7) = q_i;
  
  paramMTS(8) = sig_i_lo;
  paramMTS(9) = sig_i;
  paramMTS(10) = sig_i_hi;
  paramMTS(11) = g_0i_lo;
  paramMTS(12) = g_0i;
  paramMTS(13) = g_0i_hi;
  
  paramMTS(14) = g_0e;
  paramMTS(15) = edot_0e;
  paramMTS(16) = q_e;
  paramMTS(17) = p_e;
  
  paramMTS(18) = edot_es0;
  paramMTS(19) = sig_0es_lo;
  paramMTS(20) = sig_0es;
  paramMTS(21) = sig_0es_hi;
  paramMTS(22) = g_0es_lo;
  paramMTS(23) = g_0es;
  paramMTS(24) = g_0es_hi;
  
  paramMTS(25) = a_00;
  paramMTS(26) = a_10;
  paramMTS(27) = a_20;
  paramMTS(28) = a_30;
  paramMTS(29) = a_01;
  paramMTS(30) = a_11;
  paramMTS(31) = a_21;
  paramMTS(32) = a_31;

  plot0000Edot(paramMTS, marker, color);
  plot0001Edot(paramMTS, marker, color);
  plot0002Edot(paramMTS, marker, color);
  plot01Edot(paramMTS, marker, color);
  plot1Edot(paramMTS, marker, color);
  plot10Edot(paramMTS, marker, color);
  plot25Edot(paramMTS, marker, color);
  plot55Edot(paramMTS, marker, color);
  plot350Edot(paramMTS, marker, color);
  plot1000Edot(paramMTS, marker, color)
  plot2000Edot(paramMTS, marker, color)
  plot4000Edot(paramMTS, marker, color)

%====================================================================
%
% Load experimental data for strain rate of 1.0e-5/s, 4.8e-5/s, 5.7e-4/s
%
function plot0000Edot(paramMTS, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ProcData/SigEpsEp000057s77KOga.dat.raw
  dat = SigEpsEp000057s77KOga;
  p1 = plotSigEp(dat, paramMTS, color(1,:), marker(1,:));

  load ProcData/SigEpsEp000057s201KOga.dat.raw
  dat = SigEpsEp000057s201KOga;
  p2 = plotSigEp(dat, paramMTS, color(2,:), marker(2,:));

  load ProcData/SigEpsEp000057s289KOga.dat.raw
  dat = SigEpsEp000057s289KOga;
  p3 = plotSigEp(dat, paramMTS, color(3,:), marker(3,:));

  load ProcData/SigEpsEp0000048s297KHog.dat.raw
  dat = SigEpsEp0000048s297KHog;
  p4 = plotSigEp(dat, paramMTS, color(4,:), marker(4,:));

  load ProcData/SigEpsEp000057s373KOga.dat.raw
  dat = SigEpsEp000057s373KOga;
  p5 = plotSigEp(dat, paramMTS, color(5,:), marker(5,:));

  load ProcData/SigEpsEp000057s473KOga.dat.raw
  dat = SigEpsEp000057s473KOga;
  p6 = plotSigEp(dat, paramMTS, color(6,:), marker(6,:));

  load ProcData/SigEpsEp0000010s533KHog.dat.raw
  dat = SigEpsEp0000010s533KHog;
  p7 = plotSigEp(dat, paramMTS, color(7,:), marker(7,:));

  load ProcData/SigEpsEp0000010s644KHog.dat.raw
  dat = SigEpsEp0000010s644KHog;
  p8 = plotSigEp(dat, paramMTS, color(8,:), marker(8,:));

  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim',[0 0.3]);
  xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
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
function plot0001Edot(paramMTS, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ProcData/SigEpsEp0001s294KEle.dat.raw
  dat = SigEpsEp0001s294KEle;
  p1 = plotSigEp(dat, paramMTS, color(1,:), marker(1,:));

  load ProcData/SigEpsEp0001s295KFis.dat.raw
  dat = SigEpsEp0001s295KFis;
  p2 = plotSigEp(dat, paramMTS, color(1,:), marker(2,:));

  load ProcData/SigEpsEp0001s298KCad.dat.raw
  dat = SigEpsEp0001s298KCad;
  p3 = plotSigEp(dat, paramMTS, color(1,:), marker(3,:));

  load ProcData/SigEpsEp0001s300K01MPaDav.dat.raw
  dat = SigEpsEp0001s300K01MPaDav;
  p4 = plotSigEp(dat, paramMTS, color(1,:), marker(4,:));

  load ProcData/SigEpsEp0001s367K01MPaDav.dat.raw
  dat = SigEpsEp0001s367K01MPaDav;
  p5 = plotSigEp(dat, paramMTS, color(5,:), marker(5,:));

  load ProcData/SigEpsEp0001s422K01MPaDav.dat.raw
  dat = SigEpsEp0001s422K01MPaDav;
  p6 = plotSigEp(dat, paramMTS, color(6,:), marker(6,:));

  load ProcData/SigEpsEp0001s422KEle.dat.raw
  dat = SigEpsEp0001s422KEle;
  p7 = plotSigEp(dat, paramMTS, color(6,:), marker(7,:));

  load ProcData/SigEpsEp0001s422KGre.dat.raw
  dat = SigEpsEp0001s422KGre;
  p8 = plotSigEp(dat, paramMTS, color(6,:), marker(8,:));

  load ProcData/SigEpsEp0001s478K01MPaDav.dat.raw
  dat = SigEpsEp0001s478K01MPaDav;
  p9 = plotSigEp(dat, paramMTS, color(9,:), marker(9,:));

  load ProcData/SigEpsEp0001s478KEle.dat.raw
  dat = SigEpsEp0001s478KEle;
  p10 = plotSigEp(dat, paramMTS, color(9,:), marker(10,:));

  load ProcData/SigEpsEp0001s561KEle.dat.raw
  dat = SigEpsEp0001s561KEle;
  p11 = plotSigEp(dat, paramMTS, color(11,:), marker(11,:));

  load ProcData/SigEpsEp0001s589KGre.dat.raw
  dat = SigEpsEp0001s589KGre;
  p12 = plotSigEp(dat, paramMTS, color(12,:), marker(12,:));

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
% Load pressure-dependent experimental data for strain rate of 1.0e-3/s
%
function plot0001EdotPres(paramMTS, marker, color)

%  load ProcData/SigEpsEp0001s300K138MPaDav.dat.raw
%  dat = SigEpsEp0001s300K138MPaDav;

%  load ProcData/SigEpsEp0001s300K276MPaDav.dat.raw
%  dat = SigEpsEp0001s300K276MPaDav;

%  load ProcData/SigEpsEp0001s300K414MPaDav.dat.raw
%  dat = SigEpsEp0001s300K414MPaDav;

%  load ProcData/SigEpsEp0001s367K138MPaDav.dat.raw
%  dat = SigEpsEp0001s367K138MPaDav;

%  load ProcData/SigEpsEp0001s367K276MPaDav.dat.raw
%  dat = SigEpsEp0001s367K276MPaDav;

%  load ProcData/SigEpsEp0001s367K414MPaDav.dat.raw
%  dat = SigEpsEp0001s367K414MPaDav;

%  load ProcData/SigEpsEp0001s422K138MPaDav.dat.raw
%  dat = SigEpsEp0001s422K138MPaDav;

%  load ProcData/SigEpsEp0001s422K276MPaDav.dat.raw
%  dat = SigEpsEp0001s422K276MPaDav;

%  load ProcData/SigEpsEp0001s422K414MPaDav.dat.raw
%  dat = SigEpsEp0001s422K414MPaDav;

%  load ProcData/SigEpsEp0001s478K138MPaDav.dat.raw
%  dat = SigEpsEp0001s478K138MPaDav;

%  load ProcData/SigEpsEp0001s478K276MPaDav.dat.raw
%  dat = SigEpsEp0001s478K276MPaDav;

%  load ProcData/SigEpsEp0001s478K414MPaDav.dat.raw
%  dat = SigEpsEp0001s478K414MPaDav;

%====================================================================
%
% Load experimental data for strain rate of 2.0e-3/s
%
function plot0002Edot(paramMTS, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ProcData/SigEpsEp0002s295KGre.dat.raw
  dat = SigEpsEp0002s295KGre;
  p1 = plotSigEp(dat, paramMTS, color(1,:), marker(1,:));

  load ProcData/SigEpsEp0002s298KASM.dat.raw
  dat = SigEpsEp0002s298KASM;
  p2 = plotSigEp(dat, paramMTS, color(1,:), marker(2,:));

  load ProcData/SigEpsEp0002s373KASM.dat.raw
  dat = SigEpsEp0002s373KASM;
  p3 = plotSigEp(dat, paramMTS, color(2,:), marker(3,:));

  load ProcData/SigEpsEp0002s422KASM.dat.raw
  dat = SigEpsEp0002s422KASM;
  p4 = plotSigEp(dat, paramMTS, color(3,:), marker(4,:));

  load ProcData/SigEpsEp0002s422KEle.dat.raw
  dat = SigEpsEp0002s422KEle;
  p5 = plotSigEp(dat, paramMTS, color(3,:), marker(5,:));

  load ProcData/SigEpsEp0002s477KASM.dat.raw
  dat = SigEpsEp0002s477KASM;
  p6 = plotSigEp(dat, paramMTS, color(4,:), marker(6,:));

  load ProcData/SigEpsEp0002s478KEle.dat.raw
  dat = SigEpsEp0002s478KEle;
  p7 = plotSigEp(dat, paramMTS, color(4,:), marker(7,:));

  load ProcData/SigEpsEp0002s535KASM.dat.raw
  dat = SigEpsEp0002s535KASM;
  p8 = plotSigEp(dat, paramMTS, color(5,:), marker(8,:));

  load ProcData/SigEpsEp0002s561KEle.dat.raw
  dat = SigEpsEp0002s561KEle;
  p9 = plotSigEp(dat, paramMTS, color(6,:), marker(9,:));

  load ProcData/SigEpsEp0002s589KASM.dat.raw
  dat = SigEpsEp0002s589KASM;
  p10 = plotSigEp(dat, paramMTS, color(7,:), marker(10,:));

  load ProcData/SigEpsEp0002s644KASM.dat.raw
  dat = SigEpsEp0002s644KASM;
  p11 = plotSigEp(dat, paramMTS, color(8,:), marker(11,:));

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
function plot01Edot(paramMTS, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ProcData/SigEpsEp002s422KEle.dat.raw
  dat = SigEpsEp002s422KEle;
  p1 = plotSigEp(dat, paramMTS, color(1,:), marker(1,:));

  load ProcData/SigEpsEp0085s422KEle.dat.raw
  dat = SigEpsEp0085s422KEle;
  p2 = plotSigEp(dat, paramMTS, color(1,:), marker(2,:));

  load ProcData/SigEpsEp005s478KEle.dat.raw
  dat = SigEpsEp005s478KEle;
  p3 = plotSigEp(dat, paramMTS, color(2,:), marker(3,:));

  load ProcData/SigEpsEp002s561KEle.dat.raw
  dat = SigEpsEp002s561KEle;
  p4 = plotSigEp(dat, paramMTS, color(3,:), marker(4,:));

  load ProcData/SigEpsEp006s561KEle.dat.raw
  dat = SigEpsEp006s561KEle;
  p5 = plotSigEp(dat, paramMTS, color(3,:), marker(5,:));

  load ProcData/SigEpsEp0085s561KEle.dat.raw
  dat = SigEpsEp0085s561KEle;
  p6 = plotSigEp(dat, paramMTS, color(3,:), marker(6,:));

  load ProcData/SigEpsEp015s561KEle.dat.raw
  dat = SigEpsEp015s561KEle;
  p7 = plotSigEp(dat, paramMTS, color(3,:), marker(7,:));

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
function plot1Edot(paramMTS, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ProcData/SigEpsEp11s422KEle.dat.raw
  dat = SigEpsEp11s422KEle;
  p1 = plotSigEp(dat, paramMTS, color(1,:), marker(1,:));

  load ProcData/SigEpsEp075s478KEle.dat.raw
  dat = SigEpsEp075s478KEle;
  p2 = plotSigEp(dat, paramMTS, color(2,:), marker(2,:));

  load ProcData/SigEpsEp070s561KEle.dat.raw
  dat = SigEpsEp070s561KEle;
  p3 = plotSigEp(dat, paramMTS, color(3,:), marker(3,:));

  load ProcData/SigEpsEp12s561KEle.dat.raw
  dat = SigEpsEp12s561KEle;
  p4 = plotSigEp(dat, paramMTS, color(3,:), marker(4,:));

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
function plot10Edot(paramMTS, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ProcData/SigEpsEp85s422KEle.dat.raw
  dat = SigEpsEp85s422KEle;
  p1 = plotSigEp(dat, paramMTS, color(1,:), marker(1,:));

  load ProcData/SigEpsEp9s422KGre.dat.raw
  dat = SigEpsEp9s422KGre;
  p2 = plotSigEp(dat, paramMTS, color(1,:), marker(2,:));

  load ProcData/SigEpsEp5s478KEle.dat.raw
  dat = SigEpsEp5s478KEle;
  p3 = plotSigEp(dat, paramMTS, color(2,:), marker(3,:));

  load ProcData/SigEpsEp10s589KGre.dat.raw
  dat = SigEpsEp10s589KGre;
  p4 = plotSigEp(dat, paramMTS, color(3,:), marker(4,:));

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
function plot25Edot(paramMTS, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ProcData/SigEpsEp18s295KGre.dat.raw
  dat = SigEpsEp18s295KGre;
  p1 = plotSigEp(dat, paramMTS, color(1,:), marker(1,:));

  load ProcData/SigEpsEp28s297KHog.dat.raw
  dat = SigEpsEp28s297KHog;
  p2 = plotSigEp(dat, paramMTS, color(1,:), marker(2,:));

  load ProcData/SigEpsEp30s422KEle.dat.raw
  dat = SigEpsEp30s422KEle;
  p3 = plotSigEp(dat, paramMTS, color(2,:), marker(3,:));

  load ProcData/SigEpsEp30s478KEle.dat.raw
  dat = SigEpsEp30s478KEle;
  p4 = plotSigEp(dat, paramMTS, color(3,:), marker(4,:));

  load ProcData/SigEpsEp18s533KHog.dat.raw
  dat = SigEpsEp18s533KHog;
  p5 = plotSigEp(dat, paramMTS, color(4,:), marker(5,:));

  load ProcData/SigEpsEp23s644KHog.dat.raw
  dat = SigEpsEp23s644KHog;
  p6 = plotSigEp(dat, paramMTS, color(5,:), marker(6,:));

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
function plot55Edot(paramMTS, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ProcData/SigEpsEp65s297KHog.dat.raw
  dat = SigEpsEp65s297KHog;
  p1 = plotSigEp(dat, paramMTS, color(1,:), marker(1,:));

  load ProcData/SigEpsEp50s561KEle.dat.raw
  dat = SigEpsEp50s561KEle;
  p2 = plotSigEp(dat, paramMTS, color(2,:), marker(2,:));

  load ProcData/SigEpsEp54s644KHog.dat.raw
  dat = SigEpsEp54s644KHog;
  p3 = plotSigEp(dat, paramMTS, color(3,:), marker(3,:));

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
function plot350Edot(paramMTS, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ProcData/SigEpsEp380s298KYad.dat.raw
  dat = SigEpsEp380s298KYad;
  p1 = plotSigEp(dat, paramMTS, color(1,:), marker(1,:));

  load ProcData/SigEpsEp500s298KYad.dat.raw
  dat = SigEpsEp500s298KYad;
  p2 = plotSigEp(dat, paramMTS, color(1,:), marker(2,:));

  load ProcData/SigEpsEp130s533KHog.dat.raw
  dat = SigEpsEp130s533KHog;
  p3 = plotSigEp(dat, paramMTS, color(2,:), marker(3,:));

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
function plot1000Edot(paramMTS, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ProcData/SigEpsEp1000s294KEle.dat.raw
  dat = SigEpsEp1000s294KEle;
  p1 = plotSigEp(dat, paramMTS, color(1,:), marker(1,:));

  load ProcData/SigEpsEp1000s298KLee.dat.raw
  dat = SigEpsEp1000s298KLee;
  p2 = plotSigEp(dat, paramMTS, color(1,:), marker(2,:));

  load ProcData/SigEpsEp1000s298KRos.dat.raw
  dat = SigEpsEp1000s298KRos;
  p3 = plotSigEp(dat, paramMTS, color(1,:), marker(3,:));

  load ProcData/SigEpsEp1000s422KEle.dat.raw
  dat = SigEpsEp1000s422KEle;
  p4 = plotSigEp(dat, paramMTS, color(2,:), marker(4,:));

  load ProcData/SigEpsEp1000s463KRos.dat.raw
  dat = SigEpsEp1000s463KRos;
  p5 = plotSigEp(dat, paramMTS, color(3,:), marker(5,:));

  load ProcData/SigEpsEp900s478KEle.dat.raw
  dat = SigEpsEp900s478KEle;
  p6 = plotSigEp(dat, paramMTS, color(4,:), marker(6,:));

  load ProcData/SigEpsEp1000s478KEle.dat.raw
  dat = SigEpsEp1000s478KEle;
  p7 = plotSigEp(dat, paramMTS, color(4,:), marker(7,:));

  load ProcData/SigEpsEp1000s561KEle.dat.raw
  dat = SigEpsEp1000s561KEle;
  p8 = plotSigEp(dat, paramMTS, color(5,:), marker(8,:));

  load ProcData/SigEpsEp1150s561KEle.dat.raw
  dat = SigEpsEp1150s561KEle;
  p9 = plotSigEp(dat, paramMTS, color(5,:), marker(9,:));

  load ProcData/SigEpsEp1000s618KRos.dat.raw
  dat = SigEpsEp1000s618KRos;
  p10 = plotSigEp(dat, paramMTS, color(6,:), marker(10,:));

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
         '478 K 900/s  (Green)', ...
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
function plot2000Edot(paramMTS, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ProcData/SigEpsEp1500s77KOga.dat.raw
  dat = SigEpsEp1500s77KOga;
  p1 = plotSigEp(dat, paramMTS, color(1,:), marker(1,:));

  load ProcData/SigEpsEp1500s201KOga.dat.raw
  dat = SigEpsEp1500s201KOga;
  p2 = plotSigEp(dat, paramMTS, color(2,:), marker(2,:));

  load ProcData/SigEpsEp1500s289KOga.dat.raw
  dat = SigEpsEp1500s289KOga;
  p3 = plotSigEp(dat, paramMTS, color(3,:), marker(3,:));

  load ProcData/SigEpsEp2500s295KFis.dat.raw
  dat = SigEpsEp2500s295KFis;
  p4 = plotSigEp(dat, paramMTS, color(4,:), marker(4,:));

  load ProcData/SigEpsEp2000s298KLee.dat.raw
  dat = SigEpsEp2000s298KLee;
  p5 = plotSigEp(dat, paramMTS, color(4,:), marker(5,:));

  load ProcData/SigEpsEp2000s298KYad.dat.raw
  dat = SigEpsEp2000s298KYad;
  p6 = plotSigEp(dat, paramMTS, color(4,:), marker(6,:));

  load ProcData/SigEpsEp1500s373KOga.dat.raw
  dat = SigEpsEp1500s373KOga;
  p7 = plotSigEp(dat, paramMTS, color(5,:), marker(7,:));

  load ProcData/SigEpsEp1500s473KOga.dat.raw
  dat = SigEpsEp1500s473KOga;
  p8 = plotSigEp(dat, paramMTS, color(6,:), marker(8,:));

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
function plot4000Edot(paramMTS, marker, color)

  fig10 = figure;
  set(fig10,'Position',[182 280 1131 813]);

  load ProcData/SigEpsEp3000s298KLee.dat.raw
  dat = SigEpsEp3000s298KLee;
  p1 = plotSigEp(dat, paramMTS, color(1,:), marker(1,:));

  load ProcData/SigEpsEp3600s298KYad.dat.raw
  dat = SigEpsEp3600s298KYad;
  p2 = plotSigEp(dat, paramMTS, color(2,:), marker(2,:));

  load ProcData/SigEpsEp4000s298KCad.dat.raw
  dat = SigEpsEp4000s298KCad;
  p3 = plotSigEp(dat, paramMTS, color(3,:), marker(3,:));

  load ProcData/SigEpsEp4000s298KLee.dat.raw
  dat = SigEpsEp4000s298KLee;
  p4 = plotSigEp(dat, paramMTS, color(3,:), marker(4,:));

  load ProcData/SigEpsEp4000s298KLes.dat.raw
  dat = SigEpsEp4000s298KLes;
  p5 = plotSigEp(dat, paramMTS, color(3,:), marker(5,:));

  load ProcData/SigEpsEp8000s298KLes.dat.raw
  dat = SigEpsEp8000s298KLes;
  p6 = plotSigEp(dat, paramMTS, color(4,:), marker(6,:));

  load ProcData/SigEpsEp29000s298KRam.dat.raw
  dat = SigEpsEp29000s298KRam;
  p7 = plotSigEp(dat, paramMTS, color(5,:), marker(7,:));

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
% Plot stress-strain curves
%
function [p] = plotSigEp(dat, paramMTS, color, marker)

  epEx = dat(:,5);
  seqEx = dat(:,6);
  p = plot(epEx, seqEx, 'p-', 'LineWidth', 2); hold on;
  set(p,'LineWidth',2,'MarkerSize',6,'Color',color,'Marker',marker);

  rho0 = paramMTS(1);
  T0 = dat(1,2);
  edot = dat(1,3);
  epmax = max(epEx);
  if (edot < 1.0)
    delT = 0.1/edot; 
    rhomax = rho0;
    [sigComp, epsComp] = isoMTS(paramMTS, edot, T0, ...
                                rhomax, epmax, delT);
  else
    delT = 0.1/edot; 
    rhomax = rho0;
    [sigComp, epsComp] = adiMTS(paramMTS, edot, T0, ...
                                rhomax, epmax, delT);
  end
  p1 = plot(epsComp, sigComp*1.0e-6, '--'); hold on;
  set(p1,'LineWidth',2,'Color',color);
  
  

%=======================================================================
% Compute stress-strain using MTS for isothermal condition
%
function [sig, eps] = isoMTS(paramMTS, edot, T0, ...
                             rhomax, epmax, delT)

  rho0 = paramMTS(1);
  tmax = epmax/edot;
  %m = tmax/delT;
  m = 5000;
  delT = tmax/m;
  ep = 0.0;
  delrho = (rhomax - rho0)/m;
  rho = rho0+0.1;
  T = T0;
  for i=1:m
    sig(i) = MTS(paramMTS, edot, ep, T, T0, rho);
    eps(i) = ep;
    ep = ep + edot*delT;
    rho = rho + delrho;
  end

%=======================================================================
% Compute stress-strain using MTS for isothermal condition
%
function [sig, eps] = adiMTS(paramMTS, edot, T0, ...
                             rhomax, epmax, delT)

  rho0 = paramMTS(1);
  tmax = epmax/edot;
  %m = tmax/delT;
  m = 5000;
  delT = tmax/m;
  delrho = (rhomax - rho0)/m;
  rho = rho0+0.1;
  T = T0;
  ep = 0.0;
  for i=1:m
    sig(i) = MTS(paramMTS, edot, ep, T, T0, rho);
    eps(i) = ep;
    ep = ep + edot*delT;
    Cp = calcCp(T);
    fac = 0.9/(rho*Cp);
    T = T + sig(i)*edot*fac*delT; 
    rho = rho + delrho;
  end

%=======================================================================
% Get MTS yield stress
%
function [sigy] = MTS(paramMTS, edot, ep, T, T0, rho)

  %
  % Get the parameters
  %
  rho0 = paramMTS(1);
  kappa = paramMTS(2);
  b = paramMTS(3);
  
  sig_a = paramMTS(4);
  edot_0i = paramMTS(5);
  p_i = paramMTS(6);
  q_i = paramMTS(7);
  
  sig_i = paramMTS(9);
  g_0i = paramMTS(12);

  sig_i_lo = paramMTS(8);
  sig_i_hi = paramMTS(10);
  g_0i_lo = paramMTS(11);
  g_0i_hi = paramMTS(13);
  
  g_0e = paramMTS(14);
  edot_0e = paramMTS(15);
  q_e = paramMTS(16);
  p_e = paramMTS(17);
  
  edot_0es = paramMTS(18);
  sig_0es = paramMTS(20);
  g_0es = paramMTS(23);

  sig_0es_lo = paramMTS(19);
  sig_0es_hi = paramMTS(21);
  g_0es_lo = paramMTS(22);
  g_0es_hi = paramMTS(24);
  
  %
  % Compute mu_0 (value of mu at T = 0)
  %
  P = calcP(rho, rho0, 0, 0);
  Tm = calcTm(rho, rho0);
  mu_0 = calcmu(rho, rho0, Tm, P, 0);
  format short e;
  [mu_0 P Tm];

  %
  % Compute mu
  %
  P = calcP(rho, rho0, T, T0);
  Tm = calcTm(rho, rho0);
  mu = calcmu(rho, rho0, Tm, P, T);

  %
  % Compute sigma_es
  %
  sig_es = sig_0es*(edot/edot_0es)^(kappa*T/(mu*b^3*g_0es)); 

  %
  % Get theta_0 and theta_1
  %
  [theta_0, theta_1] = getTheta0(paramMTS, edot, T); 

  %
  % Compute sigma_e
  %
  sig_e = computeSigma_e(theta_0, theta_1, sig_es, ep);

  %
  % Compute s_e
  %
  fac_e = (kappa*T/(mu*b^3*g_0e)*log(edot_0e/edot))^(1/q_e);
  s_e = (1.0 - fac_e)^(1/p_e);
  if (fac_e > 1.0) 
    ff_e = [mu T epdot fac_e]
    s_e = 0.0;
  else
    s_e = (1.0 - fac_e)^(1/p_e);
  end

  %
  % Compute s_i
  %
  fac_i = (kappa*T/(mu*b^3*g_0i)*log(edot_0i/edot))^(2/q_i);
  if (fac_i > 1.0) 
    ff_i = [mu T epdot fac_i]
    s_i = 0.0;
  else
    s_i = (1.0 - fac_i)^(1/p_i);
  end

  %
  % Compute sigma_y/mu
  %
  sigma_mu = sig_a/mu + s_i*sig_i/mu_0 + s_e*sig_e/mu_0;

  %
  % Compute sigy
  %
  sigy = sigma_mu*mu;
  %[sigy sigma_a s_i sigma_i s_e sigma_e mu mu_0]

%============================================================
% Integrate dsigma_e/dep
%
function [sigma_e] = computeSigma_e(theta_0, theta_1, sigma_es, ep)

  if (ep == 0)
    sigma_e = 0.0;
    return;
  end

  sigma_e = 0;
  dep = ep/100;
  for i=1:101
    FX = 1 - (sigma_e/sigma_es)^2;
    sigma_e = sigma_e + dep*(theta_0*FX + theta_1);
    if (sigma_e > sigma_es)
      sigma_e = sigma_es;
      break;
    end
  end

%============================================================
% Calc theta_0 and theta_1
%
function [theta_0, theta_1] = getTheta0(paramMTS, epdot, T)

  a_00 = paramMTS(25);
  a_10 = paramMTS(26);
  a_20 = paramMTS(27);
  a_30 = paramMTS(28);
  a_01 = paramMTS(29);
  a_11 = paramMTS(30);
  a_21 = paramMTS(31);
  a_31 = paramMTS(32);

  x = log(epdot);
  y = T;
  theta_0 = max(0.0, a_00 + a_10*x + a_20*y + a_30*x*y);
  theta_1 = max(0.0, a_01 + a_11*x + a_21*y + a_31*x*y);
  %theta_0 = 2*theta_0;
  theta_1 = 0.0;

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

