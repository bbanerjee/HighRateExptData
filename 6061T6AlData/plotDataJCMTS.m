function plotDataJC

  clear all; close all;
  format short e;
  %ep    = [0.00   0.25   0.50   0.75  1.00   1.25   1.50   1.75 ];
  %epdot = [1.0e-6 1.0e-4 1.0e-2 1.0e0 1.0e1  1.0e2  1.0e4  1.0e6];
  %T =     [200    300    500    700    900   1100   1300   1600];
  color = [[0.9 0.1 0.1];[0.1 0.9 0.1];[0.1 0.1 0.9];[0.75 0.25 1.0];...
           [0.596 0.005 0.163]; [0.005 0.350 0.596];[0.379 0.596 0.005];...
           [0.595 0.377 0.0]];
  
  epdot = [1.0e-3 1.0e0 1.0e3 1.0e6];
  colorepdot = [[0.9 0.1 0.1];[0.1 0.9 0.1];[0.1 0.1 0.9];[0.75 0.25 1.0]];

  T =     [300 700 1100 1600];
  colorT = [[0.9 0.1 0.1];[0.1 0.9 0.1];[0.1 0.1 0.9];[0.75 0.25 1.0]];

  ep    = [0.00   0.3   0.6  1.0];
  colorep = [[0.9 0.1 0.1];[0.1 0.9 0.1];[0.1 0.1 0.9];[0.75 0.25 1.0]];

  %plotSigyepepdot(ep, epdot, T, colorepdot);
  %plotSigyepT(ep, epdot, T, colorT);
  %plotSigyepdotep(ep, epdot, T, colorep);
  %plotSigyepdotT(ep, epdot, T, colorT);
  %plotSigyTep(ep, epdot, T, colorep);
  plotSigyTepdot(ep, epdot, T, colorepdot);

%=====================================================================
function plotSigyepepdot(ep, epdot, T, color)

  %
  % Compute JC data for stress vs strain (at various strain rates)
  %
  epMin = 0;
  epMax = 1.0;
  nep = 500;
  dep = (epMax-epMin)/nep;
  for i=1:nep+1
    epp(i) = epMin + (i-1)*dep;
  end

  [n, m] = size(epdot);
  for i=1:length(epp)
    T_4 = 600;
    for j=1:m
      sig_JC_4(i,j) = calcJCep(epdot(j), epp(i), T_4);
      sig_MTS_4(i,j) = calcMTSep(epdot(j), epp(i), T_4);
    end
  end
  fig1 = figure;
  fig2 = figure;
  %set(fig1, 'Position', [412 313 915 632]);
  %set(fig2, 'Position', [412 313 915 632]);
  for j=1:m
    figure(fig1);
    p1(j) = plot(epp, sig_JC_4(:,j)/10^6, 'k-', 'LineWidth',2); hold on;
    set(p1(j), 'Color', color(j,:));
    figure(fig2);
    p2(j) = plot(epp, sig_MTS_4(:,j)/10^6, 'k-', 'LineWidth', 2); hold on;
    set(p2(j), 'Color', color(j,:));
    str_epdot(j,:) = sprintf('d\\epsilon/dt = %5s/s',num2str(epdot(j),'%3.0e'));
  end
  figure(fig1);
  tt = title('T = 600 K, various strain rates (JC)');
  xt = xlabel('\epsilon_p');
  yt = ylabel('\sigma_y (MPa)');
  set([tt xt yt], 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'XLim', [0 1], 'YLim', [0 1600]);
  axis square;
  legend(p1,str_epdot);
  figure(fig2);
  tt = title('T = 600 K, various strain rates (MTS)');
  xt = xlabel('\epsilon_p');
  yt = ylabel('\sigma_y (MPa)');
  set([tt xt yt], 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'XLim', [0 1], 'YLim', [0 1600]);
  axis square;
  legend(p2,str_epdot);

