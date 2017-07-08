%=========================================================================
% Compute the values of sigma0_es and g_0es
%
function calcSige6061

  %
  % Assumed constants
  %
  rho0 = 2700.0;
  edot_es0 = 1.0e13;
  matConst = [rho0 edot_es0];

  %
  % Compute Fisher Plot
  %
  load AlDataSiges.dat
  dat = AlDataSiges;
  [CAl] = computeFisherPlot(dat, 'AlDataFisherSiges.dat', '6061-T6 Al', ...
                            matConst);

  sigma0_es = exp(CAl(2));
  g_0es = -1/CAl(1);

  str = sprintf('\\sigma_{es0} = %g, g_{0es} = %g', sigma0_es, g_0es);
  gtext(str, 'FontName', 'bookman', 'FontSize', 14);
  
%===========================================================================
%
%
% Compute the Fisher plot data
%
function [C] = computeFisherPlot(dat, fileName, label, matConst)

  fig = figure;
  set(fig, 'Position', [412 313 915 632]);
  %
  % Read material constants
  %
  rho0 = matConst(1);
  edot_es0 = matConst(2);
  %
  % Compute Fisher data
  %
  dat = sortrows(dat, 3);
  sig_es = dat(:,1)*1.0e6;
  T_es = dat(:,3);
  T0 = dat(:,4);
  edot = dat(:,5);
  rho = 2700.0;
  k = 1.3806503e-23;
  b = 2.86e-10; % Wang, Physica Status Solidi A, 169(43), 1998, p. 46.

  [n,m] = size(dat);
  for i=1:n
    P = calcP(rho, rho0, T_es(i), T0(i));
    Tm = calcTm(rho, rho0);
    mu(i) = calcmu(rho, rho0, Tm, P, T_es(i));
    xx(i) = k*T_es(i)/(mu(i)*b^3)*log(edot_es0/edot(i));
    yy(i) = log(sig_es(i));
    str = sprintf('(%g,  %g)',edot(i),T0(i));
    text(xx(i)+0.005,yy(i),str); hold on;
  end
  plot(xx, yy, 'rs', 'LineWidth', 2, 'MarkerSize', 8); hold on;
  [C,S] = polyfit(xx,yy,1);
  calcRSq(xx,yy,C);
  xmin = 0.0;
  xmax = max(xx)+0.1;
  nx = 100;
  dx = xmax/nx;
  for i=1:nx+1
    xfit(i) = xmin + (i-1)*dx;
    yfit(i) = C(2) + C(1)*xfit(i);
  end
  plot(xfit, yfit, 'b-', 'LineWidth', 3); hold on;

  %set(gca, 'XLim', [0 xmax], 'YLim', [min(yfit)-0.01 max(yfit)+0.01] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('x = k_b T/ \mu b^3 ln(\epsilon_{es0}/ \epsilon)', ....
         'FontName', 'bookman', 'FontSize', 16);
  ylabel('y = ln(\sigma_{es})', ...
         'FontName', 'bookman', 'FontSize', 16);
  title(label, 'FontName', 'bookman', 'FontSize', 16);
  axis square;
  str = sprintf('y = %g - %g x', C(2), -C(1));
  gtext(str, 'FontName', 'bookman', 'FontSize', 14);

  %
  % Save the data
  %
  fid = fopen(fileName,'w');
  for i=1:n
    fprintf(fid,'%g %g %g %g %g %g %g\n', ...
            xx(i), yy(i), T0(i), T_es(i), edot(i), sig_es(i), mu(i)/1.0e6);
  end
  fclose(fid);

%====================================================================
% Compute R^2 for the straight line fit to the data
%
function calcRSq(x, y, c)
 
  n = length(x);
  xbar = mean(x);
  ybar = mean(y);
  xstd = std(x);
  ystd = std(y);
  covar = 0.0;
  for i=1:n
    covar = covar + (x(i)-xbar)*(y(i)-ybar);
  end
  r = covar/(n*xstd*ystd);
  rsq = r^2
  str = sprintf('R^2 = %g', rsq);
  gtext(str, 'FontName', 'bookman', 'FontSize', 14);

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

