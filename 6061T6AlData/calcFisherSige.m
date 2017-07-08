%
% Plot modified Arrhenius plots for sigma_es
%
function calcFisherSige

  format short e;

  %
  % Rc = 30
  %
  [datRc30] = sigma_es_Rc30;
  [C30Shf] = computePlotArrhenius(datRc30, '4340 Steel Rc 30', ...
                                  'StDataSigeFisherRc30.dat');
  oog_0es_Rc30_Shf = -C30Shf(1);
  lnsig_0es_Rc30_Shf = C30Shf(2);
  g_0es_Rc30_Shf = 1.0/oog_0es_Rc30_Shf;
  sig_0es_Rc30_Shf = exp(lnsig_0es_Rc30_Shf);

  %
  % Rc = 38
  %
  [datRc38,datLo38,datHi38] = sigma_es_Rc38;
  [C38Shf] = computePlotArrhenius(datRc38, '4340 Steel Rc 38' , ...
                                  'StDataSigeFisherRc38.dat');
  oog_0es_Rc38_Shf = -C38Shf(1);
  lnsig_0es_Rc38_Shf = C38Shf(2);
  g_0es_Rc38_Shf = 1.0/oog_0es_Rc38_Shf;
  sig_0es_Rc38_Shf = exp(lnsig_0es_Rc38_Shf);

  [CLoShf] = computePlotArrhenius(datLo38, '4340 Steel Rc 38 Low T', ...
                                  'StDataSigeFisherRc38Lo.dat' );
  oog_0es_Lo38_Shf = -CLoShf(1);
  lnsig_0es_Lo38_Shf = CLoShf(2);
  g_0es_Lo38_Shf = 1.0/oog_0es_Lo38_Shf;
  sig_0es_Lo38_Shf = exp(lnsig_0es_Lo38_Shf);

  [CHiShf] = computePlotArrhenius(datHi38, '4340 Steel Rc 38 High T' , ...
                                  'StDataSigeFisherRc38Hi.dat');
  oog_0es_Hi38_Shf = -CHiShf(1);
  lnsig_0es_Hi38_Shf = CHiShf(2);
  g_0es_Hi38_Shf = 1.0/oog_0es_Hi38_Shf
  sig_0es_Hi38_Shf = exp(lnsig_0es_Hi38_Shf)

  %
  % Rc = 45
  %
  [datRc45,datLo45,datHi45] = sigma_es_Rc45;
  [C45Shf] = computePlotArrhenius(datRc45, '4340 Steel Rc 45' , ...
                                  'StDataSigeFisherRc45.dat');
  oog_0es_Rc45_Shf = -C45Shf(1);
  lnsig_0es_Rc45_Shf = C45Shf(2);
  g_0es_Rc45_Shf = 1.0/oog_0es_Rc45_Shf;
  sig_0es_Rc45_Shf = exp(lnsig_0es_Rc45_Shf);

  %[C45LoShf] = computePlotArrhenius(datLo45, '4340 Steel Rc 45 Low edot', ...
  %                                'StDataSigeFisherRc45Lo.dat' );
  %oog_0es_Lo45_Shf = -C45LoShf(1);
  %lnsig_0es_Lo45_Shf = C45LoShf(2);
  %g_0es_Lo45_Shf = 1.0/oog_0es_Lo45_Shf;
  %sig_0es_Lo45_Shf = exp(lnsig_0es_Lo45_Shf);

  %[C45HiShf] = computePlotArrhenius(datHi45, '4340 Steel Rc 45 High edot' , ...
  %                                'StDataSigeFisherRc45Hi.dat');
  %oog_0es_Hi45_Shf = -C45HiShf(1);
  %lnsig_0es_Hi45_Shf = C45HiShf(2);
  %g_0es_Hi45_Shf = 1.0/oog_0es_Hi45_Shf
  %sig_0es_Hi45_Shf = exp(lnsig_0es_Hi45_Shf)

  %g_0es_Rc45_Shf = 0.5*(g_0es_Lo45_Shf + g_0es_Hi45_Shf);
  %sig_0es_Rc45_Shf = 0.5*(sig_0es_Lo45_Shf + sig_0es_Hi45_Shf);

  %
  % Rc = 49
  %
  [datRc49,datLo49,datHi49] = sigma_es_Rc49;
  [C49Shf] = computePlotArrhenius(datRc49, '4340 Steel Rc 49' , ...
                                  'StDataSigeFisherRc49.dat');
  oog_0es_Rc49_Shf = -C49Shf(1);
  lnsig_0es_Rc49_Shf = C49Shf(2);
  g_0es_Rc49_Shf = 1.0/oog_0es_Rc49_Shf;
  sig_0es_Rc49_Shf = exp(lnsig_0es_Rc49_Shf);

  %[C49LoShf] = computePlotArrhenius(datLo49, '4340 Steel Rc 49 Low edot', ...
  %                                'StDataSigeFisherRc49Lo.dat' );
  %oog_0es_Lo49_Shf = -C49LoShf(1);
  %lnsig_0es_Lo49_Shf = C49LoShf(2);
  %g_0es_Lo49_Shf = 1.0/oog_0es_Lo49_Shf;
  %sig_0es_Lo49_Shf = exp(lnsig_0es_Lo49_Shf);

  %[C49HiShf] = computePlotArrhenius(datHi49, '4340 Steel Rc 49 High edot' , ...
  %                                'StDataSigeFisherRc49Hi.dat');
  %oog_0es_Hi49_Shf = -C49HiShf(1);
  %lnsig_0es_Hi49_Shf = C49HiShf(2);
  %g_0es_Hi49_Shf = 1.0/oog_0es_Hi49_Shf
  %sig_0es_Hi49_Shf = exp(lnsig_0es_Hi49_Shf)

  %g_0es_Rc49_Shf = 0.5*(g_0es_Lo49_Shf + g_0es_Hi49_Shf);
  %sig_0es_Rc49_Shf = 0.5*(sig_0es_Lo49_Shf + sig_0es_Hi49_Shf);

  %
  % Sort with Rc
  %
  Rc = [30 38 45 49];
  g_0es_Shf   = [g_0es_Rc30_Shf   g_0es_Lo38_Shf   g_0es_Rc45_Shf   g_0es_Rc49_Shf]
  sig_0es_Shf = [sig_0es_Rc30_Shf sig_0es_Lo38_Shf sig_0es_Rc45_Shf sig_0es_Rc49_Shf]
