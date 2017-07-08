%
% Plot the tangent modulus vs sigma_e to find theta_0 and theta_IV
%
function testVoce

  [theta30_1] = plotTangJCRc30Tension;
  [theta30_2] = plotTangJCRc30Shear;
  theta30 = cat(1,theta30_1,theta30_2);
  [theta0fit30, thetaIVfit30] = plotThetavsEdot(theta30, '4340 Steel Rc 30','theta30.dat');
  [a0_30, aIV_30] = plotThetavsT(theta30, theta0fit30, thetaIVfit30, '4340 Steel Rc 30');

  [theta38_1] = plotTangLarsonRc38;
  [theta38_2] = plotTangLYRc38500;
  [theta38_3] = plotTangLYRc381500;
  [theta38_4] = plotTangLYRc382500;
  theta38 = cat(1,theta38_1,theta38_2,theta38_3,theta38_4);
  [n,m] = size(theta38);
  countHi = 1;
  countLo = 1;
  for i=1:n
    if (theta38(i,4) > 1040)
      theta38Hi(countHi,:) = theta38(i,:);
      countHi = countHi + 1;
    else
      theta38Lo(countLo,:) = theta38(i,:);
      countLo = countLo + 1;
    end
  end
  [theta0fit38Lo, thetaIVfit38Lo] = plotThetavsEdot(theta38Lo, '4340 Steel Rc 38','theta38Lo.dat');
  [a0_38Lo, aIV_38Lo] = plotThetavsT(theta38Lo, theta0fit38Lo, thetaIVfit38Lo,  '4340 Steel Rc 38');
  [theta0fit38Hi, thetaIVfit38Hi] = plotThetavsEdot(theta38Hi, '4340 Steel Rc 38','theta38Hi.dat');
  [a0_38Hi, aIV_38Hi] = plotThetavsT(theta38Hi, theta0fit38Hi, thetaIVfit38Hi,  '4340 Steel Rc 38')

  [theta45_1] = plotTangChiRc45_0001;
  [theta45_2] = plotTangChiRc45_1000;
  theta45 = cat(1,theta45_1,theta45_2);
  [theta0fit45, thetaIVfit45] = plotThetavsEdot(theta45, '4340 Steel Rc 45','theta45.dat');
  [a0_45, aIV_45] = plotThetavsT(theta45, theta0fit45, thetaIVfit45, '4340 Steel Rc 45');

  [theta49_1] = plotTangChiRc49_0001;
  [theta49_2] = plotTangChiRc49_1000;
  theta49 = cat(1,theta49_1,theta49_2);
  [theta0fit49, thetaIVfit49] = plotThetavsEdot(theta49, '4340 Steel Rc 49','theta49.dat');
  [a0_49, aIV_49] = plotThetavsT(theta49, theta0fit49, thetaIVfit49, '4340 Steel Rc 49');

  Rc = [30 38 45 49];
  a0_0 = [a0_30(1) a0_38Lo(1) a0_45(1) a0_49(1)];
  a0_1 = [a0_30(2) a0_38Lo(2) a0_45(2) a0_49(2)];
  a0_2 = [a0_30(3) a0_38Lo(3) a0_45(3) a0_49(3)];
  a0_3 = [a0_30(4) a0_38Lo(4) a0_45(4) a0_49(4)];
  aIV_0 = [aIV_30(1) aIV_38Lo(1) aIV_45(1) aIV_49(1)];
  aIV_1 = [aIV_30(2) aIV_38Lo(2) aIV_45(2) aIV_49(2)];
  aIV_2 = [aIV_30(3) aIV_38Lo(3) aIV_45(3) aIV_49(3)];
  aIV_3 = [aIV_30(4) aIV_38Lo(4) aIV_45(4) aIV_49(4)];
  a00_mean = median(a0_0);
  a01_mean = median(a0_1);
  a02_mean = median(a0_2);
  a03_mean = median(a0_3);
  aIV0_mean = median(aIV_0);
  aIV1_mean = median(aIV_1);
  aIV2_mean = median(aIV_2);
  aIV3_mean = median(aIV_3);
  str0 = sprintf('\\theta_0 = %g + %g log(edot) + %g sqrt(edot) + %g T', ...
        a00_mean,a01_mean,a02_mean,a03_mean)
  strIV = sprintf('\\theta_IV = %g + %g log(edot) + %g sqrt(edot) + %g T', ...
        aIV0_mean,aIV1_mean,aIV2_mean,aIV3_mean)

  Rcmin = 25;
  Rcmax = 50;
  nRc = 100;
  dRc = (Rcmax - Rcmin)/nRc;
  for i=1:nRc+1
    RcFit(i) = Rcmin + (i-1)*dRc;
    a00_meanFit(i) = a00_mean;
    a01_meanFit(i) = a01_mean;
    a02_meanFit(i) = a02_mean;
    a03_meanFit(i) = a03_mean;
    aIV0_meanFit(i) = aIV0_mean;
    aIV1_meanFit(i) = aIV1_mean;
    aIV2_meanFit(i) = aIV2_mean;
    aIV3_meanFit(i) = aIV3_mean;
  end
  [fita0_0] = polyfit(Rc, a0_0, 3)
  [a0_0Fit] = polyval(fita0_0, RcFit);
  [fita0_1] = polyfit(Rc, a0_1, 3)
  [a0_1Fit] = polyval(fita0_1, RcFit);
  [fita0_2] = polyfit(Rc, a0_2, 3)
  [a0_2Fit] = polyval(fita0_2, RcFit);
  [fita0_3] = polyfit(Rc, a0_3, 3)
  [a0_3Fit] = polyval(fita0_3, RcFit);

  [fitaIV_0] = polyfit(Rc, aIV_0, 3)
  [aIV_0Fit] = polyval(fitaIV_0, RcFit);
  [fitaIV_1] = polyfit(Rc, aIV_1, 3)
  [aIV_1Fit] = polyval(fitaIV_1, RcFit);
  [fitaIV_2] = polyfit(Rc, aIV_2, 3)
  [aIV_2Fit] = polyval(fitaIV_2, RcFit);
  [fitaIV_3] = polyfit(Rc, aIV_3, 3)
  [aIV_3Fit] = polyval(fitaIV_3, RcFit);

