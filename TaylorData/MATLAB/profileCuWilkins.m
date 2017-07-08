%
% Digitized data from Wilkins and Guinan (Copper sample) p.1205
%
ax = [[3188 6554];[3188 4019]];
dat = [[3188 6554];[4209 6554];[4095 6475];[3894 6361];[3806 6116];...
       [3745 5747];[3674 5396];[3657 4931];[3188 4931]];

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
L0 = 23.47;
D0 = 7.62;
yfac = L0/(ax(1,2) - ax(2,2));
xfac = 0.5*D0/(dat(8,1) - dat(9,1));
for i=1:n
  dat(i,1) = xfac*dat(i,1);
  dat(i,2) = yfac*dat(i,2);
end

%
% Open output file to save data
%
fid = fopen('taylorCuWilkinsGuinan.dat','w');
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
