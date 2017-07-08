function testModelAl

  %
  % Test the specific heat model
  %
  %testSpecificHeatModel;

  %
  % Test the EOS model
  %
  %testEOSModel;

  %
  % Test the melting temperature model
  %
  %testMeltTempModel;

  %
  % Test the shear modulus models
  %
  testMuModel;

function testSpecificHeatModel

  figure;

  %
  % Expt data Cp from Desai
  % ( P. D. Desai, 1987, Thermodynamic properties of aluminum, 
  %   Int. J. Thermophys., 8(5), pp. 621-638.)
  %
  load ExptData/AlSpHeatDesai87.dat
  Tex00 = AlSpHeatDesai87(:,1);
  Cpex00 = AlSpHeatDesai87(:,2);

  %
  % Plot Experimental data
  %
  p00 = plot(Tex00, Cpex00, 'o'); hold on;
  set(p00, 'LineWidth', 2, 'Color', [0.4 0.1 0.7]);

  fid = fopen('ExptData/CpAlExpt.dat','w');
  for i=1:length(Tex00)
    fprintf(fid,'[%f,%f],',Tex00(i),Cpex00(i));
  end
  fclose(fid);

  %
  % Plot Cp vs T
  % 
  Tmin = 0.0;
  Tmax = 1000.0;
  nT = 100;
  delT = (Tmax-Tmin)/nT;
  for i=1:nT
    Tcp(i) = Tmin + i*delT;
    Cp(i)  = calcCp(Tcp(i));
  end
  p10 = plot(Tcp, Cp);
  set(p10, 'LineWidth', 2, 'Color', [0.1 0.1 0.1]);
  set(gca, 'YLim', [0 1400], 'YTick', [0 200 400 600 800 1000 1200 1400]);
  set(gca, 'XLim', [0 1000], 'XTick', [0 250 500 750 1000]);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel(' T (K)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel(' C_p (J/kg-K) ', 'FontName', 'bookman', 'FontSize', 16);
  axis square;
  legend([p00 p10], ...
         'Desai (1987)',...
         'Model');

function testEOSModel

  fig = figure;
  set(fig, 'Position', [379 482 711 562]);

  %
  % Data from McQueen, Vaidya, and Mitchell.
  %  1. R. G. McQueen, S. P. Marsh, J. W. Taylor, J. N. Fritz, and W. J. Carter, 1970,
  %     The equation of state of solids from shock wave studies, 
  %     in High Velocity Impact Phenomena (R. Kinslow, ed.), pp. 293~V417, 
  %     New York: Academic Press.
  %  2. S. N. Vaidya and K. G. C., 1970, Compressibility of 18 metals to 45 kbar, 
  %     Phys. Chem.  Solids, 31, pp. 2329-2345.
  %  3. A. C. Mitchell and W. J. Nellis, 1981, Shock compression of aluminum, copper and
  %     tantalum, J. Appl. Phys., 52(5), pp. 3363-3374.
  %
  load ExptData/AlEOSMcQueen70.dat
  load ExptData/AlEOSVaidya70.dat
  load ExptData/AlEOSMitchell81.dat

  invEtaEx1 = AlEOSMcQueen70(:,1);
  presEx1 = AlEOSMcQueen70(:,2);
  etaEx1 = 1.0./invEtaEx1;
  pEx1 = plot(etaEx1, presEx1, 's'); hold on;
  set(pEx1, 'LineWidth', 2, 'MarkerSize', 8);
  set(pEx1, 'Color', [0.4 0.9 0.1]);
  
  invEtaEx2 = AlEOSVaidya70(:,1);
  presEx2 = AlEOSVaidya70(:,2);
  etaEx2 = 1.0./invEtaEx2;
  pEx2 = plot(etaEx2, presEx2, 'd'); hold on;
  set(pEx2, 'LineWidth', 2, 'MarkerSize', 8);
  set(pEx2, 'Color', [0.1 0.2 0.9]);
  
  invEtaEx3 = AlEOSMitchell81(:,1);
  presEx3 = AlEOSMitchell81(:,2);
  etaEx3 = 1.0./invEtaEx3;
  pEx3 = plot(etaEx3, presEx3, 'o'); hold on;
  set(pEx3, 'Color', [0.9 0.1 0.1]);
  set(pEx3, 'LineWidth', 2, 'MarkerSize', 8);
  
  fid = fopen('ExptData/EOSAlExpt.dat','w');
  for i=1:length(etaEx1)
    fprintf(fid,'[%f,%f],',etaEx1(i),presEx1(i));
  end
  for i=1:length(etaEx2)
    fprintf(fid,'[%f,%f],',etaEx2(i),presEx2(i));
  end
  for i=1:length(etaEx3)
    fprintf(fid,'[%f,%f],',etaEx3(i),presEx3(i));
  end
  fclose(fid);

  %
  % Plot P vs eta for various T 
  %
  rho0 = 2700.0;
  etaMin = 0.9;
  etaMax = 1.9;
  neta = 100;
  deta = (etaMax-etaMin)/neta;
  for i=1:neta+1
   eta(i) = etaMin + (i-1)*deta;
  end
  Tp = [300 500 900];
  for i=1:length(Tp)
    for j=1:length(eta)
      rho(j) = eta(j)*rho0;
      P(i,j) = calcP(rho(j), rho0, Tp(i), Tp(1));
    end
  end
  for i=1:length(Tp)
    p2(i) = plot(eta, P(i,:)/10^9, 'LineWidth', 2); hold on;
  end
  set(p2(1), 'Color', [0.0 0.0 1.0], 'LineStyle', '-');
  set(p2(2), 'Color', [1.0 0.0 0.0], 'LineStyle', '--');
  set(p2(3), 'Color', [0.21 0.79 0.13], 'LineStyle', '-.');
  set(gca, 'XLim', [0.9 1.9], 'XTick', [0.9 1.1 1.3 1.5 1.7 1.9]);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('\eta = \rho/\rho_0', 'FontName', 'bookman', 'FontSize', 16);
  ylabel(' Pressure (GPa) ', 'FontName', 'bookman', 'FontSize', 16);

  legend([pEx1 pEx2 pEx3...
          p2(1) p2(2) p2(3)], ...
          'McQueen et al. (1970) (2024 Al)',...
          'Vaidya et al. (1970) (6061-T6 Al)',...
          'Mitchell et al. (1981) (Pure Al)',...
          'Model (300K)', 'Model (500K)', 'Model (900K)');
  axis square;

%
% Test the melting temperature model
%
function testMeltTempModel

  figure;

  %
  % Load data from Boehler and Burakovsky
  % 1. Boehler R., Ross M., 1997, "Melting curve of aluminum in a diamond cell to 0.8 Mbar:
  %    implications for iron", Earth and Planetary Science Letters, 153, 223-227.
  % 2. Burakovsky L., Preston D.L., Silbar R. R., 2000, "Analysis of dislocation mechanism 
  %    for melting of elements: Pressure dependence", Journal of Applied Physics, 
  %    88(11), 6294-6301, 2000.
  %
  load ExptData/AlTmBoehler97.dat
  load ExptData/AlTmBura00.dat

  Pex00 = AlTmBoehler97(:,1)*0.1;
  Tmex00 = AlTmBoehler97(:,2);
  Tmex00L = Tmex00 - AlTmBoehler97(:,3);
  Tmex00U = AlTmBoehler97(:,4) - Tmex00;
  Pex01 = AlTmBura00(:,1);
  Tmex01 = AlTmBura00(:,2);
  Tmex01L = Tmex01 - AlTmBura00(:,3);
  Tmex01U = AlTmBura00(:,4) - Tmex01;

  p00 = plot(Pex00, Tmex00, 'o'); hold on;
  p00e = errorbar(Pex00, Tmex00, Tmex00L, Tmex00U, 'o');
  p01 = plot(Pex01, Tmex01, 'o'); hold on;
  p01e = errorbar(Pex01, Tmex01, Tmex01L, Tmex01U, 'o');
  set(p00, 'LineWidth', 2, 'MarkerSize', 8, 'Color', [0.1 0.5 0.6]);
  set(p00e, 'LineWidth', 2, 'MarkerSize', 8, 'Color', [0.1 0.5 0.6]);
  set(p01, 'LineWidth', 2, 'MarkerSize', 8, 'Color', [0.5 0.6 0.1]);
  set(p01e, 'LineWidth', 2, 'MarkerSize', 8, 'Color', [0.5 0.6 0.1]);

  rho0 = 2700.0;
  T = 300.0;
  T0 = T;
  etaMax = 2.0;
  etaMin = 0.8;
  nEta = 150.0;
  delEta = (etaMax-etaMin)/nEta;
  for i=1:nEta
    eta = etaMin + i*delEta;
    rho(i) = eta*rho0;
    P(i) = calcP(rho(i), rho0, T, T0);
    TmSCG(i) = calcTmSCG(rho(i), rho0);
    TmBPS(i) = calcTmBPS(rho(i), rho0);
  end
  
  p10 = plot(P*1.0e-9, TmSCG, '-'); hold on;
  p11 = plot(P*1.0e-9, TmBPS, '-.'); hold on;
  set(p10, 'LineWidth', 2, 'Color', [0.9 0.1 0.1]);
  set(p10, 'MarkerSize', 8, 'MarkerFaceColor', [0.9 0.1 0.1]);
  set(p11, 'LineWidth', 2, 'Color', [0.1 0.1 0.85]);
  set(p11, 'MarkerSize', 8, 'MarkerFaceColor', [0.1 0.1 0.85]);

  set(gca, 'XLim', [-50 150], 'XTick', [-50 0 50 100 150]);
  set(gca, 'YLim', [0 6000], 'YTick', [0 2000 4000 6000]);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel(' Pressure (GPa)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel(' T_m (K) ', 'FontName', 'bookman', 'FontSize', 16);
  axis square;
  legend([p00 p01 p10 p11], ...
         'Boehler and Ross (1997)', ...
         'Burakovsky et al. (2000)', ...
         'SCG Melt Model', ...
         'BPS Melt Model');

function testMuModel

  %
  % Experimental data from Tallon, 1979
  % 1. Tallon, J.L., and Wolfenden, A., 1979, "Temperature dependece of the
  %    elastic constants of aluminum," J. Phys. Chem. Solids, 40, pp. 831-837.
  %
  %
  % Experimental data from AMH, 1996
  % 2. W. Brown, H. Mindlin, and C. Y. Ho, 1996, Aerospace structural metals handbook:
  %    Volume 3: Code 3206. CINDAS/USAF CRDA Handbooks Operation, Purdue
  %    University, West Lafayette, IN..
  %
  load ExptData/AlMuKTallon79.dat
  T00 = AlMuKTallon79(:,1);
  mu00 = 0.5*(AlMuKTallon79(:,2)+AlMuKTallon79(:,3))*10.0;
  K00 = AlMuKTallon79(:,5)*10.0;

  load ExptData/AlMuAMH96.dat;
  T01 = AlMuAMH96(:,1);
  mu01 = AlMuAMH96(:,2);

  rho0 = 2700.0;
  eta = [0.9 1.0 1.1];
  [nr, mr] = size(eta);
  for i=1:mr
    rho(i) = eta(i)*rho0;
  end
  
  for i=1:1001
    T(i) = 2*(i-1);
  end

  [nt, mt] = size(T);
  for i=1:mr
    Tm(i) = calcTmBPS(rho(i), rho0);
    for j=1:mt
      P(i,j) = calcP(rho(i), rho0, T(j), T(j));
      muMTS(i,j) = calcmuMTS(T(j), Tm(i));
      KMTS(i,j) = calcKMTS(T(j));
      muSCG(i,j) = calcmuSCG(rho(i), rho0, Tm(i), P(i,j), T(j));
      muNP(i,j) = calcmuNP(rho(i), rho0, Tm(i), P(i,j), T(j));
    end
  end

  %
  % Plot mu vs T/Tm for various rho (MTS model)
  %
  figure;
  Tm1 = calcTmSCG(rho0, rho0);
  p00 = plot(T00/Tm1, K00, 'ms', 'LineWidth', 3); hold on;
  p0 = plot(T00/Tm1, mu00, 'rd', 'LineWidth', 3); hold on;
  p1 = plot(T01/Tm1, mu01, 'go', 'LineWidth', 3); hold on;
  set(p1, 'Color', [0.2 0.4 0.8]);
  p300 = plot(T/Tm(2), KMTS(2,:)/10^9, 'c-.', 'LineWidth', 3); hold on;
  p30 = plot(T/Tm(2), muMTS(2,:)/10^9, 'k-.', 'LineWidth', 3); hold on;
  set(p30, 'LineStyle', '-', 'Color', [0.1 0.1 0.1]);
  set(gca, 'XLim', [0 1.1], 'YLim', [0 50] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('T/T_m', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('Shear Modulus (GPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p0 p1 p30], ...
         'Tallon (1979)', ...
         'ASMH (1996)', ...
         'MTS (\eta = 1.0)');
  axis square;

  %
  % Plot mu vs T/Tm for various rho (SCG model)
  %
  figure;
  Tm1 = calcTmSCG(rho0, rho0);
  p0 = plot(T00/Tm1, mu00, 'rd', 'LineWidth', 3); hold on;
  p1 = plot(T01/Tm1, mu01, 'go', 'LineWidth', 3); hold on;
  set(p1, 'Color', [0.2 0.4 0.8]);
  for i=1:mr
    p3(i) = plot(T/Tm(i), muSCG(i,:)/10^9, 'k--', 'LineWidth', 3); hold on;
  end
  set(p3(1), 'LineStyle', '--', 'Color', [0.1 0.1 0.9]);
  set(p3(2), 'LineStyle', '-', 'Color', [0.1 0.1 0.1]);
  set(p3(3), 'LineStyle', '-.', 'Color', [0.4 0.7 0.1]);
  set(gca, 'XLim', [0 1.1], 'YLim', [0 50] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('T/T_m', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('Shear Modulus (GPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p0 p1 p3(1) p3(2) p3(3)], ...
         'Tallon (1979)', ...
         'ASMH (1996)', ...
         'SCG (\eta = 0.9)','SCG (\eta = 1.0)', 'SCG (\eta = 1.1)');
  axis square;

  %
  % Plot mu vs T/Tm for various rho (MTS model)
  %
  figure;
  Tm1 = calcTmSCG(rho0, rho0);
  p0 = plot(T00/Tm1, mu00, 'rd', 'LineWidth', 3); hold on;
  p1 = plot(T01/Tm1, mu01, 'go', 'LineWidth', 3); hold on;
  set(p1, 'Color', [0.2 0.4 0.8]);
  for i=1:mr
    p3(i) = plot(T/Tm(i), muNP(i,:)/10^9, 'k-','LineWidth', 3); hold on;
  end
  set(p3(1), 'LineStyle', '--', 'Color', [0.1 0.1 0.9]);
  set(p3(2), 'LineStyle', '-', 'Color', [0.1 0.1 0.1]);
  set(p3(3), 'LineStyle', '-.', 'Color', [0.4 0.7 0.1]);
  set(gca, 'XLim', [0 1.1], 'YLim', [0 50] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('T/T_m', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('Shear Modulus (GPa) ', 'FontName', 'bookman', 'FontSize', 16);
  legend([p0 p1 p3(1) p3(2) p3(3)], ...
         'Tallon (1979)', ...
         'ASMH (1996)', ...
         'NP (\eta = 0.9)','NP (\eta = 1.0)', 'NP (\eta = 1.1)');
  axis square;

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

function [Tm] = calcTmSCG(rho, rho0)

  Tm0 = 934.0;
  Gamma0 = 2.23;
  a = 3.0;

  eta = rho/rho0;
  power = 2.0*(Gamma0 - a - 1.0/3.0);
  Tm = Tm0*exp(2.0*a*(1.0 - 1.0/eta))*eta^power;

function [Tm] = calcTmBPS(rho, rho0)

  %
  % Constants and derivative from Guinan and Steinberg, 1974
  %
  B0 = 0.76e11; 
  dB_dp0 = 4.42;
  G0 = 0.261e11;
  dG_dp0 = 1.8;

  %
  % Calculate the pressure using Murnaghan EOS
  %
  eta = rho/rho0;
  p = calcP(rho, rho0, 300, 300);

  %
  % BPS parameters for Al at T = 300K and p = 0
  %
  %kappa = 1;  %Screw dislocation
  %kappa = 1.5;  %Edge dislocation
  kappa = 1.25;  % Mixed
  z = 12.0; % fcc-hcp lattice
  %z = 8.0; % bcc lattice
  %b2rhoTm = 0.64;
  %b2rhoTm = b2rhoTm-0.14;
  %b2rhoTm = b2rhoTm+0.14;
  b2rhoTm = 0.72;
  alpha = 2.9;
  lambda = 1.41; % fcc/hcp lattice
  %lambda = 1.30; % bcc lattice
  %lambda = 1.33;
  rad = 0.1431e-9; % Al
  %rad = 0.1278e-9; % Cu
  %rad = 0.1241e-9; % Fe
  a = 2*sqrt(2)*rad; % fcc
  %a = 4/sqrt(3)*rad; % bcc
  vws = a^3/4; % fcc crystal
  %vws = a^3/2; % bcc crystal
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
  %Tm = Tm0*Bfac^(-1/dB_dp0)*(1.0 + Gfac*Bfac^(-1.0/(3.0*dB_dp0)));
  Tm = Tm0/eta*(1.0 + Gfac/eta^(1/3));

function [K] = calcKMTS(T)

  %
  % Compute mu
  %
  K_0 = 77.0e9;
  D = 6.20e9;
  T_0 = 260;
  if (T == 0)
    T = 0.01;
  end
  K = K_0 - D/(exp(T_0/T) - 1);

function [mu] = calcmuMTS(T, Tm)

  %
  % Compute mu
  %
  mu_0 = 28.5e9;
  D = 4.55e9;
  T_0 = 298;
  if (T == 0)
    T = 0.01;
  end
  That = T/Tm;
  if (That > 1.0)
    mu = 0;
  else
    mu = mu_0 - D/(exp(T_0/T) - 1);
  end

function [mu] = calcmuSCG(rho, rho0, Tm, P, T)

  mu0 = 26.1e9;
  dmu_dp = 1.8;
  dmu_dT = 0.0156e9;
  dmu_dp_mu0 = dmu_dp/mu0;
  dmu_dT_mu0 = dmu_dT/mu0;

  That = T/Tm;
  if (That > 1.0)
    mu = 0;
  else
    eta = (rho/rho0)^(1/3);
    mu = mu0*(1 + dmu_dp_mu0*P/eta - dmu_dT_mu0*(T - 300));
  end

function [mu] = calcmuNP(rho, rho0, Tm, P, T)

  mu0 = 33.3e9;
  zeta = 0.04;
  dmu_dp = 1.8;
  dmu_dp_mu0 = dmu_dp/mu0;
  %C = 0.047;
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