%  fig00 = figure;
%  subplot(2,2,1);
%  plot(Rc, a0_0, 'ro'); hold on;
%  plot(RcFit, a0_0Fit, 'g-');
%  plot(RcFit, a00_meanFit, 'b--');
%  subplot(2,2,2);
%  plot(Rc, a0_1, 'rs'); hold on;
%  plot(RcFit, a0_1Fit, 'g-');
%  plot(RcFit, a01_meanFit, 'b--');
%  subplot(2,2,3);
%  plot(Rc, a0_2, 'rd'); hold on;
%  plot(RcFit, a0_2Fit, 'g-');
%  plot(RcFit, a02_meanFit, 'b--');
%  subplot(2,2,4);
%  plot(Rc, a0_3, 'rp'); hold on;
%  plot(RcFit, a0_3Fit, 'g-');
%  plot(RcFit, a03_meanFit, 'b--');
%
%  fig01 = figure;
%  subplot(2,2,1);
%  plot(Rc, aIV_0, 'bo'); hold on;
%  plot(RcFit, aIV_0Fit, 'g-');
%  plot(RcFit, aIV0_meanFit, 'b--');
%  subplot(2,2,2);
%  plot(Rc, aIV_1, 'bs'); hold on;
%  plot(RcFit, aIV_1Fit, 'g-');
%  plot(RcFit, aIV1_meanFit, 'b--');
%  subplot(2,2,3);
%  plot(Rc, aIV_2, 'bd'); hold on;
%  plot(RcFit, aIV_2Fit, 'g-');
%  plot(RcFit, aIV2_meanFit, 'b--');
%  subplot(2,2,4);
%  plot(Rc, aIV_3, 'bp'); hold on;
%  plot(RcFit, aIV_3Fit, 'g-');
%  plot(RcFit, aIV3_meanFit, 'b--');

  fig00 = figure;
  pp1 = plot(Rc, a0_0, 'ro', 'LineWidth', 2, 'MarkerSize', 8); hold on;
  pp1Fit = plot(RcFit, a00_meanFit, 'b-', 'LineWidth', 2);
  xlabel('Hardness (R_c)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('a_{00} (MPa)', 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim', [25 50], 'YLim', [-1.0e4 6.5e4]);
  set(gca, 'YGrid', 'on', 'LineWidth', 3);
  axis square;
  fig01 = figure;
  pp2 = plot(Rc, a0_1, 'rs', 'LineWidth', 2, 'MarkerSize', 8); hold on;
  pp2Fit = plot(RcFit, a01_meanFit, 'b-', 'LineWidth', 2);
  xlabel('Hardness (R_c)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('a_{10} (MPa-ln(s))', 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim', [25 50], 'YLim', [-80 60]);
  set(gca, 'YGrid', 'on', 'LineWidth', 3);
  axis square;
  fig02 = figure;
  pp3 = plot(Rc, a0_2, 'rd', 'LineWidth', 2, 'MarkerSize', 8); hold on;
  pp3Fit = plot(RcFit, a02_meanFit, 'b-', 'LineWidth', 2);
  xlabel('Hardness (R_c)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('a_{20} (MPa-s^{1/2})', 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim', [25 50], 'YLim', [-400 650]);
  set(gca, 'YGrid', 'on', 'LineWidth', 3);
  axis square;
  fig03 = figure;
  pp4 = plot(Rc, a0_3, 'rp', 'LineWidth', 2, 'MarkerSize', 8); hold on;
  pp4Fit = plot(RcFit, a03_meanFit, 'b-', 'LineWidth', 2);
  xlabel('Hardness (R_c)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('a_{30} (MPa/K)', 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  set(gca, 'XLim', [25 50], 'YLim', [-200 100]);
  set(gca, 'YGrid', 'on', 'LineWidth', 3);
  axis square;

%====================================================================
function [fit0WRTedot, fitIVWRTedot] = plotThetavsEdot(theta, label, fileName)

  format short e;
  theta = sortrows(theta, 3);
  theta0 = theta(:,2);
  thetaIV = theta(:,1)+theta(:,2);
  edot = theta(:,3);
  T = theta(:,4);
  fid = fopen(fileName, 'w');
  fprintf(fid,'theta0\n');
  for i=1:length(theta0)
    fprintf(fid, '[%g, %g, %g]\n', T(i), edot(i), theta0(i));
  end
  fprintf(fid,'thetaIV\n');
  for i=1:length(theta0)
    fprintf(fid, '[%g, %g, %g]\n', T(i), edot(i), thetaIV(i));
  end
  fclose(fid);

  Tu = unique(T);
  for i=1:length(Tu)
    count = 1;
    for j=1:length(T)
      if (Tu(i) == T(j))
        thetaEdot(i,count,1) = theta0(j);
        thetaEdot(i,count,2) = thetaIV(j);
        thetaEdot(i,count,3) = edot(j);
        thetaEdot(i,count,4) = T(j);
        count = count+1;
      end
    end
  end

  for kk=1:length(Tu)
    theta0_val = thetaEdot(kk,:,1);
    thetaIV_val = thetaEdot(kk,:,2);
    edot_val = thetaEdot(kk,:,3);
    T_val = thetaEdot(kk,:,4);
    n = length(edot_val);
    count = 1;
    for j=1:n
      if (edot_val(j) ~= 0)
        t0_val(count) = theta0_val(j);
        tIV_val(count) = thetaIV_val(j);
        ed_val(count) = edot_val(j);
        tt_val(count) = T_val(j);
        count = count+1;
      end
    end
    data_val = cat(1,t0_val,tIV_val,ed_val,tt_val);

    if (length(ed_val) < 2) 
      continue;
    end

    ttt = cat(2, ed_val', t0_val')
   
    %
    % Fit a polygon to sqrt(edot) data
    %
    pfit0 = polyfit(sqrt(ed_val), t0_val, 1);
    pfitIV = polyfit(sqrt(ed_val), tIV_val, 1);
    edotmax = max(sqrt(ed_val));
    edotmin = min(sqrt(ed_val));
    nedot = 100;
    dedot = (edotmax-edotmin)/nedot;
    for i=1:nedot+1
      edotfit(i) = edotmin + (i-1)*dedot;
    end
    theta0Fit = polyval(pfit0, edotfit);
    thetaIVFit = polyval(pfitIV, edotfit);

%    figure;
%    subplot(2,2,1);
%    semilogx(ed_val, t0_val, 'ro-', 'LineWidth', 3);  hold on;
%    set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
%    xlabel('edot (/s)', 'FontName', 'bookman', 'FontSize', 16);
%    ylabel('\theta_0 (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
%    title(label, 'FontName', 'bookman', 'FontSize', 16);
%    grid on;
%    subplot(2,2,2);
%    semilogx(ed_val, tIV_val, 'bs-', 'LineWidth', 3);  hold on;
%    set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
%    xlabel('edot (/s)', 'FontName', 'bookman', 'FontSize', 16);
%    ylabel('\theta_{IV} (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
%    title(label, 'FontName', 'bookman', 'FontSize', 16);
%    grid on;
%    subplot(2,2,3);
%    plot(sqrt(ed_val), t0_val, 'ro-', 'LineWidth', 3);  hold on;
%    plot(edotfit, theta0Fit, 'r--', 'LineWidth', 3);  hold on;
%    set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
%    xlabel('edot^{1/2} (/s)', 'FontName', 'bookman', 'FontSize', 16);
%    ylabel('\theta_0 (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
%    title(label, 'FontName', 'bookman', 'FontSize', 16);
%    grid on;
%    subplot(2,2,4);
%    plot(sqrt(ed_val), tIV_val, 'bs-', 'LineWidth', 3);  hold on;
%    plot(edotfit, thetaIVFit, 'b--', 'LineWidth', 3);  hold on;
%    set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
%    xlabel('edot^{1/2} (/s)', 'FontName', 'bookman', 'FontSize', 16);
%    ylabel('\theta_{IV} (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
%    title(label, 'FontName', 'bookman', 'FontSize', 16);
%    grid on;

    %
    % Subtract the fit parameters from theta0
    %
    a1 = pfit0(1);
    a0 = pfit0(2);
    fit0(1) = a0;
    fit0(2) = a1;
    tt0 = a0 + a1*sqrt(ed_val);
    
    a1 = pfitIV(1);
    a0 = pfitIV(2);
    fitIV(1) = a0;
    fitIV(2) = a1;
    ttIV = a0 + a1*sqrt(ed_val);

    t0_val = t0_val - tt0;
    tIV_val = tIV_val - ttIV;


    %
    % Fit a polygon to log(edot) data
    %
    pfit0 = polyfit(log(ed_val), t0_val, 1);
    pfitIV = polyfit(log(ed_val), tIV_val, 1);
    edotmax = max(ed_val);
    edotmin = min(ed_val);
    nedot = 100;
    dedot = (edotmax-edotmin)/nedot;
    for i=1:nedot+1
      edotfit(i) = edotmin + (i-1)*dedot;
    end
    theta0Fit = polyval(pfit0, log(edotfit));
    thetaIVFit = polyval(pfitIV, log(edotfit));

    %figure;
    %subplot(2,2,1);
    %semilogx(ed_val, t0_val, 'ro-', 'LineWidth', 3);  hold on;
    %semilogx(edotfit, theta0Fit, 'r--', 'LineWidth', 3);  hold on;
    %set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
    %xlabel('edot (/s)', 'FontName', 'bookman', 'FontSize', 16);
    %ylabel('\theta_0 (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
    %title(label, 'FontName', 'bookman', 'FontSize', 16);
    %grid on;
    %subplot(2,2,2);
    %semilogx(ed_val, tIV_val, 'bs-', 'LineWidth', 3);  hold on;
    %semilogx(edotfit, theta0Fit, 'b--', 'LineWidth', 3);  hold on;
    %set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
    %xlabel('edot (/s)', 'FontName', 'bookman', 'FontSize', 16);
    %ylabel('\theta_{IV} (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
    %title(label, 'FontName', 'bookman', 'FontSize', 16);
    %grid on;
    %subplot(2,2,3);
    %plot(sqrt(ed_val), t0_val, 'ro-', 'LineWidth', 3);  hold on;
    %set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
    %xlabel('edot^{1/2} (/s)', 'FontName', 'bookman', 'FontSize', 16);
    %ylabel('\theta_0 (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
    %title(label, 'FontName', 'bookman', 'FontSize', 16);
    %grid on;
    %subplot(2,2,4);
    %plot(sqrt(ed_val), tIV_val, 'bs-', 'LineWidth', 3);  hold on;
    %set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
    %xlabel('edot^{1/2} (/s)', 'FontName', 'bookman', 'FontSize', 16);
    %ylabel('\theta_{IV} (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
    %title(label, 'FontName', 'bookman', 'FontSize', 16);
    %grid on;
  
    %
    % Subtract the fit parameters from theta0
    %
    a1 = pfit0(1);
    a0 = pfit0(2);
    fit0(3) = a0;
    fit0(4) = a1;
    tt0 = a0 + a1*log(ed_val);
    
    a1 = pfitIV(1);
    a0 = pfitIV(2);
    fitIV(3) = a0;
    fitIV(4) = a1;
    ttIV = a0 + a1*log(ed_val);

    t0_val = t0_val - tt0;
    tIV_val = tIV_val - ttIV;

    %figure;
    %subplot(2,2,1);
    %semilogx(ed_val, t0_val, 'ro-', 'LineWidth', 3);  hold on;
    %set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
    %xlabel('edot (/s)', 'FontName', 'bookman', 'FontSize', 16);
    %ylabel('\theta_0 (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
    %title(label, 'FontName', 'bookman', 'FontSize', 16);
    %grid on;
    %subplot(2,2,2);
    %semilogx(ed_val, tIV_val, 'bs-', 'LineWidth', 3);  hold on;
    %set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
    %xlabel('edot (/s)', 'FontName', 'bookman', 'FontSize', 16);
    %ylabel('\theta_{IV} (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
    %title(label, 'FontName', 'bookman', 'FontSize', 16);
    %grid on;
    %subplot(2,2,3);
    %plot(sqrt(ed_val), t0_val, 'ro-', 'LineWidth', 3);  hold on;
    %set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
    %xlabel('edot^{1/2} (/s)', 'FontName', 'bookman', 'FontSize', 16);
    %ylabel('\theta_0 (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
    %title(label, 'FontName', 'bookman', 'FontSize', 16);
    %grid on;
    %subplot(2,2,4);
    %plot(sqrt(ed_val), tIV_val, 'bs-', 'LineWidth', 3);  hold on;
    %set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
    %xlabel('edot^{1/2} (/s)', 'FontName', 'bookman', 'FontSize', 16);
    %ylabel('\theta_{IV} (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
    %title(label, 'FontName', 'bookman', 'FontSize', 16);
    %grid on;

    %
    % Finally plot the total fit curve
    %
    for i=1:length(edotfit)
      theta0_fitted(i) = fit0(1) + fit0(3) + fit0(2)*sqrt(edotfit(i)) + ...
                         fit0(4)*log(edotfit(i));
      thetaIV_fitted(i) = fitIV(1) + fitIV(3) + fitIV(2)*sqrt(edotfit(i)) + ...
                          fitIV(4)*log(edotfit(i));
    end
 
%    figure;
%    str = sprintf('%s T = %g', label, T_val(1))
%    str0 = sprintf('%g + %g log(edot) + %g sqrt(edot)', (fit0(1)+fit0(3)), ...
%           fit0(4), fit0(2));
%    strIV = sprintf('%g + %g log(edot) + %g sqrt(edot)', (fitIV(1)+fitIV(3)), ...
%           fitIV(4), fitIV(2));
%    subplot(1,2,1);
%    semilogx(edot_val, theta0_val, 'ro-', 'LineWidth', 3); hold on;
%    semilogx(edotfit, theta0_fitted, 'g--', 'LineWidth', 3); hold on;
%    gg = text(0,0,str0);
%    set(gg, 'Rotation', 90);
%    title(str);
%    subplot(1,2,2);
%    semilogx(edot_val, thetaIV_val, 'mo-', 'LineWidth', 3); hold on;
%    semilogx(edotfit, thetaIV_fitted, 'g--', 'LineWidth', 3); hold on;
%    gg = text(0,0,strIV);
%    set(gg, 'Rotation', 90);
%    title(str);

    %
    % Save the fit data
    %
    theta0FitData(kk,:) = [T_val(1) (fit0(1)+fit0(3)) fit0(4) fit0(2)];
    thetaIVFitData(kk,:) = [T_val(1) (fitIV(1)+fitIV(3)) fitIV(4) fitIV(2)];

    clear theta0_val thetaIV_val edot_val T_val;
    clear t0_val tIV_val ed_val tt_val;
    clear data_val;
  end

  %
  % Average the fit data (temperature independent)
  %
  fit0WRTedot = mean(theta0FitData,1);
  fitIVWRTedot = mean(thetaIVFitData,1);

%====================================================================
function [a0, aIV] = plotThetavsT(theta, Efit0, EfitIV, label)

  %
  % Initial data
  %
  theta0 = theta(:,2);
  thetaIV = theta(:,1)+theta(:,2);
  edot = theta(:,3);
  T = theta(:,4);

  %
  % remove edot dependence
  %
  theta0 = theta0 - Efit0(2) - Efit0(3)*log(edot) - Efit0(4)*sqrt(edot);
  thetaIV = thetaIV - EfitIV(2) - EfitIV(3)*log(edot) - EfitIV(4)*sqrt(edot);

  Tmax = max(T);
  Tmin = min(T);
  nT = 100;
  dT = (Tmax-Tmin)/nT;
  for i=1:nT+1
    Tfit(i) = Tmin + (i-1)*dT;
  end

  [Tfit0] = polyfit(T, theta0, 1);
  [TfitIV] = polyfit(T, thetaIV, 1);
  theta0Tfit = polyval(Tfit0, Tfit);
  thetaIVTfit = polyval(TfitIV, Tfit);

  str0 = sprintf('\\theta_0 = %g + %g log(edot) + %g sqrt(edot) + %g T', ...
        (Efit0(2)+Tfit0(2)),Efit0(3),Efit0(4),Tfit0(1));
  strIV = sprintf('\\theta_IV = %g + %g log(edot) + %g sqrt(edot) + %g T', ...
        (EfitIV(2)+TfitIV(2)),EfitIV(3),EfitIV(4),TfitIV(1));

%  figure;
%  subplot(1,2,1);
%  plot(T, theta0, 'ro-', 'LineWidth', 3);  hold on;
%  plot(Tfit, theta0Tfit, 'r--', 'LineWidth', 2);
%  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
%  xlabel('T (K)', 'FontName', 'bookman', 'FontSize', 16);
%  ylabel('\theta_0 (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
%  title(label, 'FontName', 'bookman', 'FontSize', 16);
%  gg = text(0,0,str0);
%  set(gg, 'Rotation', 90);
%  grid on;
%  subplot(1,2,2);
%  plot(T, thetaIV, 'bs-', 'LineWidth', 3);  hold on;
%  plot(Tfit, thetaIVTfit, 'b--', 'LineWidth', 2);
%  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
%  xlabel('T (K)', 'FontName', 'bookman', 'FontSize', 16);
%  ylabel('\theta_{IV} (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
%  title(label, 'FontName', 'bookman', 'FontSize', 16);
%  gg = text(0,0,strIV);
%  set(gg, 'Rotation', 90);
%  grid on;

  a0(1) = Efit0(2) + Tfit0(2);
  a0(2) = Efit0(3);
  a0(3) = Efit0(4);
  a0(4) = Tfit0(1);
  aIV(1) = EfitIV(2) + TfitIV(2);
  aIV(2) = EfitIV(3);
  aIV(3) = EfitIV(4);
  aIV(4) = TfitIV(1);

%====================================================================
%
% Load experimental data from Johnson-Cook (Rc = 30)
%
function [theta0] = plotTangJCRc30Tension

  fig00 = figure;

  sigemin = 0.0;
  sigemax = 1.0;
  nsige = 100;
  dsige = (sigemax-sigemin)/nsige;
  for i=1:nsige+1 
    sigefit(i) = sigemin + (i-1)*dsige;
  end

  %
  % 0.002/s 298K
  %
  epdot = 0.002;
  T = 298.0;
  Rc = 30.0;
  load ThetaSigeEp0002298KRc30Ten.dat;
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp0002298KRc30Ten);

  theta = theta*1.0e-6;
  ptangiso1 = plot(Fx, theta, 'ro-'); hold on;
  set(ptangiso1, 'LineWidth', 3);
  str1 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'r--');
  %set(plfit, 'LineWidth', 2);
  %theta0(1,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(1,:) = [-tt1 tt1 epdot T Rc];

  %
  % 570/s 298K
  %
  epdot = 570.0;
  T = 298.0;
  Rc = 30;
  load ThetaSigeEp570298KRc30Ten.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp570298KRc30Ten);

  theta = theta*1.0e-6;
  ptangiso2 = plot(Fx, theta, 'g^-'); hold on;
  set(ptangiso2, 'LineWidth', 3);
  str2 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'g--');
  %set(plfit, 'LineWidth', 2);
  %theta0(2,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(2,:) = [-tt1 tt1 epdot T Rc];

  %
  % 604/s 500K
  %
  epdot = 604.0;
  T = 500.0;
  Rc = 30;
  load ThetaSigeEp604500KRc30Ten.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp604500KRc30Ten);

  theta = theta*1.0e-6;
  ptangiso3 = plot(Fx, theta, 'bp-'); hold on;
  set(ptangiso3, 'LineWidth', 3);
  str3 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'b--');
  %set(plfit, 'LineWidth', 2);
  %theta0(3,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(3,:) = [-tt1 tt1 epdot T Rc];

  %
  % 650/s 735K
  %
  epdot = 650.0;
  T = 735.0;
  Rc = 30;
  load ThetaSigeEp650735KRc30Ten.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp650735KRc30Ten);

  theta = theta*1.0e-6;
  ptangiso4 = plot(Fx, theta, 'md-'); hold on;
  set(ptangiso4, 'LineWidth', 3);
  str4 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'm--');
  %set(plfit, 'LineWidth', 2);
  %theta0(4,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(4,:) = [-tt1 tt1 epdot T Rc];
  
  %set(gca, 'XLim', [0 1], 'YLim', [0 8000] );
  set(gca, 'XLim', [0 1]);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha) ', ...
         'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 30 (Tension)', 'FontName', 'bookman', 'FontSize', 16);
  grid on;
  axis square;
  legend([ptangiso1 ptangiso2 ptangiso3 ptangiso4], str1, str2, ...
         str3, str4);

%====================================================================
function [theta0] = plotTangJCRc30Shear

  fig00 = figure;

  sigemin = 0.0;
  sigemax = 1.0;
  nsige = 100;
  dsige = (sigemax-sigemin)/nsige;
  for i=1:nsige+1 
    sigefit(i) = sigemin + (i-1)*dsige;
  end

  %
  % 0.009/s 298K
  %
  epdot = 0.009;
  T = 298.0;
  Rc = 30.0;
  load ThetaSigeEp0009298KRc30Shear.dat;
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp0009298KRc30Shear);

  theta = theta*1.0e-6;
  ptangiso1 = plot(Fx, theta, 'rx-'); hold on;
  set(ptangiso1, 'LineWidth', 3);
  str1 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'r--');
  %set(plfit, 'LineWidth', 2);
  %theta0(1,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(1,:) = [-tt1 tt1 epdot T Rc];

  %
  % 0.10/s 298K
  %
  epdot = 0.1;
  T = 298.0;
  Rc = 30.0;
  load ThetaSigeEp010298KRc30Shear.dat;
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp010298KRc30Shear);

  theta = theta*1.0e-6;
  ptangiso2 = plot(Fx, theta, 'gs-'); hold on;
  set(ptangiso2, 'LineWidth', 3);
  str2 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'g--');
  %set(plfit, 'LineWidth', 2);
  %theta0(2,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(2,:) = [-tt1 tt1 epdot T Rc];

  %
  % 1.1/s 298K
  %
  epdot = 1.1;
  T = 298.0;
  load ThetaSigeEp1_1298KRc30Shear.dat;
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp1_1298KRc30Shear);

  theta = theta*1.0e-6;
  ptangiso3 = plot(Fx, theta, 'bv-'); hold on;
  set(ptangiso3, 'LineWidth', 3);
  str3 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'b--');
  %set(plfit, 'LineWidth', 2);
  %theta0(3,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(3,:) = [-tt1 tt1 epdot T Rc];

  %set(gca, 'XLim', [0 1], 'YLim', [0 8000] );
  set(gca, 'XLim', [0 1]);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha) ', ...
         'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 30 (Shear)', 'FontName', 'bookman', 'FontSize', 16);
  grid on;
  axis square;
  legend([ptangiso1 ptangiso2 ptangiso3], str1, str2, str3);

%====================================================================
%
% Load experimental data from Larson (Rc = 38)
%
function [theta0] = plotTangLarsonRc38

  fig00 = figure;

  sigemin = 0.0;
  sigemax = 1.0;
  nsige = 100;
  dsige = (sigemax-sigemin)/nsige;
  for i=1:nsige+1 
    sigefit(i) = sigemin + (i-1)*dsige;
  end

  %
  % 0.0002/s 258 K
  %
  epdot = 0.0002;
  T = 258.0;
  Rc = 38.0;
  load ThetaSigeEp0002258KRc38.dat;
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp0002258KRc38);

  theta = theta*1.0e-6;
  ptangiso1 = plot(Fx, theta, 'ro-'); hold on;
  set(ptangiso1, 'LineWidth', 3);
  str1 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'r--');
  %set(plfit, 'LineWidth', 2);
  %theta0(1,:) = [pfit(1) pfit(2) epdot T Rc];

  theta0(1,:) = [-(theta(1)-theta(length(theta))) theta(1) epdot T Rc];
  
  %
  % 0.0002/s 298 K
  %
  epdot = 0.0002;
  T = 298.0;
  Rc = 38.0;
  load ThetaSigeEp0002298KRc38.dat;
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp0002298KRc38);

  theta = theta*1.0e-6;
  ptangiso2 = plot(Fx, theta, 'gx-'); hold on;
  set(ptangiso2, 'LineWidth', 3);
  str2 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'g--');
  %set(plfit, 'LineWidth', 2);
  %theta0(2,:) = [pfit(1) pfit(2) epdot T Rc];

  theta0(2,:) = [-(theta(1)-theta(length(theta))) theta(1) epdot T Rc];
  
  %
  % 0.0002/s 373 K
  %
  epdot = 0.0002;
  T = 373.0;
  Rc = 38.0;
  load ThetaSigeEp0002373KRc38.dat;
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp0002373KRc38);

  theta = theta*1.0e-6;
  ptangiso3 = plot(Fx, theta, 'bs-'); hold on;
  set(ptangiso3, 'LineWidth', 3);
  str3 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'b--');
  %set(plfit, 'LineWidth', 2);
  %theta0(3,:) = [pfit(1) pfit(2) epdot T Rc];

  theta0(3,:) = [-(theta(1)-theta(length(theta))) theta(1) epdot T Rc];
  
  %set(gca, 'XLim', [0 1], 'YLim', [0 5000] );
  set(gca, 'XLim', [0 1]);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha) ', ...
         'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 38 0.0002/s', 'FontName', 'bookman', 'FontSize', 16);
  axis square;
  legend([ptangiso1 ptangiso2 ptangiso3], str1, str2, str3);

