%
% Digitized data from Zerilli and Armstrong (Copper sample) p.1822
%
ax = [[2970 6160];[2970 1300]];
dat = [[2970 6160];[4816 6160];[4699 5985];[4592 5819];[4485 5663];[4426 5556];...
       [4348 5196];[4339 4942];[4319 4426];[4290 3900];[4251 3569];[4192 3170];...
       [4134 2722];[4076 2322];[4027 2001];[4017 1660];[3998 1300];[2970 1300]];

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
Lf = 0.638*L0;
D0 = 7.62;
yfac = Lf/(ax(1,2) - ax(2,2));
xfac = 0.5*D0/(dat(n-1,1) - dat(n,1));
for i=1:n
  dat(i,1) = xfac*dat(i,1);
  dat(i,2) = yfac*dat(i,2);
end

%
% Open output file to save data
%
fid = fopen('taylorCuZerilliArmstrong.dat','w');
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