%=====================================================================
function plotSigyepT(ep, epdot, T, color)

  %
  % Compute JC data for stress vs strain (at various temperatures)
  %
  epmin = 0.0;
  epmax = 1.0;
  nep = 500;
  dep = (epmax-epmin)/nep;
  for i=1:nep+1
    epp(i) = epmin + (i-1)*dep;
  end
  [n, m] = size(T);
  for i=1:length(epp)
    epdot_3 = 1000.0;
    for j=1:m
      sig_JC_3(i,j) = calcJCep(epdot_3, epp(i), T(j));
      sig_MTS_3(i,j) = calcMTSep(epdot_3, epp(i), T(j));
    end
  end
  fig1 = figure;
  fig2 = figure;
  %set(fig1, 'Position', [412 313 915 632]);
  %set(fig2, 'Position', [412 313 915 632]);
  for j=1:m
    figure(fig1);
    p1(j) = plot(epp, sig_JC_3(:,j)/10^6, 'k-', 'LineWidth',2); hold on;
    set(p1(j), 'Color', color(j,:));
    figure(fig2);
    p2(j) = plot(epp, sig_MTS_3(:,j)/10^6, 'k-', 'LineWidth', 2); hold on;
    set(p2(j), 'Color', color(j,:));
    str_T(j,:) = sprintf('T = %4s K',num2str(T(j)));
  end
  figure(fig1);
  tt = title('Strain rate = 1000/s, various T (JC)');
  xt = xlabel('\epsilon_p');
  yt = ylabel('\sigma_y (MPa)');
  set([tt xt yt], 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'XLim', [0 1], 'YLim', [0 1600]);
  axis square
  legend(p1,str_T);
  figure(fig2);
  tt = title('Strain rate = 1000/s, various T (MTS)');
  xt = xlabel('\epsilon_p');
  yt = ylabel('\sigma_y (MPa)');
  set([tt xt yt], 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'XLim', [0 1], 'YLim', [0 1600]);
  axis square
  legend(p2,str_T);

%=====================================================================
function plotSigyepdotep(ep, epdot, T, color)

  %
  % Compute JC data for stress vs strain rate (at various strains)
  %
  epdotmin = -4;
  epdotmax = 6;
  nepdot = 100;
  depdot = (epdotmax-epdotmin)/nepdot;
  for i=1:nepdot+1
    eepdot = epdotmin + (i-1)*depdot;
    edot(i) = 10^eepdot;
  end

  [n, m] = size(ep);
  for i=1:length(edot)
    T_6 = 600;
    for j=1:m
      sig_JC_6(i,j) = calcJC(edot(i), ep(j), T_6);
      sig_MTS_6(i,j) = calcMTS(edot(i), ep(j), T_6);
    end
  end
  fig1 = figure;
  fig2 = figure;
  %set(fig1, 'Position', [412 313 915 632]);
  %set(fig2, 'Position', [412 313 915 632]);
  for j=1:m
    figure(fig1);
    p1(j) = semilogx(edot, sig_JC_6(:,j)/10^6, 'k-', 'LineWidth',2); hold on;
    set(p1(j), 'Color', color(j,:));
    figure(fig2);
    p2(j) = semilogx(edot, sig_MTS_6(:,j)/10^6, 'k-', 'LineWidth', 2); hold on;
    set(p2(j), 'Color', color(j,:));
    str_ep(j,:) = sprintf('\\epsilon = %4s',num2str(ep(j)));
  end
  figure(fig1);
  tt = title('T = 600 K, various \epsilon_p (JC)');
  xt = xlabel('d\epsilon_p/dt (/s)');
  yt = ylabel('\sigma_y (MPa)');
  set([tt xt yt], 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'XLim', [1.0e-4 1.0e6]);
  axis square;
  legend(p1,str_ep);
  figure(fig2);
  tt = title('T = 600 K, various \epsilon_p (MTS)');
  xt = xlabel('d\epsilon_p/dt (/s)');
  yt = ylabel('\sigma_y (MPa)');
  set([tt xt yt], 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'XLim', [1.0e-4 1.0e6]);
  axis square;
  legend(p2,str_ep);

%=====================================================================
function plotSigyepdotT(ep, epdot, T, color)

  %
  % Compute JC data for stress vs strain rate (at various temperatures)
  %
  epdotmin = -4;
  epdotmax = 6;
  nepdot = 100;
  depdot = (epdotmax-epdotmin)/nepdot;
  for i=1:nepdot+1
    eepdot = epdotmin + (i-1)*depdot;
    edot(i) = 10^eepdot;
  end

  [n, m] = size(T);
  for i=1:length(edot)
    ep_5 = 0.3;
    for j=1:m
      sig_JC_5(i,j) = calcJC(edot(i), ep_5, T(j));
      sig_MTS_5(i,j) = calcMTS(edot(i), ep_5, T(j));
    end
  end
  fig1 = figure;
  fig2 = figure;
  %set(fig1, 'Position', [412 313 915 632]);
  %set(fig2, 'Position', [412 313 915 632]);
  for j=1:m
    figure(fig1);
    p1(j) = semilogx(edot, sig_JC_5(:,j)/10^6, 'k-', 'LineWidth',2); hold on;
    set(p1(j), 'Color', color(j,:));
    figure(fig2);
    p2(j) = semilogx(edot, sig_MTS_5(:,j)/10^6, 'k-', 'LineWidth', 2); hold on;
    set(p2(j), 'Color', color(j,:));
    str_T(j,:) = sprintf('T = %4s K',num2str(T(j)));
  end
  figure(fig1);
  tt = title('\epsilon_p = 0.3, various T (JC)');
  xt = xlabel('d\epsilon_p/dt (/s)');
  yt = ylabel('\sigma_y (MPa)');
  set([tt xt yt], 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 16);
  axis square;
  legend(p1,str_T);
  figure(fig2);
  tt = title('\epsilon_p = 0.3, various T (MTS)');
  xt = xlabel('d\epsilon_p/dt (/s)');
  yt = ylabel('\sigma_y (MPa)');
  set([tt xt yt], 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 16);
  axis square;
  legend(p2,str_T);

