%
%  Taylor impact test data for 6061T6 Aluminum
%
function plot6061T6Al

  %
  % Read  and plot data from House et al.
  %
  figure;
  data1 = houseData;
  plotData(data1, 6);
  writeData(data1, 'AlHouse.dat');

  %
  % Read  and plot data from Gust et al.
  %
  data2 = gustData;
  plotData(data2, 8);
  writeData(data2, 'AlGust.dat');

  %
  % Read and plot data from Wilkins et al.
  %
  data5 = wilkinsData;
  plotData(data5, 12);
  writeData(data5, 'AlWilkins.dat');

%
% Function to write data
%
function writeData(data, filename)

  fid = fopen(filename,'w');
  [n,m] = size(data);
  for i=1:n
    Cp = 896.0;
    rho(i) = data(i,1);
    T(i) = data(i,2);
    u(i) = data(i,5);
    l(i) = data(i,4)*1.0e-3;
    lf(i) = data(i,6)*1.0e-3;
    xf(i) = data(i,7)*1.0e-3;
    lenf(i) = data(i,10)*1.0e-3;
    d(i) = data(i,3)*1.0e-3;
    df(i) = data(i,8)*1.0e-3;
    wf(i) = data(i,9)*1.0e-3;
    a(i) = l(i)*d(i)*0.5;
    af(i) = data(i,11)*1.0e-6;
    v(i) = l(i)*pi*d(i)^2/4.0;
    vf(i) = data(i,12)*1.0e-9;
    cxf(i) = data(i,13)*1.0e-3;
    cyf(i) = data(i,14)*1.0e-3;
    m(i) = rho(i)*v(i);
    mom(i) = m(i)*u(i);
    ke(i) = 0.5*m(i)*u(i)^2;
    ie(i) = m(i)*Cp*(T(i) - 294.0);
    te(i) = ke(i)+ie(i);
    l_d(i) = l(i)/d(i);
    lf_l(i) = lf(i)/l(i);
    xf_l(i) = xf(i)/l(i);
    lenf_l(i) = lenf(i)/l(i);
    df_d(i) = df(i)/d(i);
    wf_d(i) = wf(i)/d(i);
    af_a(i) = af(i)/a(i);
    vf_v(i) = vf(i)/v(i);
    fprintf(fid,'%8.4e %8.4e %8.4e %8.4e %8.4e %8.4e %8.4e %8.4e %8.4e %8.4e %8.4e\n',...
            Cp, rho(i), T(i), u(i), l(i), lf(i), xf(i), lenf(i), d(i), df(i), wf(i));
    fprintf(fid,'%8.4e %8.4e %8.4e %8.4e %8.4e %8.4e %8.4e %8.4e %8.4e %8.4e %8.4e\n',...
            a(i), af(i), v(i), vf(i), cxf(i), cyf(i), m(i), mom(i), ke(i), ie(i), te(i));
    fprintf(fid,'%8.4e %8.4e %8.4e %8.4e %8.4e %8.4e %8.4e %8.4e 0.0 0.0 0.0\n',...
            l_d(i), lf_l(i), xf_l(i), lenf_l(i), df_d(i), wf_d(i), af_a(i), vf_v(i));
  end
  fclose(fid);

