function alPlots

  %
  % The data are organized as
  %
  % 1    2    3    4      5    6    7    8     9  10  11
  % Cp   rho  T    U      L    Lf   Xf   lenf  D  Df  Wf
  % A    Af   V    Vf     Cxf  Cyf  M    Mom   KE IE  TE
  % L/D  Lf/L Xf/L lenf/L Df/D Wf/D Af/A Vf/V
  %
  load AlGust.dat
  load AlHouse.dat
  load AlWilkins.dat

  plotLD_U(AlGust, AlHouse, AlWilkins);
  plotLfL0_U(AlGust, AlHouse, AlWilkins);
  plotLfL0_KE(AlGust, AlHouse, AlWilkins);
  plotLfL0_TE(AlGust, AlHouse, AlWilkins);
  plotXfL0_TE(AlGust, AlHouse, AlWilkins);
  plotDfD0_TE(AlGust, AlHouse, AlWilkins);
  plotWfD0_TE(AlGust, AlHouse, AlWilkins);
  plotLenfL0_TE(AlGust, AlHouse, AlWilkins);
  plotAfA0_TE(AlGust, AlHouse, AlWilkins);
  plotVfV0_TE(AlGust, AlHouse, AlWilkins);

%
%  Plot of L/D vs U
%
function plotLD_U(Gust, House, Wilkins)

  [n, m] = size(Gust);
  for i=1:n/3
    U_Gust(i) = Gust(3*i-2,4);
    L_D_Gust(i) = Gust(3*i,1);
  end
  [n, m] = size(House);
  for i=1:n/3
    U_House(i) = House(3*i-2,4);
    L_D_House(i) = House(3*i,1);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    U_Wilkins(i) = Wilkins(3*i-2,4);
    L_D_Wilkins(i) = Wilkins(3*i,1);
  end
  fig1 = figure;
  p2 = plot(U_Gust, L_D_Gust,'gs','MarkerFaceColor','g'); hold on;
  p3 = plot(U_House, L_D_House,'bd','MarkerFaceColor','b');
  p5 = plot(U_Wilkins, L_D_Wilkins,'k^','MarkerFaceColor','k');
  set([p2 p3 p5],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('U (m/s)','FontSize',16);
  ylabel('L/D','FontSize',16);
  legend([p5 p2 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'House et al. (1995)');
  title('Aluminum','FontSize',16);
  print -depsc Al_U_vs_L_D.eps

%
%  Plot of Lf/L0 vs U
%
function plotLfL0_U(Gust, House, Wilkins)

  [n, m] = size(Gust);
  for i=1:n/3
    U_Gust(i) = Gust(3*i-2,4);
    Lf_L0_Gust(i) = Gust(3*i,2);
  end
  [n, m] = size(House);
  for i=1:n/3
    U_House(i) = House(3*i-2,4);
    Lf_L0_House(i) = House(3*i,2);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    U_Wilkins(i) = Wilkins(3*i-2,4);
    Lf_L0_Wilkins(i) = Wilkins(3*i,2);
  end
  fig1 = figure;
  p2 = plot(U_Gust, Lf_L0_Gust,'gs','MarkerFaceColor','g'); hold on;
  p3 = plot(U_House, Lf_L0_House,'bd','MarkerFaceColor','b');
  p5 = plot(U_Wilkins, Lf_L0_Wilkins,'k^','MarkerFaceColor','k');
  set([p2 p3 p5],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('U (m/s)','FontSize',16);
  ylabel('L_f/L_0','FontSize',16);
  legend([p5 p2 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'House et al. (1995)');
  title('Aluminum','FontSize',16);
  print -depsc Al_U_vs_Lf_L0.eps

%
%  Plot of Lf/L0 vs KE
%
function plotLfL0_KE(Gust, House, Wilkins)

  [n, m] = size(Gust);
  for i=1:n/3
    KE_Gust(i) = Gust(3*i-1,9)/Gust(3*i-1,7);
    Lf_L0_Gust(i) = Gust(3*i,2);
  end
  [n, m] = size(House);
  for i=1:n/3
    KE_House(i) = House(3*i-1,9)/House(3*i-1,7);
    Lf_L0_House(i) = House(3*i,2);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    KE_Wilkins(i) = Wilkins(3*i-1,9)/Wilkins(3*i-1,7);
    Lf_L0_Wilkins(i) = Wilkins(3*i,2);
  end
  fig1 = figure;
  p2 = plot(KE_Gust, Lf_L0_Gust,'gs','MarkerFaceColor','g'); hold on;
  p3 = plot(KE_House, Lf_L0_House,'bd','MarkerFaceColor','b');
  p5 = plot(KE_Wilkins, Lf_L0_Wilkins,'k^','MarkerFaceColor','k');
  set([p2 p3 p5],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('1/2 \rho_0 U_0^2 ','FontSize',16);
  ylabel('L_f/L_0','FontSize',16);
  legend([p5 p2 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'House et al. (1995)');
  title('Aluminum','FontSize',16);
  print -depsc Al_KE_vs_Lf_L0.eps

%
%  Plot of Lf/L0 vs TE
%
function plotLfL0_TE(Gust, House, Wilkins)

  [n, m] = size(Gust);
  for i=1:n/3
    KE_Gust(i) = Gust(3*i-1,11)/Gust(3*i-1,7);
    Lf_L0_Gust(i) = Gust(3*i,2);
  end
  [n, m] = size(House);
  for i=1:n/3
    KE_House(i) = House(3*i-1,11)/House(3*i-1,7);
    Lf_L0_House(i) = House(3*i,2);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    KE_Wilkins(i) = Wilkins(3*i-1,11)/Wilkins(3*i-1,7);
    Lf_L0_Wilkins(i) = Wilkins(3*i,2);
  end
  fig1 = figure;
  p2 = plot(KE_Gust, Lf_L0_Gust,'gs','MarkerFaceColor','g'); hold on;
  p3 = plot(KE_House, Lf_L0_House,'bd','MarkerFaceColor','b');
  p5 = plot(KE_Wilkins, Lf_L0_Wilkins,'k^','MarkerFaceColor','k');
  set([p2 p3 p5],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('1/2 \rho_0 U_0^2 + \rho_0 C_p (T-295)','FontSize',16);
  ylabel('L_f/L_0','FontSize',16);
  legend([p5 p2 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'House et al. (1995)');
  title('Aluminum','FontSize',16);
  print -depsc Al_TE_vs_Lf_L0.eps

%
%  Plot of Xf/L0 vs TE
%
function plotXfL0_TE(Gust, House, Wilkins)

  [n, m] = size(Gust);
  for i=1:n/3
    KE_Gust(i) = Gust(3*i-1,11)/Gust(3*i-1,7);
    Xf_L0_Gust(i) = Gust(3*i,3);
  end
  [n, m] = size(House);
  for i=1:n/3
    KE_House(i) = House(3*i-1,11)/House(3*i-1,7);
    Xf_L0_House(i) = House(3*i,3);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    KE_Wilkins(i) = Wilkins(3*i-1,11)/Wilkins(3*i-1,7);
    Xf_L0_Wilkins(i) = Wilkins(3*i,3);
  end
  fig1 = figure;
  p2 = plot(KE_Gust, Xf_L0_Gust,'gs','MarkerFaceColor','g'); hold on;
  p3 = plot(KE_House, Xf_L0_House,'bd','MarkerFaceColor','b');
  p5 = plot(KE_Wilkins, Xf_L0_Wilkins,'k^','MarkerFaceColor','k');
  set([p2 p3 p5],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('1/2 \rho_0 U_0^2 + \rho_0 C_p (T-295)','FontSize',16);
  ylabel('X_f/L_0','FontSize',16);
  legend([p5 p2 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'House et al. (1995)');
  title('Aluminum','FontSize',16);
  print -depsc Al_TE_vs_Xf_L0.eps
  set(gca,'YLim',[0 1.0]);

%
%  Plot of Df/D0 vs TE
%
function plotDfD0_TE(Gust, House, Wilkins)

  [n, m] = size(Gust);
  for i=1:n/3
    KE_Gust(i) = Gust(3*i-1,11)/Gust(3*i-1,7);
    Df_D0_Gust(i) = Gust(3*i,5);
  end
  [n, m] = size(House);
  for i=1:n/3
    KE_House(i) = House(3*i-1,11)/House(3*i-1,7);
    Df_D0_House(i) = House(3*i,5);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    KE_Wilkins(i) = Wilkins(3*i-1,11)/Wilkins(3*i-1,7);
    Df_D0_Wilkins(i) = Wilkins(3*i,5);
  end
  fig1 = figure;
  p2 = plot(KE_Gust, Df_D0_Gust,'gs','MarkerFaceColor','g'); hold on;
  p3 = plot(KE_House, Df_D0_House,'bd','MarkerFaceColor','b');
  p5 = plot(KE_Wilkins, Df_D0_Wilkins,'k^','MarkerFaceColor','k');
  set([p2 p3 p5],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('1/2 \rho_0 U_0^2 + \rho_0 C_p (T-295)','FontSize',16);
  ylabel('D_f/D_0','FontSize',16);
  legend([p5 p2 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'House et al. (1995)');
  title('Aluminum','FontSize',16);
  set(gca,'YLim',[0 2.6]);
  print -depsc Al_TE_vs_Df_D0.eps

function plotWfD0_TE(Gust, House, Wilkins)

  [n, m] = size(Gust);
  for i=1:n/3
    KE_Gust(i) = Gust(3*i-1,11)/Gust(3*i-1,7);
    Wf_D0_Gust(i) = Gust(3*i,6);
  end
  [n, m] = size(House);
  for i=1:n/3
    KE_House(i) = House(3*i-1,11)/House(3*i-1,7);
    Wf_D0_House(i) = House(3*i,6);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    KE_Wilkins(i) = Wilkins(3*i-1,11)/Wilkins(3*i-1,7);
    Wf_D0_Wilkins(i) = Wilkins(3*i,6);
  end
  fig1 = figure;
  p2 = plot(KE_Gust, Wf_D0_Gust,'gs','MarkerFaceColor','g'); hold on;
  p3 = plot(KE_House, Wf_D0_House,'bd','MarkerFaceColor','b');
  p5 = plot(KE_Wilkins, Wf_D0_Wilkins,'k^','MarkerFaceColor','k');
  set([p2 p3 p5],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('1/2 \rho_0 U_0^2 + \rho_0 C_p (T-295)','FontSize',16);
  ylabel('W_f/D_0','FontSize',16);
  legend([p5 p2 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'House et al. (1995)');
  title('Aluminum','FontSize',16);
  set(gca,'YLim',[0 2.6]);
  print -depsc Al_TE_vs_Wf_D0.eps

%
%  Plot of Lenf/L0 vs TE
%
function plotLenfL0_TE(Gust, House, Wilkins)

  [n, m] = size(Gust);
  for i=1:n/3
    KE_Gust(i) = Gust(3*i-1,11)/Gust(3*i-1,7);
    Lenf_L0_Gust(i) = Gust(3*i,4);
  end
  [n, m] = size(House);
  for i=1:n/3
    KE_House(i) = House(3*i-1,11)/House(3*i-1,7);
    Lenf_L0_House(i) = House(3*i,4);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    KE_Wilkins(i) = Wilkins(3*i-1,11)/Wilkins(3*i-1,7);
    Lenf_L0_Wilkins(i) = Wilkins(3*i,4);
  end
  fig1 = figure;
  p2 = plot(KE_Gust, Lenf_L0_Gust,'gs','MarkerFaceColor','g'); hold on;
  p3 = plot(KE_House, Lenf_L0_House,'bd','MarkerFaceColor','b');
  p5 = plot(KE_Wilkins, Lenf_L0_Wilkins,'k^','MarkerFaceColor','k');
  set([p2 p3 p5],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('1/2 \rho_0 U_0^2 + \rho_0 C_p (T-295)','FontSize',16);
  ylabel('Len_f/L_0','FontSize',16);
  legend([p5 p2 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'House et al. (1995)');
  title('Aluminum','FontSize',16);
  set(gca,'YLim',[0 1.0]);
  print -depsc Al_TE_vs_Lenf_L0.eps

function plotAfA0_TE(Gust, House, Wilkins)

  [n, m] = size(Gust);
  for i=1:n/3
    KE_Gust(i) = Gust(3*i-1,11)/Gust(3*i-1,7);
    Af_A0_Gust(i) = Gust(3*i,7);
  end
  [n, m] = size(House);
  for i=1:n/3
    KE_House(i) = House(3*i-1,11)/House(3*i-1,7);
    Af_A0_House(i) = House(3*i,7);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    KE_Wilkins(i) = Wilkins(3*i-1,11)/Wilkins(3*i-1,7);
    Af_A0_Wilkins(i) = Wilkins(3*i,7);
  end
  fig1 = figure;
  p2 = plot(KE_Gust, Af_A0_Gust,'gs','MarkerFaceColor','g'); hold on;
  p3 = plot(KE_House, Af_A0_House,'bd','MarkerFaceColor','b');
  p5 = plot(KE_Wilkins, Af_A0_Wilkins,'k^','MarkerFaceColor','k');
  set([p2 p3 p5],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('1/2 \rho_0 U_0^2 + \rho_0 C_p (T-295)','FontSize',16);
  ylabel('A_f/A_0','FontSize',16);
  legend([p5 p2 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'House et al. (1995)');
  title('Aluminum','FontSize',16);
  set(gca,'YLim',[0 2.6]);
  print -depsc Al_TE_vs_Af_A0.eps

function plotVfV0_TE(Gust, House, Wilkins)

  [n, m] = size(Gust);
  for i=1:n/3
    KE_Gust(i) = Gust(3*i-1,11)/Gust(3*i-1,7);
    Vf_V0_Gust(i) = Gust(3*i,8);
  end
  [n, m] = size(House);
  for i=1:n/3
    KE_House(i) = House(3*i-1,11)/House(3*i-1,7);
    Vf_V0_House(i) = House(3*i,8);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    KE_Wilkins(i) = Wilkins(3*i-1,11)/Wilkins(3*i-1,7);
    Vf_V0_Wilkins(i) = Wilkins(3*i,8);
  end
  fig1 = figure;
  p2 = plot(KE_Gust, Vf_V0_Gust,'gs','MarkerFaceColor','g'); hold on;
  p3 = plot(KE_House, Vf_V0_House,'bd','MarkerFaceColor','b');
  p5 = plot(KE_Wilkins, Vf_V0_Wilkins,'k^','MarkerFaceColor','k');
  set([p2 p3 p5],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('1/2 \rho_0 U_0^2 + \rho_0 C_p (T-295)','FontSize',16);
  ylabel('V_f/V_0','FontSize',16);
  legend([p5 p2 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'House et al. (1995)');
  title('Aluminum','FontSize',16);
  set(gca,'YLim',[0 2.6]);
  print -depsc Al_TE_vs_Vf_V0.eps