%====================================================================
function [theta0] = plotTangLYRc38500

  fig00 = figure;

  sigemin = 0.0;
  sigemax = 1.0;
  nsige = 100;
  dsige = (sigemax-sigemin)/nsige;
  for i=1:nsige+1 
    sigefit(i) = sigemin + (i-1)*dsige;
  end

  %
  % 500/s 298K
  %
  epdot = 500.0;
  T = 298.0;
  Rc = 38;
  load ThetaSigeEp500298KRc38.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp500298KRc38);

  theta = theta*1.0e-6;
  ptangiso1 = plot(Fx, theta, 'ro-'); hold on;
  set(ptangiso1, 'LineWidth', 3);
  str1 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'r--');
  %set(plfit, 'LineWidth', 2);
  %theta0(1,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(1,:) = [-tt1 tt1 epdot T Rc];
  
  %
  % 500/s 573K
  %
  epdot = 500.0;
  T = 573.0;
  Rc = 38;
  load ThetaSigeEp500573KRc38.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp500573KRc38);

  theta = theta*1.0e-6;
  ptangiso2 = plot(Fx, theta, 'gx-'); hold on;
  set(ptangiso2, 'LineWidth', 3);
  str2 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'g--');
  %set(plfit, 'LineWidth', 2);
  %theta0(2,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(2,:) = [-tt1 tt1 epdot T Rc];
  
  %
  % 500/s 773K
  %
  epdot = 500.0;
  T = 773.0;
  Rc = 38;
  load ThetaSigeEp500773KRc38.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp500773KRc38);

  theta = theta*1.0e-6;
  ptangiso3 = plot(Fx, theta, 'bs-'); hold on;
  set(ptangiso3, 'LineWidth', 3);
  str3 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'b--');
  %set(plfit, 'LineWidth', 2);
  %theta0(3,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(3,:) = [-tt1 tt1 epdot T Rc];
  
  %set(gca, 'XLim', [0 1], 'YLim', [0 16000] );
  set(gca, 'XLim', [0 1]);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha) ', ...
         'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 38 500/s', 'FontName', 'bookman', 'FontSize', 16);
  axis square;
  legend([ptangiso1 ptangiso2 ptangiso3], str1, str2, str3);

