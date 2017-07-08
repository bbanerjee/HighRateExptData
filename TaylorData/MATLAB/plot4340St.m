%
%  Taylor impact test data for 4340 Steel
%
function plot4340St

  %
  % Read  and plot data from House et al.
  %
  figure;
  data1 = houseData;
  plotData(data1, 6);
  writeData(data1, 'StHouse.dat');

  %
  % Read  and plot data from Gust et al.
  %
  data2 = gustData;
  plotData(data2, 8);
  writeData(data2, 'StGust.dat');

  %
  % Read  and plot data from Johnson et al.
  %
  data4 = johnsonData;
  plotData(data4, 10);
  writeData(data4, 'StJohnson.dat');

  %
  % Read and plot data from Jones et al.
  %
  data6 = jonesData;
  plotData(data6, 14);
  writeData(data6, 'StJones.dat');

%
% Function to write data
%
function writeData(data, filename)

  fid = fopen(filename,'w');
  [n,m] = size(data);
  for i=1:n
    Cp = 477.0;
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
    Cp = 477.0;
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
%  (rho0 T0 D0 L0 U0 Lf Xf Dm W]  Rc = 58
%
function [taylorData] = houseData

  D0 = 7.595;
  rho0 = 7830.0;
  T0 = 294.0;
  taylorData(1,:) =  [rho0 T0 D0 1.5*D0  285.0  9.2  3.2 10.9 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(2,:) =  [rho0 T0 D0 2.0*D0  234.0 13.1  5.6 10.2 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(3,:) =  [rho0 T0 D0 2.0*D0  275.0 12.4  5.2 11.2 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(4,:) =  [rho0 T0 D0 2.0*D0  302.0 12.0  5.2 12.2 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(5,:) =  [rho0 T0 D0 3.33*D0 170.0 23.4 11.2  9.2 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(6,:) =  [rho0 T0 D0 3.33*D0 215.0 22.4 10.0 10.3 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(7,:) =  [rho0 T0 D0 5.0*D0  181.0 34.6 15.5  9.5 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(8,:) =  [rho0 T0 D0 5.0*D0  183.0 34.7 15.3  9.8 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(9,:) =  [rho0 T0 D0 5.0*D0  224.0 33.0 11.9 10.5 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(10,:) = [rho0 T0 D0 5.0*D0  234.0 33.1 13.3 10.6 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(11,:) = [rho0 T0 D0 5.0*D0  270.0 31.3 11.8 12.1 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(12,:) = [rho0 T0 D0 7.5*D0  242.0 47.8 17.5 11.6 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(13,:) = [rho0 T0 D0 10.0*D0 215.0 65.7 24.1 10.6 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(14,:) = [rho0 T0 D0 10.0*D0 240.0 64.4 23.2 11.2 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];

%
% Data from Gust , 1982, J. Appl. Phys. 53(5), 3566-3575.
%  (rho0 T0 D0 L0 U0 Lf Xf Dm W] Rc = 40
%
function [taylorData] = gustData

  D0 = 6.0;
  L0 = 30.0;
  taylorData(1,:) = [7843.0 295.0 D0 L0 158.0 0.927*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(2,:) = [7843.0 295.0 D0 L0 181.0 0.907*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(3,:) = [7834.0 295.0 D0 L0 232.0 0.862*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(4,:) = [7845.0 715.0 D0 L0 183.0 0.864*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(5,:) = [7830.0 725.0 D0 L0 312.0 0.678*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(6,:) = [7840.0 732.0 D0 L0 237.0 0.794*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(7,:) = [7820.0 1280.0 D0 L0 177.0 0.655*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(8,:) = [7837.0 1285.0 D0 L0 136.0 0.762*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
  taylorData(9,:) = [7830.0 1285.0 D0 L0 160.0 0.712*L0 -1.0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];

%
% Data from Johnson & Cook, 1983 and Johnson & Holmquist, 1988.
%  (rho0 T0 D0 L0 U0 Lf Xf Dm W]
%
function [taylorData] = johnsonData

  rho0 = 7830.0;
  D0 = 7.62;
  taylorData(1,:) = [rho0 295.0 D0 25.4 208.0 0.885*25.4 8.3 11.1 8.32 ...
                     22.71 91.22 1173.69 2.05 10.71];
  taylorData(2,:) = [rho0 295.0 D0 12.7 282.0 0.843*12.7 4.5 10.4 8.7 ...
                     10.95 43.39 558.69 2.05 5.08];
  taylorData(3,:) = [rho0 295.0 D0  8.1 343.0 0.808*8.1 1.5 12.0 9.5 ...
                     7.08 28.35 399.23 2.24 2.98];

%
% Data from Jones et al, 1987, J. Appl. Phys., 61(2), 499-502.
%  (rho0 T0 D0 L0 U0 Lf Xf Dm W]
%
function [taylorData] = jonesData

  rho0 = 7830.0;
  D0 = 7.62;
  L0 = 25.4;
  taylorData(1,:) = [rho0 294.0 D0 L0 198.0 0.899*L0 0.70*L0 -1.0 -1.0 ...
                     -1.0 -1.0e3 -1.0e3 -1.0 -1.0];
