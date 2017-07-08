function plotRangeSigi

  clear all; close all;
  format short e;

  %
  % Plot S_i vs T (at various strain rates)
  %
  fig1 = figure;
  set(fig1, 'Position', [412 313 915 632]);

  epdot = [1.0e-6 1.0e-4 1.0e-2 1.0e0 1.0e1  1.0e2  1.0e4  1.0e6];
  color = [[1 0 0];[0 1 0];[0 0 1];[0.75 0.25 1.0];[0.25 0.75 1.0]; ...
           [0.25 1.0 0.75];[0.75 1.0 0.25];[0.8 0.2 0.0]];

  Tmin = 200;
  Tmax = 1800;
  nT = 100;
  dT = (Tmax-Tmin)/nT;

  for i=1:length(epdot)
    edot = epdot(i);
    for j=1:nT+1
      T1(j) = Tmin + (j-1)*dT;
      S_i(j) = calcMTS(edot, T1(j));
    end
    p2(i) = plot(T1, S_i, 'k--', 'LineWidth', 2); hold on;
    set(p2(i), 'Color', color(i,:));
    %str_ep(i,:) = sprintf('edot = %5.5g /s',edot);
  end
  xt = xlabel('T (K)');
  yt = ylabel('S_i');
  set([xt yt], 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 16);
  %legend(p2,str_ep,-1);
  clear all

  %
  % Plot S_i vs edot (at various T)
  %
  fig2 = figure;
  set(fig2, 'Position', [412 313 915 632]);

  T =     [200    300    500    700    900   1100   1300   1600];
  color = [[1 0 0];[0 1 0];[0 0 1];[0.75 0.25 1.0];[0.25 0.75 1.0]; ...
           [0.25 1.0 0.75];[0.75 1.0 0.25];[0.8 0.2 0.0]];

  edotmin = -6;
  edotmax = 8;
  nedot = 100;
  dedot = (edotmax-edotmin)/nedot;

  for i=1:length(T)
    T0 = T(i);
    for j=1:nedot+1
      l10edot = edotmin + (j-1)*dedot;
      edot(j) = 10^(l10edot); 
      S_i(j) = calcMTS(edot(j), T0);
    end
    p2(i) = semilogx(edot, S_i, 'k--', 'LineWidth', 2); hold on;
    set(p2(i), 'Color', color(i,:));
    %str_ep(i,:) = sprintf('T = %4.0g', T0);
  end
  xt = xlabel('edot (/s)');
  yt = ylabel('S_i');
  set([xt yt], 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 16);
  %legend(p2,str_ep,-1);

%
% Compute MTS data
%
function [S_i] = calcMTS(epdot, T0)

  Rc = 38;
  rho = 7830.0;
  rho0 = 7830.0;
  T = T0;
  S_i = MTS(epdot, T, T0, rho, rho0, Rc);

%
% Get MTS yield stress
%
function [S_i] = MTS(epdot, T, T0, rho, rho0, Rc)

  %
  % Compute mu_0 (value of mu at T = 0)
  %
  P = calcP(rho, rho0, 0, 0);
  Tm = calcTm(rho, rho0);
  mu_0 = calcmu(rho, rho0, Tm, P, 0);

  %
  % Compute mu
  %
  P = calcP(rho, rho0, T, T0);
  Tm = calcTm(rho, rho0);
  mu = calcmu(rho, rho0, Tm, P, T);

  %
  % Get sigma_i and g_0i
  %
  [sigma_i, g_0i] = getSigmai(Rc, T);

  %
  % Compute s_i
  %
  kappa = 1.3806503e-23;
  b = 2.48e-10;
  epdot_0i = 1.0e8;
  p_i = 2.0/3.0;
  q_i = 1.0;
  S_i = (1.0 - (kappa*T/(mu*b^3*g_0i)*log(epdot_0i/epdot))^(1/q_i))^(1/p_i);
  if (~isreal(S_i))
    SS = [S_i kappa T mu b g_0i sigma_i epdot_0i epdot q_i p_i]
    S_i = 0.0;
    %pause
  end


%
% Get sigma_i and g_0i
%
function [sigma_i, g_0i] = getSigmai(Rc, T)

  if (T > 1040)
    sigma_i = 896.14;
  else
    sigma_i = 44.629*Rc - 361.38;
  end
  sigma_i = sigma_i*1.0e6;
  g_0i = 1.5083;
  return;

  %
  % Multiple temperature fit (sig-eps)
  %
  if (T > 1040)
    g_0i = 0.57582;
    %g_0i = 2.0;
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
      g_0i    = -1.7601e-03*Rc^3 + 2.2908e-01*Rc^2 - 9.8074e+00*Rc + 1.3888e+02;
      sigma_i =  0.29934*Rc^3 - 38.296*Rc^2 + 1643.8*Rc - 22062;
    end
  end
  sigma_i = sigma_i*1.0e6;

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
  if (isnan(p))
    pp = [p eta Cv zeta E]
    pause
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
  if (isnan(Tm))
    Tmm = [Tmm Tm0 eta Gfac Bfac p]
    pause
  end

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
  if (isnan(mu))
    TT = [Tm T P denom t0 J eta t1 t2 mu]
    pause
  end

