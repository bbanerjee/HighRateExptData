clear al; close all;
%
% Digitized data from Gust (Copper sample) p.3574
%
xax = [[110 4569];[2527 4569]];
yax = [[110 4569];[110 80]];
dat = [[1893 4307];[1695 4244];[1591 4171];[1561 4056];[1531 3911];[1510 3795];...
       [1469 3670];[1417 3576];[1397 3462];[1346 3347];[1315 3231];[1264 3127];...
       [1212 3002];[1150 2909];[1098 2783];[1078 2678];[1048 2574];[1027 2449];...
       [1018 2355];[110 2355]];

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
fid = fopen('taylorCuGust277_295K.dat','w');
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
