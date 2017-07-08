%=========================================================================
% Compute the values of sigma_i and g_0i
%  Calculate for each of the sources of sources of data (unlike
%  for a combination of all the data in Step 5)
%
function Step6_CalcSigi

  %
  % Assumed constants
  %
  rho0 = 2700.0;
  k = 1.3806503e-23;
  b = 2.86e-10; % Wang, Physica Status Solidi A, 169(43), 1998, p. 46.
  sig_a = 0.0e6;
  edot_0i = 5.0e8;
  p_i = 0.75;
  q_i = 1.0;
  matConst = [rho0 sig_a edot_0i p_i q_i k b];

  fidA = fopen('MTSParams.dat','w');
  fprintf(fidA,'rho0 = 2700.0\n');
  fprintf(fidA,'k = 1.3806503e-23\n');
  fprintf(fidA,'b = 2.86e-10\n');
  fprintf(fidA,'sig_a = 0.0e6\n');
  fprintf(fidA,'edot_0i = 5.0e8\n');
  fprintf(fidA,'p_i = 0.75\n');
  fprintf(fidA,'q_i = 1.0\n');

  color = [[0.90 0.10 0.10];[0.10 0.90 0.10];[0.10 0.10 0.90];...
           [0.75 0.25 1.00];[1.00 0.75 0.25];[0.15 0.30 0.70];...
           [0.10 0.80 0.30];[0.25 0.75 1.00];[0.66 0.60 0.00];...
           [0.60 0.20 0.00];[0.60 0.72 0.00];[0.30 0.55 0.60]];
  symbol = ['o', 's', 'd', 'v', 'p', '^', 'h', 'x', '<', '+', '.'];

  fit = 0;
  %fid = fopen('AlSigiGoi.dat','w');

  %fig = figure;
  load ProcData/AlHogeEp0.dat;
  [sigma_i(1,:), g0i(1,:)] = calcSigi(AlHogeEp0, ...
     'ProcData/AlHogeFisherEp0.dat', matConst, color(1,:), symbol(1), fit);
  %fprintf(fid,'Hoge_________ %g %g %g %f %f %f\n', ...
  %   sigma_i(1,1), sigma_i(1,2), sigma_i(1,3), ...
  %   g0i(1,1), g0i(1,2), g0i(1,3));

  %fig = figure;
  load ProcData/AlGeenEleicheEp0.dat;
  [sigma_i(2,:), g0i(2,:)] = calcSigi(AlGeenEleicheEp0, ...
     'ProcData/AlGreenFisherEp0.dat', matConst, color(2,:), symbol(2), fit);
  %fprintf(fid,'Green________ %g %g %g %f %f %f\n', ...
  %   sigma_i(2,1), sigma_i(2,2), sigma_i(2,3), ...
  %   g0i(2,1), g0i(2,2), g0i(2,3));

  %fig = figure;
  load ProcData/AlASMHEp0.dat;
  [sigma_i(3,:), g0i(3,:)] = calcSigi(AlASMHEp0, ...
     'ProcData/AlASMHFisherEp0.dat', matConst, color(3,:), symbol(3), fit);
  %fprintf(fid,'ASMH_________ %g %g %g %f %f %f\n', ...
  %   sigma_i(3,1), sigma_i(3,2), sigma_i(3,3), ...
  %   g0i(3,1), g0i(3,2), g0i(3,3));

  %fig = figure;
  load ProcData/AlDavidsonEp0.dat;
  [sigma_i(4,:), g0i(4,:)] = calcSigi(AlDavidsonEp0, ...
     'ProcData/AlDavidsonFisherEp0.dat', matConst, color(4,:), symbol(4), fit);
  %fprintf(fid,'Davidson_____ %g %g %g %f %f %f\n', ...
  %   sigma_i(4,1), sigma_i(4,2), sigma_i(4,3), ...
  %   g0i(4,1), g0i(4,2), g0i(4,3));

  %fig = figure;
  load ProcData/AlRosenbergEp0.dat;
  [sigma_i(5,:), g0i(5,:)] = calcSigi(AlRosenbergEp0, ...
     'ProcData/AlRosenbergFisherEp0.dat', matConst, color(5,:), symbol(5), fit);
  %fprintf(fid,'Rosenberg____ %g %g %g %f %f %f\n', ...
  %   sigma_i(5,1), sigma_i(5,2), sigma_i(5,3), ...
  %   g0i(5,1), g0i(5,2), g0i(5,3));

  %fig = figure;
  load ProcData/AlYadavEp0.dat;
  [sigma_i(6,:), g0i(6,:)] = calcSigi(AlYadavEp0, ...
     'ProcData/AlYadavFisherEp0.dat', matConst, color(6,:), symbol(6), fit);
  %fprintf(fid,'Yadav________ %g %g %g %f %f %f\n', ...
  %   sigma_i(6,1), sigma_i(6,2), sigma_i(6,3), ...
  %   g0i(6,1), g0i(6,2), g0i(6,3));

  %fig = figure;
  load ProcData/AlOgawaEp0.dat;
  [sigma_i(7,:), g0i(7,:)] = calcSigi(AlOgawaEp0, ...
     'ProcData/AlOgawaFisherEp0.dat', matConst, color(7,:), symbol(7), fit);
  %fprintf(fid,'Ogawa________ %g %g %g %f %f %f\n', ...
  %   sigma_i(7,1), sigma_i(7,2), sigma_i(7,3), ...
  %   g0i(7,1), g0i(7,2), g0i(7,3));

  %fig = figure;
  load ProcData/AlLeeEp0.dat;
  [sigma_i(8,:), g0i(8,:)] = calcSigi(AlLeeEp0, ...
     'ProcData/AlLeeFisherEp0.dat', matConst, color(8,:), symbol(8), fit);
  %fprintf(fid,'Lee__________ %g %g %g %f %f %f\n', ...
  %   sigma_i(8,1), sigma_i(8,2), sigma_i(8,3), ...
  %   g0i(8,1), g0i(8,2), g0i(8,3));

  %fig = figure;
  load ProcData/AlFishCadyEp0.dat;
  [sigma_i(9,:), g0i(9,:)] = calcSigi(AlFishCadyEp0, ...
     'ProcData/AlFishCadyFisherEp0.dat', matConst, color(9,:), symbol(9), fit);
  %fprintf(fid,'FishCady_____ %g %g %g %f %f %f\n', ...
  %   sigma_i(9,1), sigma_i(9,2), sigma_i(9,3), ...
  %   g0i(9,1), g0i(9,2), g0i(9,3));

  %fig = figure;
  load ProcData/AlLesuerRameshEp0.dat;
  [sigma_i(10,:), g0i(10,:)] = calcSigi(AlLesuerRameshEp0, ...
     'ProcData/AlLesuerFisherEp0.dat', matConst, color(10,:), symbol(10), fit);
  %fprintf(fid,'LesuerRamesh_ %g %g %g %f %f %f\n', ...
  %   sigma_i(10,1), sigma_i(10,2), sigma_i(10,3), ...
  %   g0i(10,1), g0i(10,2), g0i(10,3));

  %sigma_i
  %g0i

  %meanSigi = mean(sigma_i)
  %meanG0i = mean(g0i)
  %fprintf(fid,'Mean_________ %g %g %g %f %f %f\n', ...
  %   meanSigi(1), meanSigi(2), meanSigi(3), ...
  %   meanG0i(1), meanG0i(2), meanG0i(3));

  %stdSigi = std(sigma_i)
  %stdG0i = std(g0i)
  %fprintf(fid,'Std__________ %g %g %g %f %f %f\n', ...
  %   stdSigi(1), stdSigi(2), stdSigi(3), ...
  %   stdG0i(1), stdG0i(2), stdG0i(3));

  fit = 1;
  AlDataEp0 = [AlHogeEp0;AlGeenEleicheEp0;AlASMHEp0; ...
               AlDavidsonEp0;AlRosenbergEp0;AlYadavEp0; ...
               AlOgawaEp0;...
               AlLeeEp0;AlFishCadyEp0; ...
               AlLesuerRameshEp0];
  [sig_i, g_0i] = calcSigi(AlDataEp0, ...
     'ProcData/AlDataFisherEp0.dat', matConst, [0 0 0], symbol(11), fit);
  sig_i
  g_0i
  %fprintf(fid,'All__________ %g %g %g %f %f %f\n', ...
  %   sig_i(1), sig_i(2), sig_i(3), ...
  %   g_0i(1), g_0i(2), g_0i(3));
  %fclose(fid);

  fprintf(fidA,'sig_i_lo = %g\n',sig_i(1));
  fprintf(fidA,'sig_i = %g\n',sig_i(2));
  fprintf(fidA,'sig_i_hi = %g\n',sig_i(3));
  fprintf(fidA,'g_0i_lo = %g\n',g_0i(1));
  fprintf(fidA,'g_0i = %g\n',g_0i(2));
  fprintf(fidA,'g_0i_hi = %g\n',g_0i(3));
  fclose(fidA);

