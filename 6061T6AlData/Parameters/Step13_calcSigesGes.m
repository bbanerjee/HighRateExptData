%=========================================================================
% Compute the values of sigma0_es and g_0es
%  (Data are organized in terms of source and are based on the 
%   files generated in Step9)
%
function calcSigesAl

  fig = figure;
  set(fig, 'Position', [412 313 915 632]);

  %
  % Assumed constants
  %
  rho0 = 2700.0;
  k = 1.3806503e-23;
  b = 2.86e-10; % Wang, Physica Status Solidi A, 169(43), 1998, p. 46.
  edot_es0 = 1.0e8;
  matConst = [rho0 edot_es0 k b];

  fidA = fopen('MTSParams.dat','a');
  fprintf(fidA, 'edot_es0 = 1.0e8\n');

  color = [[0.90 0.10 0.10];[0.10 0.90 0.10];[0.10 0.10 0.90];...
           [0.75 0.25 1.00];[1.00 0.75 0.25];[0.15 0.30 0.70];...
           [0.10 0.80 0.30];[0.25 0.75 1.00];[0.66 0.60 0.00];...
           [0.60 0.20 0.00];[0.60 0.72 0.00];[0.30 0.55 0.60];...
           [0 0 0]];
  symbol = ['o', 's', 'd', ...
            'v', 'p', '^', ...
            'h', 'x', '<', ...
            '+', '>', '*', ...
            '.'];
  fit = 0;

  load SigeEpData/SigeEp0000010s533KHog.dat.satur
  load SigeEpData/SigeEp0000010s644KHog.dat.satur
  load SigeEpData/SigeEp0000048s297KHog.dat.satur
  load SigeEpData/SigeEp18s533KHog.dat.satur
  load SigeEpData/SigeEp23s644KHog.dat.satur
  load SigeEpData/SigeEp28s297KHog.dat.satur
  load SigeEpData/SigeEp54s644KHog.dat.satur
  load SigeEpData/SigeEp65s297KHog.dat.satur
  load SigeEpData/SigeEp130s533KHog.dat.satur

  AlDataSigesHoge = [...
     SigeEp0000010s533KHog;...
     SigeEp0000010s644KHog;...
     SigeEp0000048s297KHog;...
     SigeEp18s533KHog;...
     SigeEp23s644KHog;...
     SigeEp28s297KHog;...
     SigeEp54s644KHog;...
     SigeEp65s297KHog;...
     SigeEp130s533KHog];
  [C, ci] = computeFisherPlot(AlDataSigesHoge, ...
                              './SigesData/AlDataFisherSigesHoge.dat', ...
                              '6061-T6 Al', ...
                              matConst, fit, color(1,:), symbol(1));

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

  AlDataSigesOgawa = [...
     SigeEp000057s77KOga; ...
     SigeEp000057s201KOga; ...
     SigeEp000057s289KOga; ...
     SigeEp000057s373KOga; ...
     SigeEp000057s473KOga; ...
     SigeEp1500s201KOga; ...
     SigeEp1500s289KOga; ...
     SigeEp1500s373KOga; ...
     SigeEp1500s473KOga; ...
     SigeEp1500s77KOga];
  [C, ci] = computeFisherPlot(AlDataSigesOgawa, ...
                              './SigesData/AlDataFisherSigesOgawa.dat', ...
                              '6061-T6 Al', ...
                              matConst, fit, color(2,:), symbol(2));

  load SigeEpData/SigeEp0001s295KFis.dat.satur
  load SigeEpData/SigeEp2500s295KFis.dat.satur

  AlDataSigesFish = [...
     SigeEp0001s295KFis; ...
     SigeEp2500s295KFis];
  [C, ci] = computeFisherPlot(AlDataSigesFish, ...
                              './SigesData/AlDataFisherSigesFish.dat', ...
                              '6061-T6 Al', ...
                              matConst, fit, color(3,:), symbol(3));

  load SigeEpData/SigeEp0001s298KCad.dat.satur
  load SigeEpData/SigeEp4000s298KCad.dat.satur

  AlDataSigesCady = [...
     SigeEp0001s298KCad; ...
     SigeEp4000s298KCad];
  [C, ci] = computeFisherPlot(AlDataSigesCady, ...
                              './SigesData/AlDataFisherSigesCady.dat', ...
                              '6061-T6 Al', ...
                              matConst, fit, color(4,:), symbol(4));

  load SigeEpData/SigeEp0001s300K01MPaDav.dat.satur
  load SigeEpData/SigeEp0001s367K01MPaDav.dat.satur
  load SigeEpData/SigeEp0001s422K01MPaDav.dat.satur
  load SigeEpData/SigeEp0001s478K01MPaDav.dat.satur

  AlDataSigesDavidson = [...
     SigeEp0001s300K01MPaDav; ...
     SigeEp0001s367K01MPaDav; ...
     SigeEp0001s422K01MPaDav; ...
     SigeEp0001s478K01MPaDav];
  [C, ci] = computeFisherPlot(AlDataSigesDavidson, ...
                              './SigesData/AlDataFisherSigesDavidson.dat', ...
                              '6061-T6 Al', ...
                              matConst, fit, color(5,:), symbol(5));

  load SigeEpData/SigeEp0001s422KGre.dat.satur
  load SigeEpData/SigeEp0001s589KGre.dat.satur
  load SigeEpData/SigeEp0002s295KGre.dat.satur
  load SigeEpData/SigeEp9s422KGre.dat.satur
  load SigeEpData/SigeEp10s589KGre.dat.satur
  load SigeEpData/SigeEp18s295KGre.dat.satur

  AlDataSigesGreen = [...
     SigeEp0001s422KGre; ...
     SigeEp0001s589KGre; ...
     SigeEp0002s295KGre; ...
     SigeEp9s422KGre; ...
     SigeEp10s589KGre; ...
     SigeEp18s295KGre];
  [C, ci] = computeFisherPlot(AlDataSigesGreen, ...
                              './SigesData/AlDataFisherSigesGreen.dat', ...
                              '6061-T6 Al', ...
                              matConst, fit, color(6,:), symbol(6));

  load SigeEpData/SigeEp0002s298KASM.dat.satur
  load SigeEpData/SigeEp0002s373KASM.dat.satur
  load SigeEpData/SigeEp0002s422KASM.dat.satur
  load SigeEpData/SigeEp0002s477KASM.dat.satur
  load SigeEpData/SigeEp0002s535KASM.dat.satur
  load SigeEpData/SigeEp0002s589KASM.dat.satur
  load SigeEpData/SigeEp0002s644KASM.dat.satur

  AlDataSigesASMH = [...
     SigeEp0002s298KASM; ...
     SigeEp0002s373KASM; ...
     SigeEp0002s422KASM; ...
     SigeEp0002s477KASM; ...
     SigeEp0002s535KASM; ...
     SigeEp0002s589KASM; ...
     SigeEp0002s644KASM];
  [C, ci] = computeFisherPlot(AlDataSigesASMH, ...
                              './SigesData/AlDataFisherSigesASMH.dat', ...
                              '6061-T6 Al', ...
                              matConst, fit, color(7,:), symbol(7));

  load SigeEpData/SigeEp1000s298KLee.dat.satur
  load SigeEpData/SigeEp2000s298KLee.dat.satur
  load SigeEpData/SigeEp3000s298KLee.dat.satur
  load SigeEpData/SigeEp4000s298KLee.dat.satur

  AlDataSigesLee = [...
     SigeEp1000s298KLee; ...
     SigeEp2000s298KLee; ...
     SigeEp3000s298KLee; ...
     SigeEp4000s298KLee];
  [C, ci] = computeFisherPlot(AlDataSigesLee, ...
                              './SigesData/AlDataFisherSigesLee.dat', ...
                              '6061-T6 Al', ...
                              matConst, fit, color(8,:), symbol(8));

  load SigeEpData/SigeEp1000s298KRos.dat.satur
  load SigeEpData/SigeEp1000s463KRos.dat.satur
  load SigeEpData/SigeEp1000s618KRos.dat.satur

  AlDataSigesRosenberg = [...
     SigeEp1000s298KRos; ...
     SigeEp1000s463KRos; ...
     SigeEp1000s618KRos];
  [C, ci] = computeFisherPlot(AlDataSigesRosenberg, ...
                              './SigesData/AlDataFisherSigesRosenberg.dat', ...
                              '6061-T6 Al', ...
                              matConst, fit, color(9,:), symbol(9));

  load SigeEpData/SigeEp380s298KYad.dat.satur
  load SigeEpData/SigeEp500s298KYad.dat.satur
  load SigeEpData/SigeEp2000s298KYad.dat.satur
  load SigeEpData/SigeEp3600s298KYad.dat.satur

  AlDataSigesYadav = [...
     SigeEp380s298KYad; ...
     SigeEp500s298KYad; ...
     SigeEp2000s298KYad; ...
     SigeEp3600s298KYad];
  [C, ci] = computeFisherPlot(AlDataSigesYadav, ...
                              './SigesData/AlDataFisherSigesYadav.dat', ...
                              '6061-T6 Al', ...
                              matConst, fit, color(10,:), symbol(10));

  load SigeEpData/SigeEp4000s298KLes.dat.satur
  load SigeEpData/SigeEp8000s298KLes.dat.satur

  AlDataSigesLesuer = [...
     SigeEp4000s298KLes; ...
     SigeEp8000s298KLes];
  [C, ci] = computeFisherPlot(AlDataSigesLesuer, ...
                              './SigesData/AlDataFisherSigesLesuer.dat', ...
                              '6061-T6 Al', ...
                              matConst, fit, color(11,:), symbol(11));

  load SigeEpData/SigeEp29000s298KRam.dat.satur

  AlDataSigesRamesh = [...
     SigeEp29000s298KRam];
  [C, ci] = computeFisherPlot(AlDataSigesRamesh, ...
                              './SigesData/AlDataFisherSigesRamesh.dat', ...
                              '6061-T6 Al', ...
                              matConst, fit, color(12,:), symbol(12));

  %
  % Compute Fisher Plot
  %
  fit = 1;
  AlDataSiges = [...
     AlDataSigesHoge; ...
     AlDataSigesOgawa; ...
     AlDataSigesFish; ...
     AlDataSigesCady; ...
     AlDataSigesDavidson; ...
     AlDataSigesGreen; ...
     AlDataSigesASMH; ...
     AlDataSigesLee; ...
     AlDataSigesRosenberg; ...
     AlDataSigesYadav; ...
     AlDataSigesLesuer; ...
     AlDataSigesRamesh];
  [CAl, ciAl] = computeFisherPlot(AlDataSiges, ...
                              './SigesData/AlDataFisherSiges.dat', ...
                              '6061-T6 Al', ...
                              matConst, fit, color(13,:), symbol(13));
    
  sigma0_es = exp(CAl(2));
  g_0es = -1/CAl(1);

  sigma0_es_lo = exp(ciAl(1,2)); 
  g_0es_lo = -1/ciAl(1,1);

  sigma0_es_hi = exp(ciAl(2,2)); 
  g_0es_hi = -1/ciAl(2,1);

  sig0es = [sigma0_es_lo sigma0_es sigma0_es_hi]
  g0es = [g_0es_lo g_0es g_0es_hi]

  str = sprintf('\\sigma_{es0} = %g, g_{0es} = %g', sigma0_es, g_0es);
  %gtext(str, 'FontName', 'bookman', 'FontSize', 14);

  fprintf(fidA, 'sig_0es_lo = %g\n', sigma0_es_lo);
  fprintf(fidA, 'sig_0es = %g\n', sigma0_es);
  fprintf(fidA, 'sig_0es_hi = %g\n', sigma0_es_hi);
  fprintf(fidA, 'g_0es_lo = %g\n', g_0es_lo);
  fprintf(fidA, 'g_0es = %g\n', g_0es);
  fprintf(fidA, 'g_0es_hi = %g\n', g_0es_hi);
  fclose(fidA);
  