%  g_0es_Shf   = [g_0es_Rc30_Shf   g_0es_Rc38_Shf   g_0es_Rc45_Shf   g_0es_Rc49_Shf]
%  sig_0es_Shf = [sig_0es_Rc30_Shf sig_0es_Rc38_Shf sig_0es_Rc45_Shf sig_0es_Rc49_Shf]
  g_0es_m = median(g_0es_Shf)
  sig_0es_m = mean(sig_0es_Shf)

  %
  % Fit polygon
  %
  RcMin = 25;
  RcMax = 50;
  nRc = 100;
  dRc = (RcMax-RcMin)/nRc;
  for i=1:nRc+1
    RcFit(i) = RcMin + (i-1)*dRc;
    g_0es_mean(i) = g_0es_m;
    sig_0es_mean(i) = sig_0es_m;
  end
  str_g0es_m = sprintf('g_{0es} = %0.5g', g_0es_m);
  str_sig0es_m = sprintf('\\sigma_{0es} = %0.5g (MPa)', sig_0es_m*1.0e-6);
  [pFit3] = polyfit(Rc(1:3), g_0es_Shf(1:3), 1)
  g_0es_ShfFit = polyval(pFit3, RcFit);
  [pFit4] = polyfit(Rc, sig_0es_Shf, 1)
  sig_0es_ShfFit = polyval(pFit4, RcFit);

  %
  % Plot with Rc (Shf data)
  %
  fig1 = figure;
  p3 = plot(Rc, g_0es_Shf, 'ro', 'LineWidth', 2, 'MarkerSize', 8); hold on;
  p13 = plot(RcFit, g_0es_ShfFit, 'b-', 'LineWidth', 3, 'MarkerSize', 8);
  p23 = plot(RcFit, g_0es_mean, 'b--', 'LineWidth', 3, 'MarkerSize', 8);
  set(gca, 'XLim', [25 50], 'YLim', [0 1.2] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('Hardness (R_c)', ...
         'FontName', 'bookman', 'FontSize', 16);
  ylabel('g_{0es} ', ...
         'FontName', 'bookman', 'FontSize', 16);
  axis square;
  str_g0es = sprintf('g_{0es} = %0.5g R_c - %0.5g', pFit3(1), -pFit3(2));
  gtext(str_g0es, 'FontName', 'bookman', 'FontSize', 14);
  gtext(str_g0es_m, 'FontName', 'bookman', 'FontSize', 14);

  fig2 = figure;
  p4 = plot(Rc, sig_0es_Shf*1.0e-6, 'ro', 'LineWidth', 2, 'MarkerSize', 8); hold on;
  p14 = plot(RcFit, sig_0es_ShfFit*1.0e-6, 'b-', 'LineWidth', 3, 'MarkerSize', 8);
  p24 = plot(RcFit, sig_0es_mean*1.0e-6, 'b--', 'LineWidth', 3, 'MarkerSize', 8);
  set(gca, 'XLim', [25 50], 'YLim', [0 1600] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('Hardness (R_c)', ...
         'FontName', 'bookman', 'FontSize', 16);
  ylabel('\sigma_{0es} (MPa) ', ...
         'FontName', 'bookman', 'FontSize', 16);
  axis square;
  pFit4 = pFit4*1.0e-6;
  str_sig0es = sprintf('\\sigma_{0es} = %0.5g R_c + %0.5g (MPa)', pFit4(1), pFit4(2))
  gtext(str_sig0es, 'FontName', 'bookman', 'FontSize', 14);
  gtext(str_sig0es_m, 'FontName', 'bookman', 'FontSize', 14);
  
%
% Compute and plot  Arrhenius plot
%
function [C] = computePlotArrhenius(dat, label, fileName)

  fig00 = figure;

  rho0 = 7830.0;
  kappa = 1.3806503e-23;
  b = 2.48e-10;
  edot_0es = 1.0e7;

  edot = dat(:,1);
  T = dat(:,2);
  sig_es = dat(:,3)*1.0e6;
  Tmax = dat(:,4);

  fid = fopen(fileName', 'w');
  for i=1:length(T)
    
    %
    % Compute ln(sigma_es)
    %
    yy(i) = log(sig_es(i));

    %
    % Compute mu
    %
    %Tmax(i) = T(i);
    rho = rho0;
    P = calcP(rho, rho0, Tmax(i), T(i));
    Tm = calcTm(rho, rho0);
    mu = calcmu(rho, rho0, Tm, P, Tmax(i));

    %
    % Compute kT/mub^3 ln(edot_0es/edot)
    %
    xx(i) = kappa*Tmax(i)/(mu*b^3)*log(edot_0es/edot(i));
    str = sprintf('(%g, %g)',T(i),edot(i));
    text(xx(i),yy(i),str); hold on;
    fprintf(fid, '%0.5g %0.5g %0.5g %0.5g %0.4g %0.5g %0.5g\n', ...
            xx(i), yy(i), T(i), Tmax(i), edot(i), sig_es(i)*1.0e-6, mu*1.0e-9);
  end
  fclose(fid);

  p1 = plot(xx, yy, 'rs'); hold on;
  set(p1, 'LineWidth', 2, 'MarkerSize', 8);

  [C, S] = polyfit(xx, yy, 1);
  %xmax = max(xx)+0.05;
  xmin = 0.0;
  xmax = 0.3;
  nx = 3;
  dx = (xmax-xmin)/nx;
  for i=1:nx+1
    xfit(i) = xmin + (i-1)*dx;
  end
  [yfit, delta]  = polyval(C, xfit, S);
  p2 = plot(xfit, yfit, 'b-');
  %p2 = errorbar(xfit, yfit, delta, 'b-');
  set(p2, 'LineWidth', 3, 'MarkerSize', 8);
  str1 = sprintf('y = %g x + %g (ln(Pa))', C(1), C(2));
  text(min(xx),min(yy),str1, 'FontName', 'bookman', 'FontSize', 14);

  set(gca, 'XLim', [0 0.3], 'YLim', [17 22] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('x := kT/\mu b^3 ln(\epsilon_{0es}/\epsilon)', ...
         'FontName', 'bookman', 'FontSize', 16);
  ylabel('y := ln(\sigma_{es}) (ln(Pa))', ...
         'FontName', 'bookman', 'FontSize', 16);
  title(label, 'FontName', 'bookman', 'FontSize', 16);
  %grid on;
  axis square;

  
%
% The data extracted from the plots in this program
% The data are stored as (epdot, T, sigma_es, Tmax)
function [dat] = sigma_es_Rc30

    %
    % Raw true strain true stress
    %
    %dat(1,:)  = [0.002  298 1200 298];
    %dat(2,:)  = [0.009   298  450 298];
    %dat(3,:)  = [0.1     298  450 298];
    %dat(4,:)  = [1.1     298  400 298];
    %dat(5,:)  = [570     298  700 344];
    %dat(6,:)  = [604     500  600 532];
    %dat(7,:)  = [650     735  400 758];

    %
    % Shifted strain stress
    %
%    dat(1,:)  = [0.002  298  1200 298];
%    dat(2,:)  = [0.009   298  400 298];
%    dat(3,:)  = [0.1     298  500 298];
%    dat(4,:)  = [1.1     298  390 298];
%    dat(5,:)  = [570     298 1200 344];
%    dat(6,:)  = [604     500  550 532];
%    dat(7,:)  = [650     735  400 758];

    %
    % Raw strain stress
    %
    datTen(1,:)  = [0.002   298 1300 298];
    datTen(2,:)  = [570     298 1300 344];
    datTen(3,:)  = [604     500  550 532];
    datTen(4,:)  = [650     735  400 758];
    datSh(1,:)  = [0.009   298  400 298];
    datSh(2,:)  = [0.1     298  480 298];
    datSh(3,:)  = [1.1     298  470 298];
    dat = cat(1,datTen,datSh);

function [dat, datLo, datHi] = sigma_es_Rc38

    %
    % Raw true strain true stress
    %
    %datLo(1,:)  = [0.0002  258  1500 258];
    %datLo(2,:)  = [0.0002  298  1200 298];
    %datLo(3,:)  = [0.0002  373  1000 373];
    %datLo(4,:)  = [500     298  1400 320];
    %datLo(5,:)  = [500     573   700 592];
    %datLo(6,:)  = [500     773   600 786];
    %datLo(7,:)  = [1500    298  1800 376];
    %datLo(8,:)  = [1500    573  1700 618];
    %datLo(9,:)  = [1500    973  1000 989];
    %datHi(1,:) =  [1500   1173   800 1185];
    %datHi(2,:) =  [1500   1373   400 1381];
    %datLo(10,:) = [2500    773  1800 820];
    %datLo(11,:) = [2500    973  1600 997];
    %datHi(3,:) =  [2500   1173   700 1196];
    %datHi(4,:) =  [2500   1373   800 1390];

    %
    % Shifted strain stress
    %
%    datLo(1,:)  = [0.0002  258  1200 258];
%    datLo(2,:)  = [0.0002  298  1100 298];
%    datLo(3,:)  = [0.0002  373  1100 373];
%    datLo(4,:)  = [500     298   700 320];
%    datLo(5,:)  = [500     573   500 591];
%    datLo(6,:)  = [500     773   350 785];
%    datLo(7,:)  = [1500    298  1000 371];
%    datLo(8,:)  = [1500    573   700 614];
%    datLo(9,:)  = [1500    973   400 988];
%    datHi(1,:) =  [1500   1173   300 1185];
%    datHi(2,:) =  [1500   1373   200 1381];
%    datLo(10,:) = [2500    773   500 815];
%    datLo(11,:) = [2500    973   550 995];
%    datHi(3,:) =  [2500   1173   200 1193];
%    datHi(4,:) =  [2500   1373   200 1388];

    %
    % Raw strain stress
    %
    datLoLar(1,:)  = [0.0002  258  1500 258];
    datLoLar(2,:)  = [0.0002  298  1300 298];
    datLoLar(3,:)  = [0.0002  373  1700 373];
    datLo(1,:)  = [500     298   600 320];
    datLo(2,:)  = [500     573   510 591];
    datLo(3,:)  = [500     773   310 785];
    datLo(4,:)  = [1500    298   900 371];
    datLo(5,:)  = [1500    573   700 614];
    datLo(6,:)  = [1500    973   500 988];
    datLo(7,:)  = [2500    773   550 815];
    datLo(8,:)  = [2500    973   530 995];
    datHi(1,:)  = [1500   1173   300 1185];
    datHi(2,:)  = [1500   1373   160 1381];
    datHi(3,:)  = [2500   1173   210 1193];
    datHi(4,:)  = [2500   1373   260 1388];
    datLo = cat(1,datLoLar,datLo);
    dat = cat(1,datLo,datHi);

function [dat, datLo, datHi] = sigma_es_Rc45

    %
    % Raw true strain true stress
    %
    %datLo(1,:) = [0.0001 173 1500 173];
    %datLo(2,:) = [0.0001 298 1500 298];
    %datLo(3,:) = [0.0001 373 800 373];
    %datHi(1,:) = [1000   173 500 218];
    %datHi(2,:) = [1000   298 400 327];
    %datHi(3,:) = [1000   373 300 398];

    %
    % Shifted strain stress
    %
%    datLo(1,:) = [0.0001 173 300 173];
%    datLo(2,:) = [0.0001 298 100 298];
%    %datLo(3,:) = [0.0001 373 300 373];
%    datHi(1,:) = [1000   173 200 211];
%    datHi(2,:) = [1000   298 75 327];
%    datHi(3,:) = [1000   373 160 397];

    %
    % Raw strain stress
    %
    datLo(1,:) = [0.0001 173 270 173];
    datLo(2,:) = [0.0001 298  25 298];
    datLo(3,:) = [0.0001 373 365 373];
    datHi(1,:) = [1000   173 205 211];
    datHi(2,:) = [1000   298 130 327];
    datHi(3,:) = [1000   373 150 397];
    dat = cat(1,datLo,datHi);

    %
    % Raw strain stress (from Modified stress-strain data)
    %
%    datLo(1,:) = [0.0001 173 280 173];
%    datLo(2,:) = [0.0001 298 100 298];
%    %datLo(3,:) = [0.0001 373 360 373];
%    datHi(1,:) = [1000   173 235 211];
%    datHi(2,:) = [1000   298 155 327];
%    %datHi(3,:) = [1000   373 160 397];
%    dat = cat(1,datLo,datHi);

function [dat, datLo, datHi] = sigma_es_Rc49

    %
    % Raw true strain true stress
    %
    %datLo(1,:) = [0.0001 173 1500 173];
    %datLo(2,:) = [0.0001 298 1500 298];
    %datLo(3,:) = [0.0001 373 1200 373];
    %datHi(1,:) = [1000   173 490 207];
    %datHi(2,:) = [1000   298 400 336];
    %datHi(3,:) = [1000   373 500 397];

    %
    % Shifted strain stress
    %
%    datLo(1,:) = [0.0001 173 270 173];
%    datLo(2,:) = [0.0001 298 250 298];
%    %datLo(3,:) = [0.0001 373 380 373];
%    datHi(1,:) = [1000   298 260 334];
%    datHi(2,:) = [1000   373 280 397];
%    %datHi(3,:) = [1000   173 180 207];

    %
    % Raw strain stress
    %
    datLo(1,:) = [0.0001 173 230 173];
    datLo(2,:) = [0.0001 298 260 298];
    %datLo(3,:) = [0.0001 373 380 373];
    datHi(1,:) = [1000   298 280 334];
    datHi(2,:) = [1000   373 280 397];
    %datHi(3,:) = [1000   173 170 207];
    dat = cat(1,datLo,datHi);

    %
    % Raw strain stress (from modified stress-strain data)
    %
%    datLo(1,:) = [0.0001 173 230 173];
%    %datLo(2,:) = [0.0001 298 275 298];
%    %datLo(3,:) = [0.0001 373 400 373];
%    datHi(1,:) = [1000   298 265 334];
%    datHi(2,:) = [1000   373 275 397];
%    %datHi(2,:) = [1000   173 170 207];
%    dat = cat(1,datLo,datHi);

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