%=====================================================================
function plotSigyTep(ep, epdot, T, color)

  %
  % Compute JC data for stress vs temp (at various strains)
  %
  Tmin = 150.0;
  Tmax = 1700.0;
  nT = 100;
  dT = (Tmax-Tmin)/nT;
  for i=1:nT+1
    TT(i) = Tmin + (i-1)*dT;
  end

  [n, m] = size(T);
  for i=1:length(TT)
    epdot_1 = 1000.0;
    for j=1:m
      sig_JC_1(i,j) = calcJC(epdot_1, ep(j), TT(i));
      sig_MTS_1(i,j) = calcMTS(epdot_1, ep(j), TT(i));
    end
  end
  fig1 = figure;
  fig2 = figure;
  %set(fig1, 'Position', [412 313 915 632]);
  %set(fig2, 'Position', [412 313 915 632]);
  fac = 1/m;
  for j=1:m
    figure(fig1);
    p1(j) = plot(TT, sig_JC_1(:,j)/10^6, 'k-', 'LineWidth',2); hold on;
    set(p1(j), 'Color', color(j,:));
    figure(fig2);
    p2(j) = plot(TT, sig_MTS_1(:,j)/10^6, 'k-', 'LineWidth', 2); hold on;
    set(p2(j), 'Color', color(j,:));
    str_ep(j,:) = sprintf('\\epsilon = %4s',num2str(ep(j)));
  end
  figure(fig1);
  tt = title('Strain Rate = 1000.0/s, various \epsilon_p (JC)');
  xt = xlabel('T (K)');
  yt = ylabel('\sigma_y (MPa)');
  set([tt xt yt], 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 16);
  axis square;
  legend(p1,str_ep);
  figure(fig2);
  tt = title('Strain Rate = 1000.0/s, various \epsilon_p (MTS)');
  xt = xlabel('T (K)');
  yt = ylabel('\sigma_y (MPa)');
  set([tt xt yt], 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 16);
  axis square;
  legend(p2,str_ep);

%=====================================================================
function plotSigyTepdot(ep, epdot, T, color)

  %
  % Compute JC data for stress vs temp (at various strain rates)
  %
  Tmin = 150.0;
  Tmax = 1700.0;
  nT = 100;
  dT = (Tmax-Tmin)/nT;
  for i=1:nT+1
    TT(i) = Tmin + (i-1)*dT;
  end

  [n, m] = size(T);
  for i=1:length(TT)
    ep_2 = 0.3;
    for j=1:m
      sig_JC_2(i,j) = calcJC(epdot(j), ep_2, TT(i));
      sig_MTS_2(i,j) = calcMTS(epdot(j), ep_2, TT(i));
    end
  end
  fig1 = figure;
  fig2 = figure;
  %set(fig1, 'Position', [412 313 915 632]);
  %set(fig2, 'Position', [412 313 915 632]);
  for j=1:m
    figure(fig1);
    p1(j) = plot(TT, sig_JC_2(:,j)/10^6, 'k-', 'LineWidth',2); hold on;
    set(p1(j), 'Color', color(j,:));
    figure(fig2);
    p2(j) = plot(TT, sig_MTS_2(:,j)/10^6, 'k-', 'LineWidth', 2); hold on;
    set(p2(j), 'Color', color(j,:));
    str_epdot(j,:) = sprintf('d\\epsilon/dt = %5s/s',num2str(epdot(j),'%3.0e'));
  end
  figure(fig1);
  tt = title('\epsilon_p = 0.3, various strain rates (JC)');
  xt = xlabel('T (K)');
  yt = ylabel('\sigma_y (MPa)');
  set([tt xt yt], 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 16);
  axis square;
  legend(p1,str_epdot);
  figure(fig2);
  tt = title('\epsilon_p = 0.3, various strain rates (MTS)');
  xt = xlabel('T (K)');
  yt = ylabel('\sigma_y (MPa)');
  set([tt xt yt], 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 16);
  axis square;
  legend(p2,str_epdot);

