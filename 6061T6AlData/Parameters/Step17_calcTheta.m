function calcTheta

  marker = ['o';'p';'v';'s';'d';'^';'h';'<';'x';'>';'+';'*'];
  color = [[0.90 0.10 0.10];[0.10 0.90 0.10];[0.10 0.10 0.90];...
           [0.75 0.25 1.00];[1.00 0.75 0.25];[0.15 0.30 0.70];...
           [0.30 0.50 0.80];[0.25 0.75 1.00];[0.66 0.60 0.00];...
           [0.60 0.20 0.00];[0.60 0.72 0.00];[0.30 0.55 0.60]];

  load AlDataTheta.dat;
  dat = AlDataTheta;

  theta0_1 = dat(:,1); 
  theta1_1 = dat(:,2); 

  theta0_2 = dat(:,3); 
  theta1_2 = dat(:,4); 

  theta0_3 = dat(:,5); 
  theta1_3 = dat(:,6); 

  theta0_4 = dat(:,7); 
  theta1_4 = dat(:,8); 

  T1 = dat(:,9);
  edot = dat(:,10);
  T0 = dat(:,11);

  %
  % Fit and Plot data
  %
  fig1 = figure;
  set(fig1,'Position',[182 280 1131 813]);
  subplot(1,2,1);
  [p0] = fitThetaT(T0, theta0_1, edot, marker(1,:), color(1,:));
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim', [0 700]);
  xlabel('T (K)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(1,2,2);
  [p1] = fitThetaT(T1, theta1_1, edot, marker(2,:), color(2,:));
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim', [0 700]);
  xlabel('T (K)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  fig2 = figure;
  set(fig2,'Position',[182 280 1131 813]);
  subplot(1,2,1);
  [p0] = fitThetaT(T0, theta0_2, edot, marker(3,:), color(3,:));
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim', [0 700]);
  xlabel('T (K)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(1,2,2);
  [p1] = fitThetaT(T1, theta1_2, edot, marker(4,:), color(4,:));
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim', [0 700]);
  xlabel('T (K)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  fig3 = figure;
  set(fig3,'Position',[182 280 1131 813]);
  subplot(1,2,1);
  [p0] = fitThetaT(T0, theta0_3, edot, marker(5,:), color(5,:));
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim', [0 700]);
  xlabel('T (K)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(1,2,2);
  [p1] = fitThetaT(T1, theta1_3, edot, marker(6,:), color(6,:));
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim', [0 700]);
  xlabel('T (K)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  fig4 = figure;
  set(fig4,'Position',[182 280 1131 813]);
  subplot(1,2,1);
  [p0] = fitThetaT(T0, theta0_4, edot, marker(7,:), color(7,:));
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim', [0 700]);
  xlabel('T (K)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);

  subplot(1,2,2);
  [p1] = fitThetaT(T1, theta1_4, edot, marker(8,:), color(8,:));
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  %set(gca, 'XLim', [0 700]);
  xlabel('T (K)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);


%=======================================================================
% Fit straight lines to data
%
function [p1] = fitThetaT(T, theta, edot, marker, color)

  %
  % Plot Data
  %
  for i=1:length(T)
    p0 = plot(T(i), theta(i), 'o'); hold on;
    set(p0, 'LineWidth', 2, 'Color', color, 'MarkerSize', 8, 'Marker', marker);
    str0 = sprintf('%g', edot(i));
    text(T(i), theta(i), str0);
  end
  
  %
  % Fit data
  %
  fit = polyfit(T, theta, 1);
  Tmin = 0;
  Tmax = 700;
  nT = 2;
  dT = Tmax/nT;
  for i=1:nT+1
    Tfit(i) = Tmin + (i-1)*dT;
  end
  thetafit = polyval(fit, Tfit);
  p1 = plot(Tfit, thetafit, 'b--', 'LineWidth', 3); hold on;
  set(p1,'LineWidth',2,'Color',color,'MarkerSize',5,'Marker',marker);

  str = sprintf('\\theta = %g T + %g',fit(1), fit(2));
  gtext(str, 'FontName', 'bookman', 'FontSize', 16);


