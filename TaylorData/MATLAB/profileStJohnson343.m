clear all; close all;
%
% Digitized data from Johnson and Cook (4340 Steel sample) p.546
%
ax = [[6706 12421];[6706 11493]];
dat = [[6706 12421];[6030 12421];[6220 12169];[6268 11924];[6278 11681];[6487 11681];...
       [6706 11681]];

%
% Convert the data so that the origin is at (0,0)
%
x0 = ax(1,1);
y0 = ax(1,2);
[n,m] = size(dat);
for i=1:n
  dat(i,1) = dat(i,1) - x0;
  dat(i,2) = y0 - dat(i,2);
end

%
% Scale the data (into mm)
%
L0 = 8.1;
D0 = 7.62;
yfac = L0/(ax(1,2) - ax(2,2));
xfac = 0.5*D0/(dat(n,1) - dat(n-2,1));
for i=1:n
  dat(i,1) = xfac*dat(i,1);
  dat(i,2) = yfac*dat(i,2);
end

%
% Reflect the data so that the profile is on the rhs
%
for i=1:n
  dat(i,1) = -dat(i,1);
end

%
% Open output file to save data
%
fid = fopen('taylorStJohnsonCook343.dat','w');
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
