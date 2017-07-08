%
% Digitized data from Johnson and Cook (4340 Steel sample) p.546
%
ax = [[6780 5337];[6780 2381]];
dat = [[6780 5337];[6159 5337];[6243 5093];[6297 4869];[6327 4639];[6333 4395];...
       [6344 4161];[6344 3923];[6359 3678];[6355 3440];[6356 3206];[6357 2967];...
       [6352 2719];[6586 2715];[6780 2715]];

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
fid = fopen('taylorStJohnsonCook208.dat','w');
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
