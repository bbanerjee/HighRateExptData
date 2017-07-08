 %
 % Rc 30 T = 298 theta0
 %
 dat = [[0.002 4700];[0.009 8500];[0.1 7000];[1.1 3750];[570 10730]];
 [n,m] = size(dat);
 for i=1:n
  edot = dat(i,1);
  theta(i) = dat(i,2) - (5934.254931 + 197.3547548*sqrt(edot));
  T(i) = 298.0;
 end
 %
 % Rc 30 T = 500 theta0
 %
 dat1 = [604 17175];
 [n,m] = size(dat1);
 for i=1:n
  edot = dat1(i,1);
  theta1(i) = dat1(i,2) - (5934.254931 + 197.3547548*sqrt(edot));
  T1(i) = 500.0;
 end
 %
 % Rc 30 T = 735 theta0
 %
 dat2 = [650 25400];
 [n,m] = size(dat2);
 for i=1:n
  edot = dat2(i,1);
  theta2(i) = dat2(i,2) - (5934.254931 + 197.3547548*sqrt(edot));
  T2(i) = 735.0;
 end
 theta30_0 = cat(2, theta, theta1, theta2);
 T30_0 = cat(2, T, T1, T2);

 %
 % Rc 30 T = 298 thetaIV
 %
 dat = [[0.002 850];[0.009 0.0];[0.1 0.0];[1.1 0.0];[570 1500]];
 [n,m] = size(dat);
 for i=1:n
  edot = dat(i,1);
  theta(i) = dat(i,2) - (195.5279997 + 54.07399146*sqrt(edot));
  T(i) = 298.0;
 end
 %
 % Rc 30 T = 500 thetaIV
 %
 dat1 = [604, 750];
 [n,m] = size(dat1);
 for i=1:n
  edot = dat1(i,1);
  theta(i) = dat1(i,2) - (195.5279997 + 54.07399146*sqrt(edot));
  T1(i) = 500.0;
 end
 %
 % Rc 30 T = 735 thetaIV
 %
 dat2 = [650, 0.0];
 [n,m] = size(dat2);
 for i=1:n
  edot = dat2(i,1);
  theta(i) = dat2(i,2) - (195.5279997 + 54.07399146*sqrt(edot));
  T2(i) = 735.0;
 end
 theta30_IV = cat(2, theta, theta1, theta2);
 T30_IV = cat(2, T, T1, T2);

 figure
 subplot(1,2,1);
 plot(T30_0, theta30_0, 'ro-');
 subplot(1,2,2);
 plot(T30_IV, theta30_IV, 'ro-');
 clear all;

 %
 % Rc 38 edot = 0.0002 theta0
 %
 dat = [[258.0 3330];[298 4360];[373 5080]];
 [n,m] = size(dat);
 for i=1:n
  T = dat(i,1);
  theta(i) = dat(i,2) - (15009.94946 - 1891.118888*log(T));
  edot(i) = 0.0002;
 end

 %
 % Rc 38 edot = 500 theta0
 %
 dat1 = [[298.0 19000];[573 9600];[773 7500]];
 [n,m] = size(dat1);
 for i=1:n
  T = dat1(i,1);
  theta1(i) = dat1(i,2) - (65639.67478 - 8538.424750*log(T));
  edot1(i) = 500;
 end

 %
 % Rc 38 edot = 1500 theta0
 %
 dat2 = [[298.0 9200];[573 5000];[973 4950];[1173 4040];[1373 2765]];
 [n,m] = size(dat2);
 for i=1:n
  T = dat2(i,1);
  theta2(i) = dat2(i,2) - (31530.04057 - 3976.788920*log(T));
  edot2(i) = 1500;
 end

 %
 % Rc 38 edot = 2500 theta0
 %
 dat3 = [[773.0 3560];[973 4030];[1173 2130];[1373 1890]];
 [n,m] = size(dat3);
 for i=1:n
  T = dat3(i,1);
  theta3(i) = dat3(i,2) - (26423.75225 - 3380.635029*log(T));
  edot3(i) = 2500;
 end

 theta38_0 = cat(2, theta, theta1, theta2, theta3);
 edot38_0 = cat(2, edot, edot1, edot2, edot3);

 %
 % Rc 38 edot = 0.0002 thetaIV
 %
 dat = [[258.0 950];[298 950];[373 950]];
 [n,m] = size(dat);
 for i=1:n
  T = dat(i,1);
  theta(i) = dat(i,2) - 950.0;
  edot(i) = 0.0002;
 end

 %
 % Rc 38 edot = 500 thetaIV
 %
 dat1 = [[298.0 3000];[573 1800];[773 500]];
 [n,m] = size(dat1);
 for i=1:n
  T = dat1(i,1);
  theta1(i) = dat1(i,2) - (10523.78857 - 1387.328715*log(T));
  edot1(i) = 500;
 end

 %
 % Rc 38 edot = 1500 thetaIV
 %
 dat2 = [[298.0 1500];[573 1000];[973 650];[1173 800];[1373 300]];
 [n,m] = size(dat2);
 for i=1:n
  T = dat2(i,1);
  theta2(i) = dat2(i,2) - (5452.794277 - 693.5588877*log(T));
  edot2(i) = 1500;
 end

 %
 % Rc 38 edot = 2500 thetaIV
 %
 dat3 = [[773.0 500];[973 400];[1173 100];[1373 200]];
 [n,m] = size(dat3);
 for i=1:n
  T = dat3(i,1);
  theta3(i) = dat3(i,2) - (3195.315342 - 414.5276437*log(T));
  edot3(i) = 2500;
 end

 theta38_IV = cat(2, theta, theta1, theta2, theta3);
 edot38_IV = cat(2, edot, edot1, edot2, edot3);

 figure
 subplot(1,2,1);
 plot(edot38_0, theta38_0, 'ro-');
 subplot(1,2,2);
 plot(edot38_IV, theta38_IV, 'ro-');
 clear all;

 %
 % Rc 45 edot = 0.0001 theta0
 %
 dat = [[173.0 10035];[298 4129];[373 14116]];
 [n,m] = size(dat);
 for i=1:n
  T = dat(i,1);
  theta(i) = dat(i,2) - (29929.83339 - 3717.649139*log(T));
  edot(i) = 0.0001;
 end

 %
 % Rc 45 edot = 1000 theta0
 %
 dat1 = [[173.0 7750];[298 7500];[373 3935]];
 [n,m] = size(dat1);
 for i=1:n
  T = dat1(i,1);
  theta1(i) = dat1(i,2) - (23002.83647 - 2960.900867*log(T));
  edot1(i) = 1000;
 end

 theta45_0 = cat(2, theta, theta1);
 edot45_0 = cat(2, edot, edot1);

 %
 % Rc 45 edot = 0.0001 thetaIV
 %
 dat = [[173.0 0.0];[298 0.0];[373 0.0]];
 [n,m] = size(dat);
 for i=1:n
  T = dat(i,1);
  theta(i) = dat(i,2);
  edot(i) = 0.0001;
 end

 %
 % Rc 45 edot = 1000 thetaIV
 %
 dat1 = [[173 0.0];[298 0.0];[373 0.0]];
 [n,m] = size(dat1);
 for i=1:n
  T = dat1(i,1);
  theta1(i) = dat1(i,2);
  edot1(i) = 1000;
 end

 theta45_IV = cat(2, theta, theta1);
 edot45_IV = cat(2, edot, edot1);

 figure
 subplot(1,2,1);
 plot(edot45_0, theta45_0, 'ro-');
 subplot(1,2,2);
 plot(edot45_IV, theta45_IV, 'ro-');
 clear all;

 %
 % Rc 49 edot = 0.0001 theta0
 %
 dat = [[173.0 6950];[298 12320];[373 29780]];
 [n,m] = size(dat);
 for i=1:n
  T = dat(i,1);
  theta(i) = dat(i,2) - (41482.26057 - 4751.951418*log(T));
  edot(i) = 0.0001;
 end

 %
 % Rc 49 edot = 1000 theta0
 %
 dat1 = [[173.0 7000];[298 11480];[373 10950]];
 [n,m] = size(dat1);
 for i=1:n
  T = dat1(i,1);
  theta1(i) = dat1(i,2) - (29580.11854 - 3614.020158*log(T));
  edot1(i) = 1000;
 end

 theta49_0 = cat(2, theta, theta1);
 edot49_0 = cat(2, edot, edot1);

 %
 % Rc 49 edot = 0.0001 thetaIV
 %
 dat = [[173.0 0.0];[298 0.0];[373 0.0]];
 [n,m] = size(dat);
 for i=1:n
  T = dat(i,1);
  theta(i) = dat(i,2);
  edot(i) = 0.0001;
 end
 
 %
 % Rc 49 edot = 1000 thetaIV
 %
 dat1 = [[173.0 0.0];[298 0.0];[373 0.0]];
 [n,m] = size(dat1);
 for i=1:n
  T = dat1(i,1);
  theta1(i) = dat1(i,2);
  edot1(i) = 1000;
 end

 theta49_IV = cat(2, theta, theta1);
 edot49_IV = cat(2, edot, edot1);

 figure
 subplot(1,2,1);
 plot(edot49_0, theta49_0, 'ro-');
 subplot(1,2,2);
 plot(edot49_IV, theta49_IV, 'ro-');
 clear all;