%=====================================================================
%
% Compute Johnson-Cook data
%
function [sig_y] = calcJC(epdot, ep, T0)

  %Rc = 40;
  Rc = 38;
  rho = 7830.0;
  T = T0;
  %if (epdot > 10.0)
  %  delT = 1.0e-2/epdot;
  %  tmax = ep/epdot;
  %  m = tmax/delT;
  %  epval = 0.0;
  %  for i=1:m
  %    sig_y = JC(epdot, epval, T, Rc);
  %    epval = epval + epdot*delT;
  %    Cp = calcCp(T);
  %    fac = 0.9/(rho*Cp);
  %    T = T + sig_y*epdot*fac*delT; 
  %  end
  %end
  sig_y = JC(epdot, ep, T, Rc);

function [sig_y] = calcJCep(epdot, ep, T0)

  %Rc = 40;
  Rc = 38;
  rho = 7830.0;
  T = T0;
  if (epdot > 10.0)
    delT = 1.0e-2/epdot;
    tmax = ep/epdot;
    m = tmax/delT;
    epval = 0.0;
    for i=1:m
      sig_y = JC(epdot, epval, T, Rc);
      epval = epval + epdot*delT;
      Cp = calcCp(T);
      fac = 0.9/(rho*Cp);
      T = T + sig_y*epdot*fac*delT; 
    end
  end
  sig_y = JC(epdot, ep, T, Rc);


%
% Compute MTS data
%
function [sig_y] = calcMTS(epdot, ep, T0)

  %Rc = 40;
  Rc = 38;
  rho = 7830.0;
  rho0 = 7830.0;
  T = T0;
  %if (epdot > 10.0)
  %  delT = 1.0e-2/epdot;
  %  tmax = ep/epdot;
  %  m = tmax/delT;
  %  epval = 0.0;
  %  for i=1:m
  %    sig_y = MTS(epdot, epval, T, T0, rho, rho0, Rc);
  %    epval = epval + epdot*delT;
  %    Cp = calcCp(T);
  %    fac = 0.9/(rho*Cp);
  %    T = T + sig_y*epdot*fac*delT; 
  %    %ee = [i m epdot ep T T0 rho rho0 Rc]
  %  end
  %end
  sig_y = MTS(epdot, ep, T, T0, rho, rho0, Rc);

function [sig_y] = calcMTSep(epdot, ep, T0)

  %Rc = 40;
  Rc = 38;
  rho = 7830.0;
  rho0 = 7830.0;
  T = T0;
  if (epdot > 10.0)
    delT = 1.0e-2/epdot;
    tmax = ep/epdot;
    m = tmax/delT;
    epval = 0.0;
    for i=1:m
      sig_y = MTS(epdot, epval, T, T0, rho, rho0, Rc);
      epval = epval + epdot*delT;
      Cp = calcCp(T);
      fac = 0.9/(rho*Cp);
      T = T + sig_y*epdot*fac*delT; 
      %ee = [i m epdot ep T T0 rho rho0 Rc]
    end
  end
  sig_y = MTS(epdot, ep, T, T0, rho, rho0, Rc);

%
%  Get JC yield stress
%
function [sigy] = JC(epdot, ep, T, Rc)

  %
  % Compute A from A(Rc) relation
  %
  A1 = 0.0355;
  A2 = 5.5312;
  %A = exp(A1*(Rc-2) + A2)*1.0e6;
  A = exp(A1*Rc + A2)*1.0e6;
  B = 0.6439;
  n = 0.26;
  C = 0.014;
  m = 1.03;
  Tr = 298.0;
  Tm = 1793.0;
  if (T < 298)
    m = 1.0;
  elseif (T > 1040)
    m = 0.5;
  end
  ep0 = 1.0;
  epdot = epdot/ep0;

  eppart = A*(1 + B*ep^n);
  %if (epdot < 1.0)
  %  epdotpart = (1 + epdot)^C; 
  %else
    epdotpart = 1 + C*log(epdot);
  %end
  Tstar = (T - Tr)/(Tm - Tr);
  Tpart = 1 - Tstar^m;

  sigy = eppart*epdotpart*Tpart;

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
  kappa = 1.38e-23;
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
  if (sigy < 0 | ~isreal(sigy) | mu == 0)
    ss = [epdot ep T sigy sigma_a s_i sigma_i s_e sigma_e sigma_es mu mu_0 Tm]
    %pause
  end

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
  if (sigma_e < 0)
   sse = [theta_0 theta_IV sigma_es ep FX]
  end

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