%====================================================================
function [theta0] = plotTangLYRc381500

  fig00 = figure;

  sigemin = 0.0;
  sigemax = 1.0;
  nsige = 100;
  dsige = (sigemax-sigemin)/nsige;
  for i=1:nsige+1 
    sigefit(i) = sigemin + (i-1)*dsige;
  end

  %
  % 1500/s 298K
  %
  epdot = 1500.0;
  T = 298.0;
  Rc = 38;
  load ThetaSigeEp1500298KRc38.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp1500298KRc38);

  theta = theta*1.0e-6;
  ptangiso1 = plot(Fx, theta, 'ro-'); hold on;
  set(ptangiso1, 'LineWidth', 3);
  str1 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'r--');
  %set(plfit, 'LineWidth', 2);
  %theta0(1,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(1,:) = [-tt1 tt1 epdot T Rc];
  
  %
  % 1500/s 573K
  %
  epdot = 1500.0;
  T = 573.0;
  Rc = 38;
  load ThetaSigeEp1500573KRc38.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp1500573KRc38);

  theta = theta*1.0e-6;
  ptangiso2 = plot(Fx, theta, 'gx-'); hold on;
  set(ptangiso2, 'LineWidth', 3);
  str2 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'g--');
  %set(plfit, 'LineWidth', 2);
  %theta0(2,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(2,:) = [-tt1 tt1 epdot T Rc];
  
  %
  % 1500/s 973K
  %
  epdot = 1500.0;
  T = 973.0;
  Rc = 38;
  load ThetaSigeEp1500973KRc38.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp1500973KRc38);

  theta = theta*1.0e-6;
  ptangiso3 = plot(Fx, theta, 'bs-'); hold on;
  set(ptangiso3, 'LineWidth', 3);
  str3 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'b--');
  %set(plfit, 'LineWidth', 2);
  %theta0(3,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(3,:) = [-tt1 tt1 epdot T Rc];
  
  %
  % 1500/s 1173K
  %
  epdot = 1500.0;
  T = 1173.0;
  Rc = 38;
  load ThetaSigeEp15001173KRc38.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp15001173KRc38);

  theta = theta*1.0e-6;
  ptangiso4 = plot(Fx, theta, 'mv-'); hold on;
  set(ptangiso4, 'LineWidth', 3);
  str4 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'm--');
  %set(plfit, 'LineWidth', 2);
  %theta0(4,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(4,:) = [-tt1 tt1 epdot T Rc];
  
  %
  % 1500/s 1373K
  %
  epdot = 1500.0;
  T = 1373.0;
  Rc = 38;
  load ThetaSigeEp15001373KRc38.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp15001373KRc38);

  theta = theta*1.0e-6;
  ptangiso5 = plot(Fx, theta, 'kd-'); hold on;
  set(ptangiso5, 'LineWidth', 3);
  str5 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'k--');
  %set(plfit, 'LineWidth', 2);
  %theta0(5,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(5,:) = [-tt1 tt1 epdot T Rc];
  
  %set(gca, 'XLim', [0 1], 'YLim', [0 8000] );
  set(gca, 'XLim', [0 1]);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha) ', ...
         'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 38 1500/s', 'FontName', 'bookman', 'FontSize', 16);
  axis square
  legend([ptangiso1 ptangiso2 ptangiso3 ptangiso4 ptangiso5], str1, str2, ...
         str3, str4, str5);