%===========================================================================
%
%
% Compute the Fisher plot data
%
function [C, ci] = computeFisherPlot(dat, fileName, label, matConst, ...
                                     fit, color, symbol)

  %
  % Read material constants
  %
  rho0 = matConst(1);
  edot_es0 = matConst(2);
  k = matConst(3);
  b = matConst(4);
  rho = rho0;

  %
  % Compute Fisher data
  %
  sig_es = dat(:,5)*1.0e6;
  T_es = dat(:,6);
  edot = dat(:,7);
  T0 = dat(:,8);

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

  %
  % Plot Fisher data
  %
  pp = plot(xx, yy, 'rs', 'LineWidth', 2, 'MarkerSize', 8); hold on;
  set(pp, 'Color', color', 'Marker', symbol);
  %set(gca, 'XLim', [0 xmax], 'YLim', [min(yfit)-0.01 max(yfit)+0.01] );
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('x = k_b T/ \mu b^3 ln(\epsilon_{es0}/ \epsilon)', ....
         'FontName', 'bookman', 'FontSize', 16);
  ylabel('y = ln(\sigma_{es})', ...
         'FontName', 'bookman', 'FontSize', 16);
  title(label, 'FontName', 'bookman', 'FontSize', 16);
  axis square;

  %
  % Save the data
  %
  fid = fopen(fileName,'w');
  for i=1:n
    fprintf(fid,'%g %g %g %g %g %g %g\n', ...
            xx(i), yy(i), T0(i), T_es(i), edot(i), sig_es(i), mu(i)/1.0e6);
  end
  fclose(fid);

  if (fit == 0)
    C = [0 0];
    ci = [[0 0];[0 0]];
    return;  
  end

  %
  % Fit a straight line to the data
  %
  [C,S] = polyfit(xx,yy,1);
  xmin = 0.0;
  xmax = max(xx)+0.1;
  nx = 100;
  xfit = linspace(xmin, xmax, nx);
  yfit = polyval(C, xfit);
  p1 = plot(xfit, yfit, 'b-', 'LineWidth', 3); hold on;
  set(p1, 'Color', color);
  str = sprintf('y = %g - %g x', C(2), -C(1));
  %gtext(str, 'FontName', 'bookman', 'FontSize', 14);

  %
  %  Calculate and plot residuals
  %
  %figure
  ypred = polyval(C, xx);
  resid = yy - ypred;
  %plot(ypred, resid, 'o');

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
  dfr = 1;
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
  MSE = (S.normr^2)/S.df;
  se = sqrt(MSE*d);
  t = C./se
  S.df;

  %
  % Calculate confidence interval of coeffs
  %
  tval = 2.401;  % Student's t for 52 samples at 99% confidence
  width = tval*se;
  ci = [C-width; C+width]
  C

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