function [sig_i, g_0i] = calcSigi(dat, outfile, matConst, color, symbol, fit)

  %
  % Compute Fisher Plot
  %
  [CAl, ciAl] = computeFisherPlot(dat, outfile, '6061-T6 Al', ...
                            matConst, color, symbol, fit);

  if (fit == 0) 
    sig_i = [0 0 0];
    g_0i = [0 0 0];
    return;
  end

  rho0 = matConst(1);
  sig_a = matConst(2);
  edot_0i = matConst(3);
  p_i = matConst(4);
  q_i = matConst(5);
  k = matConst(6);
  b = matConst(7);

  P = calcP(rho0, rho0, 0, 0);
  Tm = calcTm(rho0, rho0);
  mu_0 = calcmu(rho0, rho0, Tm, P, 0);

  sigma_i_mu0_pi = CAl(2);
  sigma_i_mu0_pi_lo = ciAl(1,2);
  sigma_i_mu0_pi_hi = ciAl(2,2);

  sigma_i_mu0 = sigma_i_mu0_pi^(1/p_i);
  sigma_i_mu0_lo = sigma_i_mu0_pi_lo^(1/p_i);
  sigma_i_mu0_hi = sigma_i_mu0_pi_hi^(1/p_i);

  sigma_i = sigma_i_mu0*mu_0;
  sigma_i_lo = sigma_i_mu0_lo*mu_0;
  sigma_i_hi = sigma_i_mu0_hi*mu_0;

  oog0i_qi = -CAl(1)/CAl(2);
  oog0i_qi_lo = -ciAl(1,1)/ciAl(1,2);
  oog0i_qi_hi = -ciAl(2,1)/ciAl(2,2);

  oog0i = oog0i_qi^(q_i/2);
  oog0i_lo = oog0i_qi_lo^(q_i/2);
  oog0i_hi = oog0i_qi_hi^(q_i/2);

  g0i = 1/oog0i;
  g0i_lo = 1/oog0i_lo;
  g0i_hi = 1/oog0i_hi;

  sig_i = [sigma_i_lo sigma_i sigma_i_hi];
  g_0i = [g0i_lo g0i g0i_hi];

  str = sprintf('\\sigma_i = %5.0f MPa, g_{0i} = %5.3g', sigma_i*1.0e-6, g0i);
  gtext(str, 'FontName', 'bookman', 'FontSize', 14);
  
