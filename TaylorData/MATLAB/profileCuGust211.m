clear all; close all

%
% Digitized data from Gust (Copper sample) p.3574
%
xax = [[449 4960];[2863 4960]];
yax = [[449 4960];[449 457]];
dat = [[449 4960];[2561 4960];[2458 4876];[2239 4783];[2008 4605];[1967 4428];...
       [1947 4272];[1896 4116];[1800 3920];[1728 3753];[1593 3565];[1529 3408];...
       [1519 3242];[1437 3064];[1414 2887];[1415 2730];[1426 2570];[449 2570]];

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
%L0 = 30.0;
%Lf = 0.516*L0;
%D0 = 6.0;
%yfac = Lf/(dat(n,2) - dat(1,2));
%xfac = D0*0.5/(dat(n-1,1) - dat(n,1));
%for i=1:n
%  dat(i,1) = xfac*dat(i,1);
%  dat(i,2) = yfac*dat(i,2);
%end
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
fid = fopen('taylorCuGust211_727K.dat','w');
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
