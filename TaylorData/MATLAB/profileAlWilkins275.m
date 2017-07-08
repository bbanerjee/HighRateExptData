clear all; close all;
%
% Digitized data from Wilkins and Guinan (Al sample) p.1201
%
yax = [[1419 4476];[1419 776]];
dat = [[1419 4476];[1671 4476];[1872 4473];[1822 4389];[1784 4310];[1754 4230];...
       [1747 4139];[1739 3957];[1731 3757];[1720 3620];[1716 3488];[1709 3257];...
       [1690 2692];[1697 2158];[1712 1734];[1712 1473];[1709 1457];[1419 1457]];

%
% Convert the data so that the origin is at (0,0)
%
x0 = yax(1,1);
y0 = yax(1,2);
[n,m] = size(dat);
for i=1:n
  dat(i,1) = dat(i,1) - x0;
  dat(i,2) = y0 - dat(i,2);
end

%
% Scale the data (into mm)
%
L0 = 46.94;
D0 = 7.62;
yfac = L0/(yax(1,2) - yax(2,2));
xfac = D0*0.5/(dat(n-1,1) - dat(n,1));
for i=1:n
  dat(i,1) = xfac*dat(i,1);
  dat(i,2) = yfac*dat(i,2);
end

%
% Open output file to save data
%
fid = fopen('taylorAlWilkins275.dat','w');
for i=1:n
  fprintf(fid,'%f %f\n',dat(i,1),dat(i,2));
end
fclose(fid);

%
% Compute the width at 0.2*L0
%
Lw = 0.2*L0;
xyw = [[0 Lw];[10 Lw]];
plot(dat(:,1),dat(:,2)); hold on;
plot(xyw(:,1),xyw(:,2));
grid on
grid minor
