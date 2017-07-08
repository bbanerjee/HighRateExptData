%
% Digitized data from Gust (Copper sample) p.3574
%
xax = [[ 147 5109];[2553 5109]];
yax = [[ 147 5109];[147 640]];
dat = [[ 147 5109];[1782 5109];[1564 4982];[1534 4805];[1525 4628];[1535 4492];...
       [1526 4367];[1485 4189];[1444 4033];[1372 3866];[1311 3699];[1229 3490];...
       [1166 3365];[1115 3187];[1095 3031];[1044 2864];[1035 2625];[ 147 2625]];

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
fid = fopen('taylorCuGust188_718K.dat','w');
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