%====================================================================
function [theta0] = plotTangLYRc382500

  fig00 = figure;

  sigemin = 0.0;
  sigemax = 1.0;
  nsige = 100;
  dsige = (sigemax-sigemin)/nsige;
  for i=1:nsige+1 
    sigefit(i) = sigemin + (i-1)*dsige;
  end

  %
  % 2500/s 773K
  %
  epdot = 2500.0;
  T = 773.0;
  Rc = 38;
  load ThetaSigeEp2500773KRc38.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp2500773KRc38);

  theta = theta*1.0e-6;
  ptangiso1 = plot(Fx, theta, 'ro-'); hold on;
  set(ptangiso1, 'LineWidth', 3);
  str1 = sprintf('%0.4g K, %0.5g /s', T, epdot); 
  
  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'r--');
  %set(plfit, 'LineWidth', 2);
  %theta0(1,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(1,:) = [-tt1 tt1 epdot T Rc];

  %
  % 2500/s 973K
  %
  epdot = 2500.0;
  T = 973.0;
  Rc = 38;
  load ThetaSigeEp2500973KRc38.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp2500973KRc38);

  theta = theta*1.0e-6;
  ptangiso2 = plot(Fx, theta, 'gx-'); hold on;
  set(ptangiso2, 'LineWidth', 3);
  str2 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'g--');
  %set(plfit, 'LineWidth', 2);
  %theta0(2,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(2,:) = [-tt1 tt1 epdot T Rc];
  
  %
  % 2500/s 1173K
  %
  epdot = 2500.0;
  T = 1173.0;
  Rc = 38;
  load ThetaSigeEp25001173KRc38.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp25001173KRc38);

  theta = theta*1.0e-6;
  ptangiso3 = plot(Fx, theta, 'bs-'); hold on;
  set(ptangiso3, 'LineWidth', 3);
  str3 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'b--');
  %set(plfit, 'LineWidth', 2);
  %theta0(3,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(3,:) = [-tt1 tt1 epdot T Rc];
  
  %
  % 2500/s 1373K
  %
  epdot = 2500.0;
  T = 1373.0;
  Rc = 38;
  load ThetaSigeEp25001373KRc38.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp25001373KRc38);

  theta = theta*1.0e-6;
  ptangiso4 = plot(Fx, theta, 'mv-'); hold on;
  set(ptangiso4, 'LineWidth', 3);
  str4 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'm--');
  %set(plfit, 'LineWidth', 2);
  %theta0(4,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(4,:) = [-tt1 tt1 epdot T Rc];
  
  %set(gca, 'XLim', [0 1], 'YLim', [0 4000] );
  set(gca, 'XLim', [0 1]);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha) ', ...
         'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 38 2500/s', 'FontName', 'bookman', 'FontSize', 16);
  axis square;
  legend([ptangiso1 ptangiso2 ptangiso3 ptangiso4], str1, str2, ...
         str3, str4);

  %====================================================================
         
