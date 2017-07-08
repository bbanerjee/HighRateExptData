%
% Digitized data from Gust (Al sample) p.3574
%
xax = [[491 5376];[2896 5376]];
yax = [[491 5376];[491 906]];
dat = [[2006 5308];[1923 5232];[1848 5157];[1810 5067];[1758 4938];[1735 4780];...
       [1675 4622];[1644 4464];[1637 4320];[1577 4185];[1546 4019];[1524 3883];...
       [1494 3748];[1464 3559];[1441 3258];[1426 2971];[1418 2670];[1426 2361];...
       [1426 2044];[1448 1690];[491 1690]];

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
fid = fopen('taylorAlGust194_635K.dat','w');
for i=1:n
  fprintf(fid,'%f %f\n',dat(i,1),dat(i,2));
end
fclose(fid);

%
% Compute the width at 0.2*L0
%
Lw = 0.2*32.2;
xyw = [[0 Lw];[10 Lw]];
plot(dat(:,1),dat(:,2)); hold on;
plot(xyw(:,1),xyw(:,2));
grid on
grid minor
