function mediantheta0theta1

close all;
fig1 = figure;
set(fig1, 'Position', [412 313 915 632]);

load AlDataVoce.dat
dat = AlDataVoce;

theta0 = dat(:,1);
theta1 = dat(:,2);
T0 = dat(:,3);
edot = dat(:,4);
meanTheta0 = mean(theta0);

[n,m] = size(dat);
for i = 1:n
    str = sprintf('(%g,  %g)',edot(i),T0(i));
    text(T0(i)+5,theta0(i),str); hold on;
end

plot(T0, theta0, 'rs', 'LineWidth', 2, 'MarkerSize', 8);hold on;
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
plot([70 700],[meanTheta0 meanTheta0],'r--','LineWidth', 3);

set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
% set(gca, 'YLim',[0 10000]);
xlabel('Temperatute (K)', 'FontName', 'bookman', 'FontSize', 16);
ylabel('\theta_0 (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
Title('6061-T6 Al','FontName', 'bookman');
str = sprintf('Mean \\theta_0  = %g', meanTheta0);
gtext(str, 'FontName', 'bookman', 'FontSize', 14);

fig2 = figure;
set(fig2, 'Position', [412 313 915 632]);
meanTheta1 = mean(theta1);
[n,m] = size(dat);
for i = 1:n
    str = sprintf('(%g,  %g)',edot(i),T0(i));
    text(T0(i)+5,theta1(i),str); hold on;
end
plot(T0, theta1, 'rs', 'LineWidth', 2, 'MarkerSize', 8);hold on;
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
plot([70 700],[meanTheta1 meanTheta1],'r--','LineWidth', 3);


set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
% set(gca, 'YLim',[0 2000]);
xlabel('Temperature (K)', 'FontName', 'bookman', 'FontSize', 16);
ylabel('\theta_1 (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
Title('6061-T6 Al','FontName', 'bookman');

str = sprintf('Mean \\theta_1  = %g', meanTheta1);
gtext(str, 'FontName', 'bookman', 'FontSize', 14);