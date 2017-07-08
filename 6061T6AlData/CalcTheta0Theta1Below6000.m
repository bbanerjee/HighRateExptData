function CalcTheta0Theta1Below6000

close all;
fig1 = figure;
set(fig1, 'Position', [412 313 915 632]);

load AlDataVoce.dat
dat = AlDataVoce;

theta0 = dat(:,1);
theta1 = dat(:,2);
T0 = dat(:,3);
edot = dat(:,4);

[m,n] = size(theta0)
count = 1;
for i = 1:m
    if(theta0(i) < 6000)
        theta0T(count) = theta0(i);
        T0T(count) = T0(i);
        edotT(count) = edot(i);
        count = count + 1;
    end
end

[m1,n1] = size(theta0T);
for i = 1:n1
    str = sprintf('(%g,  %g)',edotT(i),T0T(i));
    text(T0T(i)+5,theta0T(i),str); hold on;
end

plot(T0T, theta0T, 'rs', 'LineWidth', 2, 'MarkerSize', 8);hold on;

[C,S] = polyfit(T0T,theta0T,1);
xmin = 70;
xmax = max(T0)+10;
nx = 100;
dx = xmax/nx;
for i=1:nx+1
  xfit(i) = xmin + (i-1)*dx;
  yfit(i) = C(2) + C(1)*xfit(i);
end
plot(xfit, yfit, 'b-', 'LineWidth', 3); hold on;
fid = fopen('theta0.dat', 'w');
fprintf(fid,'%g %g',C(1),C(2));
fclose(fid);
  

set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
set(gca, 'YLim',[0 6000]);
xlabel('Temperatute (K)', 'FontName', 'bookman', 'FontSize', 16);
ylabel('\theta_0 (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
Title('6061-T6 Al','FontName', 'bookman');

fig2 = figure;
set(fig2, 'Position', [412 313 915 632]);
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


set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
set(gca, 'YLim',[0 2000]);
xlabel('Temperature (K)', 'FontName', 'bookman', 'FontSize', 16);
ylabel('\theta_1 (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
Title('6061-T6 Al','FontName', 'bookman');