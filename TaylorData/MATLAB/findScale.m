clear all; close all;
xax = [[491 5376];[2896 5376]];
yax = [[491 5376];[491 906]];
dat = [[491 5376];[2081 5376];[2006 5308];[1923 5232];[1848 5157];[1810 5067];...
       [1758 4938];[1735 4780];[1675 4622];[1644 4464];[1637 4320];[1577 4185];...
       [1546 4019];[1524 3883];[1494 3748];[1464 3559];[1441 3258];[1426 2971];...
       [1418 2670];[1426 2361];[1426 2044];[1448 1690];[491 1690];[491 5376]];
Lxax = 8.0;
Lyax = 30.0;
xscale = (xax(2,1)-xax(1,1))/8.0
yscale = (yax(1,2)-yax(2,2))/30.0
relScale = xscale/yscale;
[n,m] = size(dat);
for i=1:n
  dat(i,2) = dat(1,2) + (dat(i,2) - dat(1,2))*relScale;
end
for i=1:2
  yax(i,2) = yax(1,2) + (yax(i,2) - yax(1,2))*relScale;
end
xscale = (xax(2,1)-xax(1,1))/8.0
yscale = (yax(1,2)-yax(2,2))/30.0
