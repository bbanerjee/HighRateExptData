%
% Digitized data from Johnson and Cook (Copper sample) p.546
%
ax = [[1990 5303];[1990 2366]];
dat = [[1990 5303];[1436 5303];[1456 5064];[1471 4829];[1472 4605];[1473 4357];... 
       [1483 4138];[1494 3914];[1500 3685];[1516 3474];[1546 3250];[1547 3031];... 
       [1776 3031];[1990 3031]];

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
L0 = 25.4;
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
fid = fopen('taylorCuJohnsonCook130.dat','w');
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