%
% Function to plot data
%
function plotData(data, msize)
  [n,m] = size(data);
  for i=1:n
    rho(i) = data(i,1);
    T(i) = data(i,2);
    d(i) = data(i,3)*1.0e-3;
    l(i) = data(i,4)*1.0e-3;
    u(i) = data(i,5);
    lf(i) = data(i,6)*1.0e-3;
    xf(i) = data(i,7)*1.0e-3;
    df(i) = data(i,8)*1.0e-3;
    wf(i) = data(i,9)*1.0e-3;
    lenf(i) = data(i,10)*1.0e-3;
    areaf(i) = data(i,11)*1.0e-6;
    volf(i) = data(i,12)*1.0e-9;
    cxf(i) = data(i,13)*1.0e-3;
    cyf(i) = data(i,14)*1.0e-3;
    l_d(i) = l(i)/d(i);
    a(i) = l(i)*d(i)*0.5;
    v(i) = l(i)*pi*d(i)^2/4.0;
    m(i) = rho(i)*v(i);
    mom(i) = m(i)*u(i);
    ke(i) = 0.5*m(i)*u(i)^2;
    Cp = 896.0;
    ie(i) = m(i)*Cp*(T(i) - 294.0);
    te(i) = ke(i) + ie(i);
    lf_l(i) = lf(i)/l(i);
    xf_l(i) = xf(i)/l(i);
    df_d(i) = df(i)/d(i);
    wf_d(i) = wf(i)/d(i);
    lenf_l(i) = lenf(i)/l(i);
    areaf_a(i) = areaf(i)/a(i);
    volf_v(i) = volf(i)/v(i);
  end

  p1 = plot(te, lf_l, 'rp', 'MarkerSize',msize,'MarkerFaceColor','r'); hold on;
  p2 = plot(te, xf_l, 'go', 'MarkerSize',msize,'MarkerFaceColor','g');
  p3 = plot(te, df_d, 'bs', 'MarkerSize',msize,'MarkerFaceColor','b');
  p4 = plot(te, wf_d, 'mv', 'MarkerSize',msize,'MarkerFaceColor','m');
  p5 = plot(te, lenf_l, 'cd', 'MarkerSize',msize,'MarkerFaceColor','c');
  p6 = plot(te, areaf_a, 'k^', 'MarkerSize',msize,'MarkerFaceColor','k');
  p7 = plot(te, volf_v, 'kh', 'MarkerSize',msize,'MarkerFaceColor','k');
  set(p7,'Color',[0.6 0.2 0.4],'MarkerFaceColor',[0.6 0.2 0.4]);
  set(gca,'YLim',[0 2.6]);