function [theta0] = plotTangChiRc45_0001

  E = 213.0e9;
  fig00 = figure;

  sigemin = 0.0;
  sigemax = 1.0;
  nsige = 100;
  dsige = (sigemax-sigemin)/nsige;
  for i=1:nsige+1 
    sigefit(i) = sigemin + (i-1)*dsige;
  end

  %
  % Plot experimental data for 4340 steel Rc 45 (Chi et al)
  % (data in the form of shear stress vs shear strain)
  % (quasistatic)
  %
  epdot = 0.0001;
  T = 173.0;
  Rc = 45.0;
  load ThetaSigeEp0001173KRc45.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp0001173KRc45);

  theta = theta*1.0e-6;
  ptangiso1 = plot(Fx, theta, 'r-o'); hold on;
  set(ptangiso1, 'LineWidth', 3);
  str1 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'r--');
  %set(plfit, 'LineWidth', 2);
  %theta0(1,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(1,:) = [-tt1 tt1 epdot T Rc];

  epdot = 0.0001;
  T = 298.0;
  Rc = 45.0;
  load ThetaSigeEp0001298KRc45.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp0001298KRc45);

  theta = theta*1.0e-6;
  ptangiso2 = plot(Fx, theta, 'g-x'); hold on;
  set(ptangiso2, 'LineWidth', 3);
  str2 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'g--');
  %set(plfit, 'LineWidth', 2);
  %theta0(2,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(2,:) = [-tt1 tt1 epdot T Rc];
  
  epdot = 0.0001;
  T = 373.0;
  Rc = 45.0;
  load ThetaSigeEp0001373KRc45.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp0001373KRc45);

  theta = theta*1.0e-6;
  ptangiso3 = plot(Fx, theta, 'b-s'); hold on;
  set(ptangiso3, 'LineWidth', 3);
  str3 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'b--');
  %set(plfit, 'LineWidth', 2);
  %theta0(3,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(3,:) = [-tt1 tt1 epdot T Rc];
  
  %set(gca, 'XLim', [0 1], 'YLim', [0 15000] );
  set(gca, 'XLim', [0 1]);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha) ', ...
         'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 45 0.0001/s', 'FontName', 'bookman', 'FontSize', 16);
  axis square;
  legend([ptangiso1 ptangiso2 ptangiso3], str1, str2, str3);

  %====================================================================

function [theta0] = plotTangChiRc45_1000

  fig00 = figure;
  E = 213.0e9;

  sigemin = 0.0;
  sigemax = 1.0;
  nsige = 100;
  dsige = (sigemax-sigemin)/nsige;
  for i=1:nsige+1 
    sigefit(i) = sigemin + (i-1)*dsige;
  end

  %
  % Plot experimental data for 4340 steel Rc 45 (Chi et al)
  % (data in the form of shear stress vs shear strain)
  % (dynamic)
  %
  epdot = 1000.0;
  T = 173.0;
  Rc = 45.0;
  load ThetaSigeEp1000173KRc45.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp1000173KRc45);

  theta = theta*1.0e-6;
  ptangiso1 = plot(Fx, theta, 'r-o'); hold on;
  set(ptangiso1, 'LineWidth', 3);
  str1 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'r--');
  %set(plfit, 'LineWidth', 2);
  %theta0(1,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(1,:) = [-tt1 tt1 epdot T Rc];
  
  epdot = 1000.0;
  T = 298.0;
  Rc = 45.0;
  load ThetaSigeEp1000298KRc45.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp1000298KRc45);

  theta = theta*1.0e-6;
  ptangiso2 = plot(Fx, theta, 'g-x'); hold on;
  set(ptangiso2, 'LineWidth', 3);
  str2 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'g--');
  %set(plfit, 'LineWidth', 2);
  %theta0(2,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(2,:) = [-tt1 tt1 epdot T Rc];
  
  epdot = 1000.0;
  T = 373.0;
  Rc = 45.0;
  load ThetaSigeEp1000373KRc45.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp1000373KRc45);

  theta = theta*1.0e-6;
  ptangiso3 = plot(Fx, theta, 'b-s'); hold on;
  set(ptangiso3, 'LineWidth', 3);
  str3 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'b--');
  %set(plfit, 'LineWidth', 2);
  %theta0(3,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(3,:) = [-tt1 tt1 epdot T Rc];
  
  %set(gca, 'XLim', [0 1], 'YLim', [0 20000] );
  set(gca, 'XLim', [0 1]);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha) ', ...
         'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 45 1000/s', 'FontName', 'bookman', 'FontSize', 16);
  axis square;
  legend([ptangiso1 ptangiso2 ptangiso3], str1, str2, str3);

  %====================================================================

