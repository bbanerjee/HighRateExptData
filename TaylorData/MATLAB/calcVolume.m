function calcVolume

  load ./DAT/taylorAlGust194_635K.dat;
  name( 1,:) = 'Al Gust 194m/s 635K   ';
  [L(1),A(1),V(1),cx(1),cy(1)] = computeAndPlot(taylorAlGust194_635K);
  %print -depsc taylorAlGust194_635K.eps

  load ./DAT/taylorAlGust200_295K.dat;
  name( 2,:) = 'Al Gust 200m/s 295K   ';
  [L(2),A(2),V(2),cx(2),cy(2)] = computeAndPlot(taylorAlGust200_295K);
  %print -depsc taylorAlGust200_295K.eps

  load ./DAT/taylorAlGust358_295K.dat;
  name( 3,:) = 'Al Gust 358m/s 295K   ';
  [L(3),A(3),V(3),cx(3),cy(3)] = computeAndPlot(taylorAlGust358_295K);
  %print -depsc taylorAlGust358_295K.eps

  load ./DAT/taylorAlWilkins275.dat
  name( 4,:) = 'Al Wilkins 275m/s 295K';
  [L(4),A(4),V(4),cx(4),cy(4)] = computeAndPlot(taylorAlWilkins275);
  %print -depsc taylorAlWilkins275.eps

  load ./DAT/taylorAlWilkins373.dat
  name( 5,:) = 'Al Wilkins 373m/s 295K';
  [L(5),A(5),V(5),cx(5),cy(5)] = computeAndPlot(taylorAlWilkins373);
  %print -depsc taylorAlWilkins373.eps

  load ./DAT/taylorCuGust188_718K.dat
  name( 6,:) = 'Cu Gust 188m/s 718K   ';
  [L(6),A(6),V(6),cx(6),cy(6)] = computeAndPlot(taylorCuGust188_718K);
  %print -depsc taylorCuGust188_718K.eps

  load ./DAT/taylorCuGust211_727K.dat
  name( 7,:) = 'Cu Gust 211m/s 727K   ';
  [L(7),A(7),V(7),cx(7),cy(7)] = computeAndPlot(taylorCuGust211_727K);
  %print -depsc taylorCuGust211_727K.eps

  load ./DAT/taylorCuGust277_295K.dat
  name( 8,:) = 'Cu Gust 277m/s 295K   ';
  [L(8),A(8),V(8),cx(8),cy(8)] = computeAndPlot(taylorCuGust277_295K);
  %print -depsc taylorCuGust277_295K.eps

  load ./DAT/taylorCuJohnsonCook130.dat
  name( 9,:) = 'Cu Johnson 130m/s 295K';
  [L(9),A(9),V(9),cx(9),cy(9)] = computeAndPlot(taylorCuJohnsonCook130);
  %print -depsc taylorCuJohnsonCook130.eps

  load ./DAT/taylorCuJohnsonCook146.dat
  name(10,:) = 'Cu Johnson 146m/s 295K';
  [L(10),A(10),V(10),cx(10),cy(10)] = computeAndPlot(taylorCuJohnsonCook146);
  %print -depsc taylorCuJohnsonCook146.eps

  load ./DAT/taylorCuWilkinsGuinan.dat
  name(11,:) = 'Cu Wilkins 210m/s 295K';
  [L(11),A(11),V(11),cx(11),cy(11)] = computeAndPlot(taylorCuWilkinsGuinan);
  %print -depsc taylorCuWilkinsGuinan210.eps

  load ./DAT/taylorCuZerilliArmstrong.dat
  name(12,:) = 'Cu Zerilli 190m/s 295K';
  [L(12),A(12),V(12),cx(12),cy(12)] = computeAndPlot(taylorCuZerilliArmstrong);
  %print -depsc taylorCuZerilliArmstrong190.eps

  load ./DAT/taylorStJohnsonCook208.dat
  name(13,:) = 'St Johnson 208m/s 295K';
  [L(13),A(13),V(13),cx(13),cy(13)] = computeAndPlot(taylorStJohnsonCook208);
  %print -depsc taylorStJohnsonCook208.eps

  load ./DAT/taylorStJohnsonCook282.dat
  name(14,:) = 'St Johnson 282m/s 295K';
  [L(14),A(14),V(14),cx(14),cy(14)] = computeAndPlot(taylorStJohnsonCook282);
  %print -depsc taylorStJohnsonCook282.eps

  load ./DAT/taylorStJohnsonCook343.dat
  name(15,:) = 'St Johnson 343m/s 295K';
  [L(15),A(15),V(15),cx(15),cy(15)] = computeAndPlot(taylorStJohnsonCook343);
  %print -depsc taylorStJohnsonCook343.eps

  fid = fopen('taylorExptVolume.dat','w');
  for i=1:15
    fprintf(fid,'%s %6.2f %6.2f %6.2f %6.2f %6.2f\n',name(i,:),L(i),A(i),V(i),cx(i),cy(i));
  end
  fclose(fid);

function [L,A,V,cx,cy] = computeAndPlot(poly)

  figure
  plot(poly(:,1),poly(:,2),'g','LineWidth',2); hold on;
  [n,m] = size(poly);
  A = area(poly);
  [cx, cy] = centroid(poly);
  V = volume(poly);
  plot(cx, cy,'mo','MarkerFaceColor','m');
  line = poly(2:n-2,:);
  plot(line(:,1),line(:,2),'r','LineWidth',3);
  L = line_length(line);
  strL = sprintf('L = %6.2f',L); 
  strA = sprintf('A = %6.2f',A); 
  strV = sprintf('V = %6.2f',V); 
  strC = sprintf('(%6.2f,%6.2f)',cx,cy); 
  gtext(strL);
  gtext(strA);
  gtext(strV);
  gtext(strC);

function [L] = line_length(line)

  [n,m] = size(line);
  L = 0.0;
  for i=1:n-1
    xdiff = line(i+1,1)-line(i,1);
    ydiff = line(i+1,2)-line(i,2);
    segLength = sqrt(xdiff^2+ydiff^2);
    L = L + segLength;
  end

function [A] = area(poly)

  [n,m] = size(poly);
  A = 0.0;
  for i=1:n-1
    fac1 = poly(i,1)*poly(i+1,2);
    fac2 = poly(i+1,1)*poly(i,2);
    A = A + (fac1-fac2);
  end
  A = 0.5*A;

function [cx, cy] = centroid(poly)

  A = area(poly);
  [n,m] = size(poly);
  cx = 0.0;
  cy = 0.0;
  for i=1:n-1
    fac1 = poly(i,1)*poly(i+1,2);
    fac2 = poly(i+1,1)*poly(i,2);
    cx = cx + (fac1-fac2)*(poly(i,1)+poly(i+1,1));
    cy = cy + (fac1-fac2)*(poly(i,2)+poly(i+1,2));
  end
  cx = cx/(6.0*A);
  cy = cy/(6.0*A);

%
% Pappus theorem to compute swept volume
%
function [V] = volume(poly)

  A = area(poly);
  [cx, cy] = centroid(poly);
  dist_trav = cx*2.0*pi;
  V = A*dist_trav;