%====================================================================
% Compute the Fisher plot data
%
function [C0, ci0] = computeFisherPlot(dat, fileName, label, matConst, ...
                                 color, symbol, fit)

  %fig = figure;
  %
  % Read material constants
  %
  rho0 = matConst(1);
  sig_a = matConst(2);
  edot_0i = matConst(3);
  p_i = matConst(4);
  q_i = matConst(5);
  k = matConst(6);
  b = matConst(7);

  P = calcP(rho0, rho0, 0, 0);
  Tm = calcTm(rho0, rho0);
  mu_0 = calcmu(rho0, rho0, Tm, P, 0);

  %
  % Compute Fisher data
  %
  dat = sortrows(dat, 3);
  edot = dat(:,2);
  T = dat(:,3);
  sig_y = dat(:,6)*1.0e6; % Convert to MPa for computations
  rho = rho0;

  [n,m] = size(dat);
  for i=1:n
    P = calcP(rho, rho0, T(i), T(i));
    Tm = calcTm(rho, rho0);
    mu(i) = calcmu(rho, rho0, Tm, P, T(i));
    Tmp0 = calcTm(rho0, rho0);
    mup0 = calcmu(rho0, rho0, Tmp0, 0, T(i));
    sig_a = sig_a*mu(i)/mu_0;
    xx(i) = (k*T(i)/(mu(i)*b^3)*log(edot_0i/edot(i)))^(1/q_i);
    yy(i) = ((sig_y(i) - sig_a)/mu(i))^p_i;
    str = sprintf('(%g,  %g)',edot(i),T(i));
    %text(xx(i)+0.005,yy(i),str); hold on;
  end
  p0 = plot(xx, yy, 'rs', 'LineWidth', 2, 'MarkerSize', 8); hold on;
  set(p0, 'Color', color, 'Marker', symbol);
  set(gca, 'XLim', [0 0.7], 'YLim', [0 0.05] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('x = [k_b T/ \mu b^3 ln(\epsilon_{0i}/ \epsilon)]^{1/q_i}', ...
         'FontName', 'bookman', 'FontSize', 16);
  ylabel('y = [(\sigma_y - \sigma_a)/\mu]^{p_i} ', ...
         'FontName', 'bookman', 'FontSize', 16);
  title(label, 'FontName', 'bookman', 'FontSize', 16);
  axis square;

  if (fit == 0)
    C0 = [0 0];
    ci0 = [[0 0];[0 0]];
    return;  
  end

  %
  % Fit a quadratic to the data
  %
  [C0, S] = curveFitPoly(xx, yy);
  C = [C0(1) 0 C0(2)];
  xmin = 0.0;
  xmax = max(xx)+0.1;
  nx = 100;
  xfit = linspace(xmin, xmax, nx);
  yfit = polyval(C, xfit);
  p10 = plot(xfit, yfit, 'b-', 'LineWidth', 3); hold on;
  set(p10, 'Color', color);
  str = sprintf('y = %5.2g - %5.2g x^2', C0(2), -C0(1));
  %gtext(str, 'FontName', 'bookman', 'FontSize', 14);

  %
  %  Calculate residuals
  %
  ypred = polyval(C, xx);
  resid = yy - ypred;

  %
  %  Calculate R^2
  %
  dev = yy - mean(yy);
  SST = sum(dev.^2);
  SSE = sum(resid.^2);
  Rsq = 1 - SSE/SST

  %
  %  Calculate  f-statistic
  %
  SSR = SST - SSE;
  dfr = 2;
  dfe = length(xx) - 1 - dfr;
  MSE = SSE/dfe;
  MSR = SSR/dfr;
  f = MSR/MSE
  [dfr dfe];

  %
  %  Calculate student t
  %
  R = S.R;
  d = (R'*R)\eye(2);
  d = diag(d)';
  MSE = (S.normr^2)/(S.df-2);
  se = sqrt(MSE*d);
  t = C0./se
  S.df;

  %
  % Calculate confidence interval of coeffs
  %
  %tval = 0.678;  % Student's t for 81 samples at 75% confidence
  %tval = 1.663;  % Student's t for 81 samples at 95% confidence
  tval = 2.373;  % Student's t for 81 samples at 99% confidence
  width = tval*se;
  ci0 = [C0-width; C0+width];
  ci = [[ci0(1,1) 0 ci0(1,2)];...
        [ci0(2,1) 0 ci0(2,2)]];

  %
  % Plot confidence interval
  %
  hold on;
  yfitlo = polyval(ci(1,:), xfit);
  yfithi = polyval(ci(2,:), xfit);
  p2 = plot(xfit, yfitlo, 'b--', 'LineWidth', 3); hold on;
  set(p2, 'Color', color);
  p3 = plot(xfit, yfithi, 'b--', 'LineWidth', 3); hold on;
  set(p3, 'Color', color);

  %
  % Save the data
  %
  fileName2 = sprintf('%s.quad',fileName);
  fid = fopen(fileName2,'w');
  for i=1:n
    fprintf(fid,'%g %g %g %g %g %g\n', ...
            xx(i), yy(i), T(i), edot(i), sig_y(i)*1.0e-6, mu(i)/1.0e6);
  end
  fclose(fid);


%====================================================================
% Fit a curve to the data of the form
%   y = a1*x^2 + a2
% Assume that x is a n x 1 vector
%
function [C, S] = curveFitPoly(x, y)

  n = length(y);

  xx = x.*x;

  b(1) = sum(y.*xx);
  A(1,1) = sum(xx.*xx);
  A(1,2) = sum(xx);

  b(2) = sum(y);
  A(2,1) = A(1,2);
  A(2,2) = n;

  C = (A\b')'

  [Q, R] = qr(A);

  CC = [C(1) 0 C(2)];
  ypred = polyval(CC, x);
  resid = y - ypred;

  S = struct('R',R,'df',n-1,'normr',norm(resid));

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
  %gtext(str, 'FontName', 'bookman', 'FontSize', 14);

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

