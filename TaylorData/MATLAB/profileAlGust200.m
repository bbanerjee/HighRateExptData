clear all; close all;
%
% Digitized data from Gust (Al sample) p.3574
%
xax = [[503 5383];[2900 5383]];
yax = [[503 5383];[503 906]];
dat = [[1755 5375];[1672 5089];[1627 4923];[1627 4742];[1612 4607];[1596 4471];...
       [1551 4313];[1536 4154];[1521 4026];[1506 3883];[1483 3566];[1461 3227];...
       [1461 2948];[1461 2654];[1438 2323];[1446 2006];[1453 1697];[1446 1403];...
       [1446 1260];[1446 1064];[503 1064]];

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
fid = fopen('taylorAlGust200_295K.dat','w');
for i=1:n
  fprintf(fid,'%f %f\n',dat(i,1),dat(i,2));
end
fclose(fid);

%
% Compute the width at 0.2*L0
%
Lw = 0.2*32.05;
xyw = [[0 Lw];[10 Lw]];
plot(dat(:,1),dat(:,2)); hold on;
plot(xyw(:,1),xyw(:,2));
grid on
grid minor
