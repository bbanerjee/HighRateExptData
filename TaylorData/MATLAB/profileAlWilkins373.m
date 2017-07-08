clear all; close all;
%
% Digitized data from Wilkins and Guinan (Al sample) p.1201
%
%yax = [[1363 2655];[1363 966]];
%dat = [[1363 2650];[1552 2638];[1722 2623];[1855 2612];[2018 2593];[1923 2532];...
%       [1851 2479];[1772 2415];[1730 2381];[1707 2332];[1700 2275];[1681 2207];...
%       [1669 2120];[1658 1714];[1662 1313];[1363 1313]];
yax = [[1363 2593];[1363 904]];
dat = [[1363 2593];[2018 2593];[1923 2532];...
       [1851 2479];[1772 2415];[1730 2381];[1707 2332];[1700 2275];[1681 2207];...
       [1669 2120];[1658 1714];[1662 1313];[1363 1313]];

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
L0 = 23.47;
%yfac = L0/(yax(1,2) - yax(2,2));
Lf = 16.51;
yfac = Lf/(dat(n,2) - dat(1,2));
D0 = 7.62;
xfac = D0*0.5/(dat(n-1,1) - dat(n,1));
for i=1:n
  dat(i,1) = xfac*dat(i,1);
  dat(i,2) = yfac*dat(i,2);
end

%
% Open output file to save data
%
fid = fopen('taylorAlWilkins373.dat','w');
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
