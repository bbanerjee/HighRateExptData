 %
 % Rc 30 T = 298 theta0
 %
 dat = [[0.002 4700];[0.009 8500];[0.1 7000];[1.1 3750];[570 10730]];
 [n,m] = size(dat);
 for i=1:n
  edot(i) = dat(i,1);
  T = 298.0;
  theta(i) = dat(i,2) - (9658 - 5.079*T);
 end
 %
 % Rc 30 T = 500 theta0
 %
 dat1 = [604 17175];
 [n,m] = size(dat1);
 for i=1:n
  edot1(i) = dat1(i,1);
  T = 500.0;
  theta1(i) = dat1(i,2) - (9658 - 5.079*T);
 end
 %
 % Rc 30 T = 735 theta0
 %
 dat2 = [650 25400];
 [n,m] = size(dat2);
 for i=1:n
  edot2(i) = dat2(i,1);
  T = 735.0;
  theta2(i) = dat2(i,2) - (9658 - 5.079*T);
 end
 theta30_0 = cat(2, theta, theta1, theta2)
 edot30_0 = cat(2, edot, edot1, edot2)

 semilogx(edot30_0, theta30_0, 'ro-');