function [theta0] = plotTangChiRc49_0001

  fig00 = figure;

  E = 213.0e9;

  sigemin = 0.0;
  sigemax = 1.0;
  nsige = 100;
  dsige = (sigemax-sigemin)/nsige;
  for i=1:nsige+1 
    sigefit(i) = sigemin + (i-1)*dsige;
  end

  %
  % Plot experimental data for 4340 steel Rc 49 (Rc49 et al)
  % (data in the form of shear stress vs shear strain)
  % (quasistatic)
  %
  epdot = 0.0001;
  T = 173.0;
  Rc = 49.0;
  load ThetaSigeEp0001173KRc49.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp0001173KRc49);

  theta = theta*1.0e-6;
  ptangiso1 = plot(Fx, theta, 'r-o'); hold on;
  set(ptangiso1, 'LineWidth', 3);
  str1 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'r--');
  %set(plfit, 'LineWidth', 2);
  %theta0(1,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(1,:) = [-tt1 tt1 epdot T Rc];

  epdot = 0.0001;
  T = 298.0;
  Rc = 49.0;
  load ThetaSigeEp0001298KRc49.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp0001298KRc49);

  theta = theta*1.0e-6;
  ptangiso2 = plot(Fx, theta, 'g-x'); hold on;
  set(ptangiso2, 'LineWidth', 3);
  str2 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'g--');
  %set(plfit, 'LineWidth', 2);
  %theta0(2,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(2,:) = [-tt1 tt1 epdot T Rc];
  
  epdot = 0.0001;
  T = 373.0;
  Rc = 49.0;
  load ThetaSigeEp0001373KRc49.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp0001373KRc49);

  theta = theta*1.0e-6;
  ptangiso3 = plot(Fx, theta, 'b-s'); hold on;
  set(ptangiso3, 'LineWidth', 3);
  str3 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'b--');
  %set(plfit, 'LineWidth', 2);
  %theta0(3,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(3,:) = [-tt1 tt1 epdot T Rc];
  
  %set(gca, 'XLim', [0 1], 'YLim', [0 30000] );
  set(gca, 'XLim', [0 1]);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha) ', ...
         'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 49', 'FontName', 'bookman', 'FontSize', 16);
  axis square;
  legend([ptangiso1 ptangiso2 ptangiso3], str1, str2, str3);

