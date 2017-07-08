%
%  Taylor impact test data for OFNC Copper
%
function plotOFHCCu

  %
  % Read  and plot data from House et al.
  %
  figure;
  data1 = houseData;
  plotData(data1, 6);
  writeData(data1, 'CuHouse.dat');

  %
  % Read  and plot data from Gust et al.
  %
  data2 = gustData;
  plotData(data2, 8);
  writeData(data2, 'CuGust.dat');

  data3 = gustDataETP;
  plotData(data3, 8);
  writeData(data3, 'CuETPGust.dat');

  %
  % Read  and plot data from Zerilli et al.
  %
  data4 = zerilliData;
  plotData(data4, 10);
  writeData(data4, 'CuZerilli.dat');

  %
  % Read and plot data from Wilkins et al.
  %
  data5 = wilkinsData;
  plotData(data5, 12);
  writeData(data5, 'CuWilkins.dat');

  %
  % Read and plot data from Jones et al.
  %
  data6 = jonesData;
  plotData(data6, 14);
  writeData(data6, 'CuJones.dat');

%
% Function to write data
%
function writeData(data, filename)

  fid = fopen(filename,'w');
  [n,m] = size(data);
  for i=1:n
    Cp = 3.0*138.0;
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
    Cp = 3.0*130.8;
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
%
function [taylorData] = houseData

  D0 = 7.595;
  rho0 = 8960.0;
  T0 = 294.0;
  taylorData(1,:) = [rho0 T0 D0 1.5*D0 168.0 9.1 3.8 11.5 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(2,:) = [rho0 T0 D0 1.5*D0 191.0 8.9 4.1 12.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(3,:) = [rho0 T0 D0 2.0*D0 161.0 12.4 5.5 11.7 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(4,:) = [rho0 T0 D0 2.0*D0 169.0 12.1 5.5 12.1 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(5,:) = [rho0 T0 D0 2.0*D0 215.0 10.8 4.7 14.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(6,:) = [rho0 T0 D0 3.0*D0 162.0 18.3 7.8 12.4 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(7,:) = [rho0 T0 D0 3.0*D0 200.0 16.9 6.2 14.2 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(8,:) = [rho0 T0 D0 4.0*D0 170.0 24.3 10.3 12.7 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(9,:) = [rho0 T0 D0 4.0*D0 175.0 23.6 9.3 13.2 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(10,:) = [rho0 T0 D0 5.0*D0 182.0 28.1 8.3 13.2 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(11,:) = [rho0 T0 D0 5.0*D0 200.0 27.4 10.4 14.7 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(12,:) = [rho0 T0 D0 7.5*D0 153.0 47.3 22.1 11.8 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(13,:) = [rho0 T0 D0 7.5*D0 156.0 47.3 21.4 11.9 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(14,:) = [rho0 T0 D0 7.5*D0 180.0 42.8 17.1 14.1 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(15,:) = [rho0 T0 D0 7.5*D0 188.0 41.9 16.0 14.4 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(16,:) = [rho0 T0 D0 7.5*D0 189.0 41.7 16.3 14.7 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(17,:) = [rho0 T0 D0 10.0*D0 123.0 66.4 32.5 10.7 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(18,:) = [rho0 T0 D0 10.0*D0 127.0 66.6 33.3 10.5 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(19,:) = [rho0 T0 D0 10.0*D0 156.0 62.3 28.0 12.5 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(20,:) = [rho0 T0 D0 10.0*D0 158.0 61.0 25.3 12.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(21,:) = [rho0 T0 D0 10.0*D0 166.0 60.6 27.1 13.1 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(22,:) = [rho0 T0 D0 10.0*D0 168.0 58.8 24.8 13.3 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(23,:) = [rho0 T0 D0 10.0*D0 170.0 58.5 24.7 13.4 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(24,:) = [rho0 T0 D0 10.0*D0 176.0 58.7 24.5 13.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(25,:) = [rho0 T0 D0 10.0*D0 176.0 58.3 24.3 13.3 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(26,:) = [rho0 T0 D0 10.0*D0 184.0 57.9 23.6 13.5 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];

%
% Data from Gust , 1982, J. Appl. Phys. 53(5), 3566-3575.
%  (rho0 T0 D0 L0 U0 Lf Xf Dm W]
%
function [taylorData] = gustData

  D0 = 6.0;
  L0 = 30.0;
  taylorData(1,:) = [8910.0 295.0 D0 L0 165.0 0.705*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(2,:) = [8909.0 295.0 D0 L0 138.0 0.730*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(3,:) = [8910.0 295.0 D0 L0 180.0 0.667*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(4,:) = [8929.0 295.0 D0 L0 213.0 0.600*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(5,:) = [8904.0 713.0 D0 L0 138.0 0.688*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(6,:) = [8910.0 733.0 D0 L0 185.0 0.574*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(7,:) = [8935.0 743.0 D0 L0 208.0 0.530*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(8,:) = [8909.0 1230.0 D0 L0 135.0 0.526*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(9,:) = [8927.0 1235.0 D0 L0 157.0 0.425*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(10,:) = [8900.0 1235.0 D0 L0 181.0 0.354*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];

function [taylorData] = gustDataETP

  D0 = 6.0;
  L0 = 30.0;
  taylorData(1,:) =  [8911.0 295.0 D0 L0 109.0 0.812*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(2,:) =  [8904.0 295.0 D0 L0 126.0 0.777*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(3,:) =  [8907.0 295.0 D0 L0 148.0 0.806*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(4,:) =  [8921.0 295.0 D0 L0 181.0 0.675*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(5,:) =  [8918.0 295.0 D0 L0 225.0 0.597*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(6,:) =  [8919.0 295.0 D0 L0 277.0 0.492*L0  0.6  15.0 9.0 ...
                      13.69 57.93 754.07 2.07 7.06];
  taylorData(7,:) =  [8918.0 295.0 D0 L0 311.0 0.373*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(8,:) =  [8928.0 295.0 D0 L0 316.0 0.418*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(9,:) =  [8916.0 295.0 D0 L0 332.0 0.383*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(10,:) = [8911.0 295.0 D0 L0 349.0 0.333*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(11,:) = [8935.0 295.0 D0 L0 357.0 0.332*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(12,:) = [8928.0 295.0 D0 L0 367.0 0.325*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(13,:) = [8902.0 295.0 D0 L0 394.0 0.280*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];

  taylorData(14,:) = [8928.0 703.0 D0 L0 145.0 0.690*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(15,:) = [8929.0 717.0 D0 L0 142.0 0.718*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(16,:) = [8930.0 718.0 D0 L0 188.0 0.555*L0  1.6 10.9  8.9 ...
                      17.09 66.18 848.29 2.04 7.55];
  taylorData(17,:) = [8935.0 721.0 D0 L0 115.0 0.769*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(18,:) = [8929.0 721.0 D0 L0 210.0 0.507*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(19,:) = [8927.0 724.0 D0 L0 206.0 0.519*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(20,:) = [8929.0 725.0 D0 L0 191.0 0.562*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(21,:) = [8947.0 727.0 6.4 30.9 211.0 0.516*30.9 2.11 14.0 9.4 ...
                      16.80 68.94 987.08 2.28 6.95];
  taylorData(22,:) = [8913.0 733.0 D0 L0 190.0 0.574*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(23,:) = [8928.0 765.0 D0 L0 237.0 0.391*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(24,:) = [8938.0 1235.0 D0 L0 127.0 0.505*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(25,:) = [8944.0 1235.0 D0 L0 155.0 0.440*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(26,:) = [8945.0 1235.0 D0 L0 178.0 0.335*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];

%
% Data from Zerilli, 1987, J. Appl. Phys., 61(5), 1816-1825.
%           Johnson & Cook, 1983 and Johnson & Holmquist, 1988.
%  (these data are actually from Johnson and Cook (1983))
%  (rho0 T0 D0 L0 U0 Lf Xf Dm W]
%
function [taylorData] = zerilliData

  rho0 = 8920.0;
  D0 = 7.62;
  L0 = 25.4;
  taylorData(1,:) = [rho0 295.0 D0 L0 130.0 0.770*L0 2.0 1.30*D0 8.92 ...
                     19.69 84.59 1148.00 2.16 9.50];
  taylorData(2,:) = [rho0 295.0 D0 L0 146.0 0.736*L0 0.5 1.40*D0 9.3 ...
                     18.95 82.79 1147.73 2.21 9.02];
  taylorData(3,:) = [rho0 295.0 D0 L0 190.0 0.638*L0 0.1 1.78*D0 10.1 ...
                     16.79 77.29 1182.21 2.43 7.46];

%
% Data from Wilkins et al, 1973, J. Appl. Phys., 44(3), 1200-1206.
%  (rho0 T0 D0 L0 U0 Lf Xf Dm W]
%
function [taylorData] = wilkinsData

  rho0 = 8900.0;
  D0 = 7.62;
  L0 = 23.47;
  taylorData(1,:) = [rho0 294.0 D0 L0  89.0 0.895*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(2,:) = [rho0 294.0 D0 L0 123.0 0.835*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(3,:) = [rho0 294.0 D0 L0 153.0 0.780*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(4,:) = [rho0 294.0 D0 L0 183.0 0.716*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(5,:) = [rho0 294.0 D0 L0 204.0 0.669*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(6,:) = [rho0 294.0 D0 L0 210.0 0.643*L0 0.1196*L0 16.58 9.86 ...
                     16.56 71.61 1122.30 2.49 6.69];

%
% Data from Jones et al, 1987, J. Appl. Phys., 61(2), 499-502.
%  (rho0 T0 D0 L0 U0 Lf Xf Dm W]
%
function [taylorData] = jonesData

  rho0 = 8930.0;
  D0 = 7.62;
  L0 = 25.4;
  taylorData(1,:) = [rho0 294.0 D0 L0 102.0 0.782*L0 0.18*L0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(2,:) = [rho0 294.0 D0 L0 106.0 0.877*L0 0.41*L0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(3,:) = [rho0 294.0 D0 L0 112.0 0.858*L0 0.28*L0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(4,:) = [rho0 294.0 D0 L0 124.0 0.837*L0 0.20*L0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(5,:) = [rho0 294.0 D0 L0 178.0 0.679*L0 0.0*L0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(6,:) = [rho0 294.0 D0 L0 185.0 0.745*L0 0.26*L0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(7,:) = [rho0 294.0 D0 L0 203.0 0.614*L0 0.0*L0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(8,:) = [rho0 294.0 D0 L0 262.0 0.695*L0 0.0*L0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