%
% Data from House et al., 1995, Int. J. Impact Engng. 16(2), 189-200.
%  (rho0 T0 D0 L0 U0 Lf Xf Dm W]
%  (length area volume x_centroid y_centroid)
%
function [taylorData] = houseData

  D0 = 7.595;
  rho0 = 2700.0;
  T0 = 294.0;
  taylorData(1,:) =  [rho0 T0 D0  1.5*D0 227.0 10.2  5.2  9.9 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(2,:) =  [rho0 T0 D0  1.5*D0 235.0  9.9  4.4  9.9 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(3,:) =  [rho0 T0 D0  1.5*D0 339.0  8.3  2.8 12.8 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(4,:) =  [rho0 T0 D0  2.0*D0 212.0 13.6  6.5  9.7 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(5,:) =  [rho0 T0 D0  2.0*D0 224.0 13.3  6.2 10.3 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(6,:) =  [rho0 T0 D0  2.0*D0 240.0 12.9  5.7 10.6 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(7,:) =  [rho0 T0 D0  2.0*D0 263.0 12.5  5.6 11.4 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(8,:) =  [rho0 T0 D0  2.0*D0 328.0 11.4  4.8 13.1 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(9,:) =  [rho0 T0 D0  3.0*D0 248.0 19.4  8.3 11.1 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(10,:) = [rho0 T0 D0  3.0*D0 279.0 18.5  7.4 12.2 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(11,:) = [rho0 T0 D0  4.0*D0 226.0 26.5 13.0 10.8 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(12,:) = [rho0 T0 D0  4.0*D0 231.0 25.9 11.8 11.4 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(13,:) = [rho0 T0 D0  4.0*D0 282.0 24.6 10.4 12.5 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(14,:) = [rho0 T0 D0  5.0*D0 170.0 34.8 18.3  9.7 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(15,:) = [rho0 T0 D0  5.0*D0 244.0 32.7 15.1 11.2 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(16,:) = [rho0 T0 D0  5.0*D0 295.0 29.9 12.2 13.5 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(17,:) = [rho0 T0 D0  7.5*D0 236.0 49.5 24.1 11.3 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(18,:) = [rho0 T0 D0  7.5*D0 242.0 48.5 22.0 11.9 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(19,:) = [rho0 T0 D0  7.5*D0 251.0 48.5 22.4 11.2 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(20,:) = [rho0 T0 D0  7.5*D0 276.0 46.4 20.0 12.4 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(21,:) = [rho0 T0 D0 10.0*D0 235.0 66.5 33.5 10.9 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(22,:) = [rho0 T0 D0 10.0*D0 256.0 63.8 28.7 11.9 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(23,:) = [rho0 T0 D0 10.0*D0 271.0 63.0 28.2 12.8 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];

%
% Data from Gust , 1982, J. Appl. Phys. 53(5), 3566-3575.
%  (rho0 T0 D0 L0 U0 Lf Xf Dm W]
%  (length area volume x_centroid y_centroid)
%
function [taylorData] = gustData

  D0_r = 7.62;
  L0_r = 25.4;
  D0 = 6.0;
  L0 = 30.0;
  taylorData(1,:) =  [2685.0 295.0 D0_r L0_r 252.0 0.848*L0_r -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(2,:) =  [2691.0 295.0 D0_r L0_r 257.0 0.841*L0_r -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(3,:) =  [2687.0 295.0 D0_r L0_r 361.0 0.717*L0_r -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(4,:) =  [2651.0 295.0 D0_r L0_r 406.0 0.663*L0_r -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(5,:) =  [2708.0 295.0 6.3  32.1 200.0 0.903*32.1  8.4 8.36  7.2 ...
                      28.94 97.26 1034.32 1.69 13.88];
  taylorData(6,:) =  [2708.0 295.0 6.4  32.9 358.0 0.735*32.9 12.1 13.6  7.8 ...
                      24.75 86.61 1012.78 1.86 11.14];
  taylorData(7,:) =  [2710.0 635.0 6.3  32.2 194.0 0.770*32.2 10.5 10.4  7.66 ...
                      24.51 85.93 959.97 1.78 11.59];
  taylorData(8,:) =  [2707.0 655.0 D0   L0   354.0 0.397*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];

%
% Data from Wilkins et al, 1973, J. Appl. Phys., 44(3), 1200-1206.
%  (rho0 T0 D0 L0 U0 Lf Xf Dm W]
%  (length area volume x_centroid y_centroid)
%
function [taylorData] = wilkinsData

  rho0 = 2700.0;
  D0 = 7.62;
  L0_1 = 23.47;
  L0_2 = 46.94;
  L0_3 = 85.60;
  taylorData(1,:) = [rho0 294.0 D0 L0_1  50.0 0.993*L0_1 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(2,:) = [rho0 294.0 D0 L0_1 169.0 0.920*L0_1 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(3,:) = [rho0 294.0 D0 L0_1 191.0 0.906*L0_1 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(4,:) = [rho0 294.0 D0 L0_1 262.0 0.844*L0_1 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(5,:) = [rho0 294.0 D0 L0_1 283.0 0.806*L0_1 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(6,:) = [rho0 294.0 D0 L0_1 306.0 0.784*L0_1 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(7,:) = [rho0 294.0 D0 L0_1 373.0 0.703*L0_1  7.5 16.6  8.3 ...
                     18.47 71.34 1024.90 2.29 7.44];
  taylorData(8,:) = [rho0 294.0 D0 L0_1 478.0 0.562*L0_1 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(9,:) = [rho0 294.0 D0 L0_1 603.0 0.370*L0_1 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];

  taylorData(10,:) = [rho0 294.0 D0 L0_2  51.0 0.995*L0_2 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(11,:) = [rho0 294.0 D0 L0_2  69.0 0.988*L0_2 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(12,:) = [rho0 294.0 D0 L0_2  90.0 0.978*L0_2 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(13,:) = [rho0 294.0 D0 L0_2 132.0 0.952*L0_2 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(14,:) = [rho0 294.0 D0 L0_2 207.0 0.888*L0_2 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(15,:) = [rho0 294.0 D0 L0_2 275.0 0.823*L0_2 22.8 11.9  8.2 ...
                      38.67 150.64 1883.36 1.99 18.35];
  taylorData(16,:) = [rho0 294.0 D0 L0_2 367.0 0.722*L0_2 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(17,:) = [rho0 294.0 D0 L0_2 412.0 0.660*L0_2 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(18,:) = [rho0 294.0 D0 L0_2 434.0 0.626*L0_2 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(19,:) = [rho0 294.0 D0 L0_2 484.0 0.552*L0_2 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];

  taylorData(20,:) = [rho0 294.0 D0 L0_3 222.0 0.896*L0_3 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(21,:) = [rho0 294.0 D0 L0_3 236.0 0.888*L0_3 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(22,:) = [rho0 294.0 D0 L0_3 244.0 0.876*L0_3 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(23,:) = [rho0 294.0 D0 L0_3 262.0 0.852*L0_3 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(24,:) = [rho0 294.0 D0 L0_3 285.0 0.814*L0_3 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(25,:) = [rho0 294.0 D0 L0_3 324.0 0.773*L0_3 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(26,:) = [rho0 294.0 D0 L0_3 482.0 0.561*L0_3 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(27,:) = [rho0 294.0 D0 L0_3 580.0 0.404*L0_3 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];
  taylorData(28,:) = [rho0 294.0 D0 L0_3 591.0 0.412*L0_3 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e2 -1.0e3 -1.0 -1.0];