function [theta0] = plotTangChiRc49_1000

  fig00 = figure;

  E = 213.0e9;

  sigemin = 0.0;
  sigemax = 1.0;
  nsige = 100;
  dsige = (sigemax-sigemin)/nsige;
  for i=1:nsige+1 
    sigefit(i) = sigemin + (i-1)*dsige;
  end

  %
  % Plot experimental data for 4340 steel Rc 49 (Rc49 et al)
  % (data in the form of shear stress vs shear strain)
  % (dynamic)
  %
  epdot = 1000.0;
  T = 173.0;
  Rc = 49.0;
  load ThetaSigeEp1000173KRc49.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp1000173KRc49);

  theta = theta*1.0e-6;
  ptangiso1 = plot(Fx, theta, 'r-o'); hold on;
  set(ptangiso1, 'LineWidth', 3);
  str1 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'r--');
  %set(plfit, 'LineWidth', 2);
  %theta0(1,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(1,:) = [-tt1 tt1 epdot T Rc];
  
  epdot = 1000.0;
  T = 298.0;
  Rc = 49.0;
  load ThetaSigeEp1000298KRc49.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp1000298KRc49);

  theta = theta*1.0e-6;
  ptangiso2 = plot(Fx, theta, 'g-x'); hold on;
  set(ptangiso2, 'LineWidth', 3);
  str2 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'g--');
  %set(plfit, 'LineWidth', 2);
  %theta0(2,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(2,:) = [-tt1 tt1 epdot T Rc];
  
  epdot = 1000.0;
  T = 373.0;
  Rc = 49.0;
  load ThetaSigeEp1000373KRc49.dat
  [Fx, theta] = calcFx(Rc, epdot, ThetaSigeEp1000373KRc49);

  theta = theta*1.0e-6;
  ptangiso3 = plot(Fx, theta, 'b-s'); hold on;
  set(ptangiso3, 'LineWidth', 3);
  str3 = sprintf('%0.4g K, %0.5g /s', T, epdot); 

  %pfit = polyfit(Fx, theta, 1); 
  %thetafit = polyval(pfit, sigefit);
  %plfit = plot(sigefit, thetafit, 'b--');
  %set(plfit, 'LineWidth', 2);
  %theta0(3,:) = [pfit(1) pfit(2) epdot T Rc];

  %tt1 = 0.5*(theta(1)+theta(2));
  tt1 = theta(1);
  theta0(3,:) = [-tt1 tt1 epdot T Rc];
  
  %set(gca, 'XLim', [0 1], 'YLim', [0 30000] );
  set(gca, 'XLim', [0 1]);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
  xlabel('tanh(\alpha \sigma_e/\sigma_{es})/tanh(\alpha) ', ...
         'FontName', 'bookman', 'FontSize', 16);
  ylabel('\theta (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  title('4340 Steel Rc 49', 'FontName', 'bookman', 'FontSize', 16);
  axis square;
  legend([ptangiso1 ptangiso2 ptangiso3], str1, str2, str3);

  %====================================================================

function [p] = calcP(rho, rho0, T, T0)

  % Data from Brown and Gust 79
  eta = rho/rho0;
  C0 = 3935.0;
  S_alpha = 1.578;
  Gamma0 = 1.69;

  Cv = calcCp(T);
  zeta = rho/rho0 - 1;
  E = Cv*(T-T0)*rho0;

  if (rho == rho0)
    p = Gamma0*E;
  else
    numer = rho0*C0^2*(1/zeta + 1 - 0.5*Gamma0);
    denom = 1/zeta + 1 - S_alpha;
    p = numer/denom^2 + Gamma0*E;
  end

function [Cp] = calcCp(T)

  Tc = 1040.0;
  if (T == Tc)
    T = T - 1.0;
  end
  if (T < Tc) 
    t = 1 - T/Tc;
    A = 190.14;
    B = -273.75;
    C = 418.30;
    n = 0.2;
    Cp = A + B*t + C/t^n;
  else
    t = T/Tc - 1.0;
    A = 465.21;
    B = 267.52;
    C = 58.16;
    n = 0.35;
    Cp = A + B*t + C/t^n;
  end

function [Tm] = calcTm(rho, rho0)

  %
  % Constants and derivative from Guinan and Steinberg, 1974
  %
  B0 = 1.66e11; 
  dB_dp0 = 5.29;
  G0 = 0.819e11;
  dG_dp0 = 1.8;

  %
  % Calculate the pressure 
  %
  eta = rho/rho0;
  p = calcP(rho, rho0, 300, 300);

  %
  % BPS parameters for Fe at T = 300K and p = 0
  %
  kappa = 1;  %Screw dislocation
  z = 8.0; % bcc lattice
  b2rhoTm = 0.64;
  b2rhoTm = b2rhoTm+0.14;
  alpha = 2.9;
  lambda = 1.30; % bcc lattice
  a = 5.4057*0.53e-10;
  vws = a^3/2; % bcc crystal
  kbTm = (kappa*lambda*vws*G0)/(8.0*pi*log(z-1.0))*log(alpha^2/(4.0*b2rhoTm));
  kb = 1.3806503e-23;
  Tm0 = kbTm/kb; 

  %
  % Calculate the bulk and shear factors
  %
  Bfac = 1.0 + dB_dp0/B0*p;
  Gfac = dG_dp0/G0*p;

  eta = Bfac^(1/dB_dp0);
  %
  % Calculate Tm at pressure p
  %
  Tm = Tm0/eta*(1.0 + Gfac/eta^(1/3));

function [mu] = calcmu(rho, rho0, Tm, P, T)

  mu0 = 90.0e9;
  zeta = 0.04;
  dmu_dp = 1.8;
  dmu_dp_mu0 = dmu_dp/mu0;
  C = 0.080;
  m = 55.947;
  k = 1.38e4/1.6605402;

  That = T/Tm;
  if (That < 1+zeta)
    denom = zeta*(1 - That/(1+zeta));
    t0 = 1 - That;
    J = 1 + exp(-t0/denom);
    eta = (rho/rho0)^(1/3);
    t1 = mu0*(1 + dmu_dp_mu0*P/eta);
    t2 = rho*k*T/(C*m);
    mu = (t0*t1 + t2)/J;
  else
    mu = 0;
  end

%====================================================================
function [Fx, theta] = calcFx(Rc, epdot, dat)

  theta   = dat(:,1);
  sigma_e = dat(:,2);
  sigma_e = sigma_e - sigma_e(1);
  T       = dat(:,6);
  mu      = dat(:,5);
  [n,m] = size(dat);
  for i=1:n
    sigma_es(i,1) = calcSigma_es(Rc, epdot, T(i), mu(i));
  end
  X = sigma_e./sigma_es;
  alpha = 3.0;
  talpha = tanh(alpha);
  Fx = tanh(alpha*X)/talpha;

%====================================================================
function [sigma_es] = calcSigma_es(Rc, epdot, T, mu)

  %
  % Multiple temperature fit (true sig-eps)
  %
%  if (T > 1040)
%    g_0es = 0.20093;
%    sigma_es0 = 1.9473e3;
%  else
%    if (Rc == 30)
%      g_0es = 0.31659;
%      sigma_es0 = 6.8658e2;
%    elseif (Rc == 38)
%      g_0es = 0.2725;
%      sigma_es0 = 1.6926e3;
%    elseif (Rc == 45)
%      g_0es = 0.076556;
%      sigma_es0 = 1.6959e3;
%    elseif (Rc == 49)
%      g_0es = 0.62284;
%      sigma_es0 = 1.1429e3;
%    else
%      g_0es = 0.3409;
%      sigma_es0 = 488.67;
%      %g_0es = 8.6627e-04*Rc^3 - 9.9388e-02*Rc^2 + 3.7348*Rc - 45.667;
%      %sigma_es0 = -0.22428*Rc^3 + 16.992*Rc^2 - 248.32*Rc - 1101;
%    end
%  end
%  sigma_es0 = sigma_es0*1.0e6;

  %
  % Multiple temperature fit (sig-eps) - shifted
  %
%  if (T > 1040)
%    g_0es = 0.40382;
%    sigma_es0 = 377.62;
%  else
%    if (Rc == 30)
%      g_0es = 0.097526;
%      sigma_es0 = 1147.9;
%    elseif (Rc == 38)
%      g_0es = 0.16867;
%      sigma_es0 = 1118.0;
%    elseif (Rc == 45)
%      g_0es = 0.19275;
%      sigma_es0 = 186.76;
%    elseif (Rc == 49)
%      g_0es = 0.74925;
%      sigma_es0 = 283.44;
%    else
%      g_0es = 0.18071;
%      sigma_es0 = 684.04;
%      %g_0es = 6.6837e-04*Rc^3 - 7.5889e-02*Rc^2 + 2.8408*Rc - 34.871;
%      %sigma_es0 = 1.2059*Rc^3 - 144.88*Rc^2 + 5647.0*Rc - 70427;
%    end
%  end
%  sigma_es0 = sigma_es0*1.0e6;

  %
  % Multiple temperature fit (sig-eps) - raw ( T = T0)
  %
%  if (T > 1040)
%    g_0es = 0.2932;
%    sigma_es0 = 472.21;
%  else
%    if (Rc == 30)
%      g_0es = 0.085327;
%      sigma_es0 = 1319.1;
%    elseif (Rc == 38)
%      g_0es = 0.27407;
%      sigma_es0 = 986.54;
%    elseif (Rc == 45)
%      g_0es = 0.34685;
%      sigma_es0 = 171.76;
%    elseif (Rc == 49)
%      g_0es = 0.95904;
%      sigma_es0 = 275.98;
%    else
%      g_0es = 0.31046;
%      sigma_es0 = 688.35;
%      %g_0es = 3.1816e-03*Rc^2 - 0.21168*Rc + 3.6044;
%      %sigma_es0 = -63.15*Rc + 3245.9;
%    end
%  end
%  sigma_es0 = sigma_es0*1.0e6;

  %
  % Multiple temperature fit (sig-eps) - raw (T = Tmax)
  %
  if (T > 1040)
    g_0es = 0.294;
    sigma_es0 = 478.36;
  else
    if (Rc == 30)
      g_0es = 0.088;
      sigma_es0 = 1316.1;
    elseif (Rc == 38)
      g_0es = 0.232;
      sigma_es0 = 1058.4;
    elseif (Rc == 45)
      g_0es = 0.336;
      sigma_es0 = 173.5;
    elseif (Rc == 49)
      g_0es = 1.245;
      sigma_es0 = 274.9;
    else
      g_0es = 0.284;
      sigma_es0 = 705.5;
      %g_0es = 0.016559*Rc - 0.40501;
      %sigma_es0 = -63.899*Rc + 3293.4;
    end
  end
  sigma_es0 = sigma_es0*1.0e6;

  %
  % Multiple temperature fit (sig-eps) - raw (T = Tmax) - mod sig-eps data
  %
%  if (T > 1040)
%    g_0es = 0.16211;
%    sigma_es0 = 926.3;
%  else
%    if (Rc == 30)
%      g_0es = 0.088272;
%      sigma_es0 = 1316.1;
%    elseif (Rc == 38)
%      g_0es = 0.16211;
%      sigma_es0 = 926.3;
%    elseif (Rc == 45)
%      g_0es = 0.083828;
%      sigma_es0 = 313.59;
%    elseif (Rc == 49)
%      g_0es = 0.10455;
%      sigma_es0 = 382.14;
%    else
%      g_0es = 0.096411;
%      %sigma_es0 = 734.53;
%      sigma_es0 = -54.906*Rc + 2958.2;
%    end
%  end
%  sigma_es0 = sigma_es0*1.0e6;

  %
  % Compute sigma_es
  %
  edot_0es = 1.0e7;
  kappa = 1.38e-23;
  b = 2.48e-10;
  sigma_es = sigma_es0*(epdot/edot_0es)^(kappa*T/(mu*b^3*g_0es)); 

  if (sigma_es < 0)
    sses = [sigma_es sigma_es0 g_0es]
  end
