clear all; close all;
%
% Digitized data from Gust (Al sample) p.3574
%
xax = [[475 5361];[2887 5361]];
yax = [[475 5361];[475 898]];
dat = [[2427 5293];[2231 5217];[2073 5142];[1907 5082];[1779 4923];[1696 4803];...
       [1651 4599];[1636 4449];[1666 4313];[1636 4185];[1560 4011];[1492 3876];...
       [1462 3732];[1440 3567];[1432 3431];[1410 3114];[1425 2692];[1432 2383];...
       [1440 1916];[1462 1765];[475 1765]];

%
% Convert the data so that the origin is at (0,0)
%
x0 = xax(1,1);
y0 = xax(1,2);
[n,m] = size(dat);
for i=1:n
  dat(i,1) = dat(i,1) - x0;
  dat(i,2) = y0 - dat(i,2);
end

%
% Scale the data (into mm)
%
L0 = 30.0;
D0 = 8.0;
yfac = L0/(yax(1,2) - yax(2,2));
xfac = D0/(xax(2,1) - xax(1,1));
for i=1:n
  dat(i,1) = xfac*dat(i,1);
  dat(i,2) = yfac*dat(i,2);
end

%
% Open output file to save data
%
fid = fopen('taylorAlGust358_295K.dat','w');
for i=1:n
  fprintf(fid,'%f %f\n',dat(i,1),dat(i,2));
end
fclose(fid);

%
% Compute the width at 0.2*L0
%
Lw = 0.2*32.9;
xyw = [[0 Lw];[10 Lw]];
plot(dat(:,1),dat(:,2)); hold on;
plot(xyw(:,1),xyw(:,2));
grid on
grid minor
