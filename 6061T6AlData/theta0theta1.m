function theta0theta1

close all;
fig1 = figure;
set(fig1, 'Position', [412 313 915 632]);

load AlDataVoce.dat
dat = AlDataVoce;

theta0 = dat(:,1);
theta1 = dat(:,2);
T0 = dat(:,3);

plot(T0, theta0, 'rs', 'LineWidth', 2, 'MarkerSize', 10);hold on;
[C,S] = polyfit(T0,theta0,1);
xmin = 70;
xmax = max(T0)+10;
nx = 100;
dx = xmax/nx;
for i=1:nx+1
  xfit(i) = xmin + (i-1)*dx;
  yfit(i) = C(2) + C(1)*xfit(i);
end
plot(xfit, yfit, 'b-', 'LineWidth', 3); hold on;

set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
% set(gca, 'XLim',[0 800], 'YLim', [-50 200]);
xlabel('Temperatute (K)', 'FontName', 'bookman', 'FontSize', 16);
ylabel('\theta_0 (MPa) ', 'FontName', 'bookman', 'FontSize', 16);




fig2 = figure;
set(fig2, 'Position', [412 313 915 632]);
plot(T0, theta1, 'rs', 'LineWidth', 2, 'MarkerSize', 10);hold on;
[C,S] = polyfit(T0,theta1,1);
xmin = 70;
xmax = max(T0)+10;
nx = 100;
dx = xmax/nx;
for i=1:nx+1
  xfit(i) = xmin + (i-1)*dx;
  yfit(i) = C(2) + C(1)*xfit(i);
end
plot(xfit, yfit, 'b-', 'LineWidth', 3); hold on;


set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
% set(gca, 'XLim',[0 0.5], 'YLim', [-50 200]);
xlabel('Temperature (K)', 'FontName', 'bookman', 'FontSize', 16);
ylabel('\theta_1 (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
