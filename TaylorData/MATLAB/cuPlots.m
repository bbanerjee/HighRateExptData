function cuPlots

  %
  % The data are organized as
  %
  % 1    2    3    4      5    6    7    8     9  10  11
  % Cp   rho  T    U      L    Lf   Xf   lenf  D  Df  Wf
  % A    Af   V    Vf     Cxf  Cyf  M    Mom   KE IE  TE
  % L/D  Lf/L Xf/L lenf/L Df/D Wf/D Af/A Vf/V
  %
  load CuETPGust.dat
  load CuGust.dat
  load CuHouse.dat
  load CuJones.dat
  load CuWilkins.dat
  load CuZerilli.dat

  plotLD_U(CuETPGust, CuGust, CuHouse, CuJones, CuWilkins, CuZerilli);
  plotLfL0_U(CuETPGust, CuGust, CuHouse, CuJones, CuWilkins, CuZerilli);
  plotLfL0_KE(CuETPGust, CuGust, CuHouse, CuJones, CuWilkins, CuZerilli);
  plotLfL0_TE(CuETPGust, CuGust, CuHouse, CuJones, CuWilkins, CuZerilli);
  plotXfL0_TE(CuETPGust, CuGust, CuHouse, CuJones, CuWilkins, CuZerilli);
  plotDfD0_TE(CuETPGust, CuGust, CuHouse, CuJones, CuWilkins, CuZerilli);
  plotWfD0_TE(CuETPGust, CuGust, CuHouse, CuJones, CuWilkins, CuZerilli);
  plotLenfL0_TE(CuETPGust, CuGust, CuHouse, CuJones, CuWilkins, CuZerilli);
  plotAfA0_TE(CuETPGust, CuGust, CuHouse, CuJones, CuWilkins, CuZerilli);
  plotVfV0_TE(CuETPGust, CuGust, CuHouse, CuJones, CuWilkins, CuZerilli);

%
%  Plot of L/D vs U
%
function plotLD_U(ETPGust, Gust, House, Jones, Wilkins, Zerilli)

  [n, m] = size(ETPGust);
  for i=1:n/3
    U_ETPGust(i) = ETPGust(3*i-2,4);
    L_D_ETPGust(i) = ETPGust(3*i,1);
  end
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
  [n, m] = size(Jones);
  for i=1:n/3
    U_Jones(i) = Jones(3*i-2,4);
    L_D_Jones(i) = Jones(3*i,1);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    U_Wilkins(i) = Wilkins(3*i-2,4);
    L_D_Wilkins(i) = Wilkins(3*i,1);
  end
  [n, m] = size(Zerilli);
  for i=1:n/3
    U_Zerilli(i) = Zerilli(3*i-2,4);
    L_D_Zerilli(i) = Zerilli(3*i,1);
  end
  fig1 = figure;
  p1 = plot(U_ETPGust, L_D_ETPGust,'ro','MarkerFaceColor','r'); hold on;
  p2 = plot(U_Gust, L_D_Gust,'gs','MarkerFaceColor','g');
  p3 = plot(U_House, L_D_House,'bd','MarkerFaceColor','b');
  p4 = plot(U_Jones, L_D_Jones,'mv','MarkerFaceColor','m');
  p5 = plot(U_Wilkins, L_D_Wilkins,'k^','MarkerFaceColor','k');
  p6 = plot(U_Zerilli, L_D_Zerilli,'kp','MarkerFaceColor','k');
  set(p6,'Color',[0.6 0.2 0.4],'MarkerFaceColor',[0.6 0.2 0.4]);
  set([p1 p2 p3 p4 p5 p6],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('U (m/s)','FontSize',16);
  ylabel('L/D','FontSize',16);
  legend([p5 p2 p1 p6 p4 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'Gust (ETP) (1982)',...
         'Johnson and Cook (1983)', 'Jones et al. (1987)', 'House et al. (1995)');
  title('Copper','FontSize',16);
  print -depsc Cu_U_vs_L_D.eps

%
%  Plot of Lf/L0 vs U
%
function plotLfL0_U(ETPGust, Gust, House, Jones, Wilkins, Zerilli)

  [n, m] = size(ETPGust);
  for i=1:n/3
    U_ETPGust(i) = ETPGust(3*i-2,4);
    Lf_L0_ETPGust(i) = ETPGust(3*i,2);
  end
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
  [n, m] = size(Jones);
  for i=1:n/3
    U_Jones(i) = Jones(3*i-2,4);
    Lf_L0_Jones(i) = Jones(3*i,2);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    U_Wilkins(i) = Wilkins(3*i-2,4);
    Lf_L0_Wilkins(i) = Wilkins(3*i,2);
  end
  [n, m] = size(Zerilli);
  for i=1:n/3
    U_Zerilli(i) = Zerilli(3*i-2,4);
    Lf_L0_Zerilli(i) = Zerilli(3*i,2);
  end
  fig1 = figure;
  p1 = plot(U_ETPGust, Lf_L0_ETPGust,'ro','MarkerFaceColor','r'); hold on;
  p2 = plot(U_Gust, Lf_L0_Gust,'gs','MarkerFaceColor','g');
  p3 = plot(U_House, Lf_L0_House,'bd','MarkerFaceColor','b');
  p4 = plot(U_Jones, Lf_L0_Jones,'mv','MarkerFaceColor','m');
  p5 = plot(U_Wilkins, Lf_L0_Wilkins,'k^','MarkerFaceColor','k');
  p6 = plot(U_Zerilli, Lf_L0_Zerilli,'kp','MarkerFaceColor','k');
  set(p6,'Color',[0.6 0.2 0.4],'MarkerFaceColor',[0.6 0.2 0.4]);
  set([p1 p2 p3 p4 p5 p6],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('U (m/s)','FontSize',16);
  ylabel('L_f/L_0','FontSize',16);
  legend([p5 p2 p1 p6 p4 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'Gust (ETP) (1982)',...
         'Johnson and Cook (1983)', 'Jones et al. (1987)', 'House et al. (1995)');
  title('Copper','FontSize',16);
  print -depsc Cu_U_vs_Lf_L0.eps

%
%  Plot of Lf/L0 vs KE
%
function plotLfL0_KE(ETPGust, Gust, House, Jones, Wilkins, Zerilli)

  [n, m] = size(ETPGust);
  for i=1:n/3
    KE_ETPGust(i) = ETPGust(3*i-1,9)/ETPGust(3*i-1,7);
    Lf_L0_ETPGust(i) = ETPGust(3*i,2);
  end
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
  [n, m] = size(Jones);
  for i=1:n/3
    KE_Jones(i) = Jones(3*i-1,9)/Jones(3*i-1,7);
    Lf_L0_Jones(i) = Jones(3*i,2);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    KE_Wilkins(i) = Wilkins(3*i-1,9)/Wilkins(3*i-1,7);
    Lf_L0_Wilkins(i) = Wilkins(3*i,2);
  end
  [n, m] = size(Zerilli);
  for i=1:n/3
    KE_Zerilli(i) = Zerilli(3*i-1,9)/Zerilli(3*i-1,7);
    Lf_L0_Zerilli(i) = Zerilli(3*i,2);
  end
  fig1 = figure;
  p1 = plot(KE_ETPGust, Lf_L0_ETPGust,'ro','MarkerFaceColor','r'); hold on;
  p2 = plot(KE_Gust, Lf_L0_Gust,'gs','MarkerFaceColor','g');
  p3 = plot(KE_House, Lf_L0_House,'bd','MarkerFaceColor','b');
  p4 = plot(KE_Jones, Lf_L0_Jones,'mv','MarkerFaceColor','m');
  p5 = plot(KE_Wilkins, Lf_L0_Wilkins,'k^','MarkerFaceColor','k');
  p6 = plot(KE_Zerilli, Lf_L0_Zerilli,'kp','MarkerFaceColor','k');
  set(p6,'Color',[0.6 0.2 0.4],'MarkerFaceColor',[0.6 0.2 0.4]);
  set([p1 p2 p3 p4 p5 p6],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('1/2 \rho_0 U_0^2 ','FontSize',16);
  ylabel('L_f/L_0','FontSize',16);
  legend([p5 p2 p1 p6 p4 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'Gust (ETP) (1982)',...
         'Johnson and Cook (1983)', 'Jones et al. (1987)', 'House et al. (1995)');
  title('Copper','FontSize',16);
  print -depsc Cu_KE_vs_Lf_L0.eps

%
%  Plot of Lf/L0 vs TE
%
function plotLfL0_TE(ETPGust, Gust, House, Jones, Wilkins, Zerilli)

  [n, m] = size(ETPGust);
  for i=1:n/3
    TE_ETPGust(i) = ETPGust(3*i-1,11)/ETPGust(3*i-1,7);
    Lf_L0_ETPGust(i) = ETPGust(3*i,2);
  end
  [n, m] = size(Gust);
  for i=1:n/3
    TE_Gust(i) = Gust(3*i-1,11)/Gust(3*i-1,7);
    Lf_L0_Gust(i) = Gust(3*i,2);
  end
  [n, m] = size(House);
  for i=1:n/3
    TE_House(i) = House(3*i-1,11)/House(3*i-1,7);
    Lf_L0_House(i) = House(3*i,2);
  end
  [n, m] = size(Jones);
  for i=1:n/3
    TE_Jones(i) = Jones(3*i-1,11)/Jones(3*i-1,7);
    Lf_L0_Jones(i) = Jones(3*i,2);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    TE_Wilkins(i) = Wilkins(3*i-1,11)/Wilkins(3*i-1,7);
    Lf_L0_Wilkins(i) = Wilkins(3*i,2);
  end
  [n, m] = size(Zerilli);
  for i=1:n/3
    TE_Zerilli(i) = Zerilli(3*i-1,11)/Zerilli(3*i-1,7);
    Lf_L0_Zerilli(i) = Zerilli(3*i,2);
  end
  fig1 = figure;
  p1 = plot(TE_ETPGust, Lf_L0_ETPGust,'ro','MarkerFaceColor','r'); hold on;
  p2 = plot(TE_Gust, Lf_L0_Gust,'gs','MarkerFaceColor','g');
  p3 = plot(TE_House, Lf_L0_House,'bd','MarkerFaceColor','b');
  p4 = plot(TE_Jones, Lf_L0_Jones,'mv','MarkerFaceColor','m');
  p5 = plot(TE_Wilkins, Lf_L0_Wilkins,'k^','MarkerFaceColor','k');
  p6 = plot(TE_Zerilli, Lf_L0_Zerilli,'kp','MarkerFaceColor','k');
  set(p6,'Color',[0.6 0.2 0.4],'MarkerFaceColor',[0.6 0.2 0.4]);
  set([p1 p2 p3 p4 p5 p6],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('1/2 \rho_0 U_0^2 + \rho_0 C_p (T-295)','FontSize',16);
  ylabel('L_f/L_0','FontSize',16);
  legend([p5 p2 p1 p6 p4 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'Gust (ETP) (1982)',...
         'Johnson and Cook (1983)', 'Jones et al. (1987)', 'House et al. (1995)');
  title('Copper','FontSize',16);
  print -depsc Cu_TE_vs_Lf_L0.eps

%
%  Plot of Xf/L0 vs TE
%
function plotXfL0_TE(ETPGust, Gust, House, Jones, Wilkins, Zerilli)

  [n, m] = size(ETPGust);
  for i=1:n/3
    TE_ETPGust(i) = ETPGust(3*i-1,11)/ETPGust(3*i-1,7);
    Xf_L0_ETPGust(i) = ETPGust(3*i,3);
  end
  [n, m] = size(Gust);
  for i=1:n/3
    TE_Gust(i) = Gust(3*i-1,11)/Gust(3*i-1,7);
    Xf_L0_Gust(i) = Gust(3*i,3);
  end
  [n, m] = size(House);
  for i=1:n/3
    TE_House(i) = House(3*i-1,11)/House(3*i-1,7);
    Xf_L0_House(i) = House(3*i,3);
  end
  [n, m] = size(Jones);
  for i=1:n/3
    TE_Jones(i) = Jones(3*i-1,11)/Jones(3*i-1,7);
    Xf_L0_Jones(i) = Jones(3*i,3);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    TE_Wilkins(i) = Wilkins(3*i-1,11)/Wilkins(3*i-1,7);
    Xf_L0_Wilkins(i) = Wilkins(3*i,3);
  end
  [n, m] = size(Zerilli);
  for i=1:n/3
    TE_Zerilli(i) = Zerilli(3*i-1,11)/Zerilli(3*i-1,7);
    Xf_L0_Zerilli(i) = Zerilli(3*i,3);
  end
  fig1 = figure;
  p1 = plot(TE_ETPGust, Xf_L0_ETPGust,'ro','MarkerFaceColor','r'); hold on;
  p2 = plot(TE_Gust, Xf_L0_Gust,'gs','MarkerFaceColor','g');
  p3 = plot(TE_House, Xf_L0_House,'bd','MarkerFaceColor','b');
  p4 = plot(TE_Jones, Xf_L0_Jones,'mv','MarkerFaceColor','m');
  p5 = plot(TE_Wilkins, Xf_L0_Wilkins,'k^','MarkerFaceColor','k');
  p6 = plot(TE_Zerilli, Xf_L0_Zerilli,'kp','MarkerFaceColor','k');
  set(p6,'Color',[0.6 0.2 0.4],'MarkerFaceColor',[0.6 0.2 0.4]);
  set([p1 p2 p3 p4 p5 p6],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('1/2 \rho_0 U_0^2 + \rho_0 C_p (T-295)','FontSize',16);
  ylabel('X_f/L_0','FontSize',16);
  legend([p5 p2 p1 p6 p4 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'Gust (ETP) (1982)',...
         'Johnson and Cook (1983)', 'Jones et al. (1987)', 'House et al. (1995)');
  title('Copper','FontSize',16);
  set(gca,'YLim',[0 1.0]);
  print -depsc Cu_TE_vs_Xf_L0.eps

%
%  Plot of Df/D0 vs TE
%
function plotDfD0_TE(ETPGust, Gust, House, Jones, Wilkins, Zerilli)

  [n, m] = size(ETPGust);
  for i=1:n/3
    TE_ETPGust(i) = ETPGust(3*i-1,11)/ETPGust(3*i-1,7);
    Df_D0_ETPGust(i) = ETPGust(3*i,5);
  end
  [n, m] = size(Gust);
  for i=1:n/3
    TE_Gust(i) = Gust(3*i-1,11)/Gust(3*i-1,7);
    Df_D0_Gust(i) = Gust(3*i,5);
  end
  [n, m] = size(House);
  for i=1:n/3
    TE_House(i) = House(3*i-1,11)/House(3*i-1,7);
    Df_D0_House(i) = House(3*i,5);
  end
  [n, m] = size(Jones);
  for i=1:n/3
    TE_Jones(i) = Jones(3*i-1,11)/Jones(3*i-1,7);
    Df_D0_Jones(i) = Jones(3*i,5);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    TE_Wilkins(i) = Wilkins(3*i-1,11)/Wilkins(3*i-1,7);
    Df_D0_Wilkins(i) = Wilkins(3*i,5);
  end
  [n, m] = size(Zerilli);
  for i=1:n/3
    TE_Zerilli(i) = Zerilli(3*i-1,11)/Zerilli(3*i-1,7);
    Df_D0_Zerilli(i) = Zerilli(3*i,5);
  end
  fig1 = figure;
  p1 = plot(TE_ETPGust, Df_D0_ETPGust,'ro','MarkerFaceColor','r'); hold on;
  p2 = plot(TE_Gust, Df_D0_Gust,'gs','MarkerFaceColor','g');
  p3 = plot(TE_House, Df_D0_House,'bd','MarkerFaceColor','b');
  p4 = plot(TE_Jones, Df_D0_Jones,'mv','MarkerFaceColor','m');
  p5 = plot(TE_Wilkins, Df_D0_Wilkins,'k^','MarkerFaceColor','k');
  p6 = plot(TE_Zerilli, Df_D0_Zerilli,'kp','MarkerFaceColor','k');
  set(p6,'Color',[0.6 0.2 0.4],'MarkerFaceColor',[0.6 0.2 0.4]);
  set([p1 p2 p3 p4 p5 p6],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('1/2 \rho_0 U_0^2 + \rho_0 C_p (T-295)','FontSize',16);
  ylabel('D_f/D_0','FontSize',16);
  legend([p5 p2 p1 p6 p4 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'Gust (ETP) (1982)',...
         'Johnson and Cook (1983)', 'Jones et al. (1987)', 'House et al. (1995)');
  title('Copper','FontSize',16);
  set(gca,'YLim',[0 2.6]);
  print -depsc Cu_TE_vs_Df_D0.eps

function plotWfD0_TE(ETPGust, Gust, House, Jones, Wilkins, Zerilli)

  [n, m] = size(ETPGust);
  for i=1:n/3
    TE_ETPGust(i) = ETPGust(3*i-1,11)/ETPGust(3*i-1,7);
    Wf_D0_ETPGust(i) = ETPGust(3*i,6);
  end
  [n, m] = size(Gust);
  for i=1:n/3
    TE_Gust(i) = Gust(3*i-1,11)/Gust(3*i-1,7);
    Wf_D0_Gust(i) = Gust(3*i,6);
  end
  [n, m] = size(House);
  for i=1:n/3
    TE_House(i) = House(3*i-1,11)/House(3*i-1,7);
    Wf_D0_House(i) = House(3*i,6);
  end
  [n, m] = size(Jones);
  for i=1:n/3
    TE_Jones(i) = Jones(3*i-1,11)/Jones(3*i-1,7);
    Wf_D0_Jones(i) = Jones(3*i,6);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    TE_Wilkins(i) = Wilkins(3*i-1,11)/Wilkins(3*i-1,7);
    Wf_D0_Wilkins(i) = Wilkins(3*i,6);
  end
  [n, m] = size(Zerilli);
  for i=1:n/3
    TE_Zerilli(i) = Zerilli(3*i-1,11)/Zerilli(3*i-1,7);
    Wf_D0_Zerilli(i) = Zerilli(3*i,6);
  end
  fig1 = figure;
  p1 = plot(TE_ETPGust, Wf_D0_ETPGust,'ro','MarkerFaceColor','r'); hold on;
  p2 = plot(TE_Gust, Wf_D0_Gust,'gs','MarkerFaceColor','g');
  p3 = plot(TE_House, Wf_D0_House,'bd','MarkerFaceColor','b');
  p4 = plot(TE_Jones, Wf_D0_Jones,'mv','MarkerFaceColor','m');
  p5 = plot(TE_Wilkins, Wf_D0_Wilkins,'k^','MarkerFaceColor','k');
  p6 = plot(TE_Zerilli, Wf_D0_Zerilli,'kp','MarkerFaceColor','k');
  set(p6,'Color',[0.6 0.2 0.4],'MarkerFaceColor',[0.6 0.2 0.4]);
  set([p1 p2 p3 p4 p5 p6],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('1/2 \rho_0 U_0^2 + \rho_0 C_p (T-295)','FontSize',16);
  ylabel('W_f/D_0','FontSize',16);
  legend([p5 p2 p1 p6 p4 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'Gust (ETP) (1982)',...
         'Johnson and Cook (1983)', 'Jones et al. (1987)', 'House et al. (1995)');
  title('Copper','FontSize',16);
  set(gca,'YLim',[0 2.6]);
  print -depsc Cu_TE_vs_Wf_D0.eps

%
%  Plot of Lenf/L0 vs TE
%
function plotLenfL0_TE(ETPGust, Gust, House, Jones, Wilkins, Zerilli)

  [n, m] = size(ETPGust);
  for i=1:n/3
    TE_ETPGust(i) = ETPGust(3*i-1,11)/ETPGust(3*i-1,7);
    Lenf_L0_ETPGust(i) = ETPGust(3*i,4);
  end
  [n, m] = size(Gust);
  for i=1:n/3
    TE_Gust(i) = Gust(3*i-1,11)/Gust(3*i-1,7);
    Lenf_L0_Gust(i) = Gust(3*i,4);
  end
  [n, m] = size(House);
  for i=1:n/3
    TE_House(i) = House(3*i-1,11)/House(3*i-1,7);
    Lenf_L0_House(i) = House(3*i,4);
  end
  [n, m] = size(Jones);
  for i=1:n/3
    TE_Jones(i) = Jones(3*i-1,11)/Jones(3*i-1,7);
    Lenf_L0_Jones(i) = Jones(3*i,4);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    TE_Wilkins(i) = Wilkins(3*i-1,11)/Wilkins(3*i-1,7);
    Lenf_L0_Wilkins(i) = Wilkins(3*i,4);
  end
  [n, m] = size(Zerilli);
  for i=1:n/3
    TE_Zerilli(i) = Zerilli(3*i-1,11)/Zerilli(3*i-1,7);
    Lenf_L0_Zerilli(i) = Zerilli(3*i,4);
  end
  fig1 = figure;
  p1 = plot(TE_ETPGust, Lenf_L0_ETPGust,'ro','MarkerFaceColor','r'); hold on;
  p2 = plot(TE_Gust, Lenf_L0_Gust,'gs','MarkerFaceColor','g');
  p3 = plot(TE_House, Lenf_L0_House,'bd','MarkerFaceColor','b');
  p4 = plot(TE_Jones, Lenf_L0_Jones,'mv','MarkerFaceColor','m');
  p5 = plot(TE_Wilkins, Lenf_L0_Wilkins,'k^','MarkerFaceColor','k');
  p6 = plot(TE_Zerilli, Lenf_L0_Zerilli,'kp','MarkerFaceColor','k');
  set(p6,'Color',[0.6 0.2 0.4],'MarkerFaceColor',[0.6 0.2 0.4]);
  set([p1 p2 p3 p4 p5 p6],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('1/2 \rho_0 U_0^2 + \rho_0 C_p (T-295)','FontSize',16);
  ylabel('Len_f/L_0','FontSize',16);
  legend([p5 p2 p1 p6 p4 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'Gust (ETP) (1982)',...
         'Johnson and Cook (1983)', 'Jones et al. (1987)', 'House et al. (1995)');
  title('Copper','FontSize',16);
  set(gca,'YLim',[0 1.0]);
  print -depsc Cu_TE_vs_Lenf_L0.eps

function plotAfA0_TE(ETPGust, Gust, House, Jones, Wilkins, Zerilli)

  [n, m] = size(ETPGust);
  for i=1:n/3
    TE_ETPGust(i) = ETPGust(3*i-1,11)/ETPGust(3*i-1,7);
    Af_A0_ETPGust(i) = ETPGust(3*i,7);
  end
  [n, m] = size(Gust);
  for i=1:n/3
    TE_Gust(i) = Gust(3*i-1,11)/Gust(3*i-1,7);
    Af_A0_Gust(i) = Gust(3*i,7);
  end
  [n, m] = size(House);
  for i=1:n/3
    TE_House(i) = House(3*i-1,11)/House(3*i-1,7);
    Af_A0_House(i) = House(3*i,7);
  end
  [n, m] = size(Jones);
  for i=1:n/3
    TE_Jones(i) = Jones(3*i-1,11)/Jones(3*i-1,7);
    Af_A0_Jones(i) = Jones(3*i,7);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    TE_Wilkins(i) = Wilkins(3*i-1,11)/Wilkins(3*i-1,7);
    Af_A0_Wilkins(i) = Wilkins(3*i,7);
  end
  [n, m] = size(Zerilli);
  for i=1:n/3
    TE_Zerilli(i) = Zerilli(3*i-1,11)/Zerilli(3*i-1,7);
    Af_A0_Zerilli(i) = Zerilli(3*i,7);
  end
  fig1 = figure;
  p1 = plot(TE_ETPGust, Af_A0_ETPGust,'ro','MarkerFaceColor','r'); hold on;
  p2 = plot(TE_Gust, Af_A0_Gust,'gs','MarkerFaceColor','g');
  p3 = plot(TE_House, Af_A0_House,'bd','MarkerFaceColor','b');
  p4 = plot(TE_Jones, Af_A0_Jones,'mv','MarkerFaceColor','m');
  p5 = plot(TE_Wilkins, Af_A0_Wilkins,'k^','MarkerFaceColor','k');
  p6 = plot(TE_Zerilli, Af_A0_Zerilli,'kp','MarkerFaceColor','k');
  set(p6,'Color',[0.6 0.2 0.4],'MarkerFaceColor',[0.6 0.2 0.4]);
  set([p1 p2 p3 p4 p5 p6],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('1/2 \rho_0 U_0^2 + \rho_0 C_p (T-295)','FontSize',16);
  ylabel('A_f/A_0','FontSize',16);
  legend([p5 p2 p1 p6 p4 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'Gust (ETP) (1982)',...
         'Johnson and Cook (1983)', 'Jones et al. (1987)', 'House et al. (1995)');
  title('Copper','FontSize',16);
  set(gca,'YLim',[0 2.6]);
  print -depsc Cu_TE_vs_Af_A0.eps

function plotVfV0_TE(ETPGust, Gust, House, Jones, Wilkins, Zerilli)

  [n, m] = size(ETPGust);
  for i=1:n/3
    TE_ETPGust(i) = ETPGust(3*i-1,11)/ETPGust(3*i-1,7);
    Vf_V0_ETPGust(i) = ETPGust(3*i,8);
  end
  [n, m] = size(Gust);
  for i=1:n/3
    TE_Gust(i) = Gust(3*i-1,11)/Gust(3*i-1,7);
    Vf_V0_Gust(i) = Gust(3*i,8);
  end
  [n, m] = size(House);
  for i=1:n/3
    TE_House(i) = House(3*i-1,11)/House(3*i-1,7);
    Vf_V0_House(i) = House(3*i,8);
  end
  [n, m] = size(Jones);
  for i=1:n/3
    TE_Jones(i) = Jones(3*i-1,11)/Jones(3*i-1,7);
    Vf_V0_Jones(i) = Jones(3*i,8);
  end
  [n, m] = size(Wilkins);
  for i=1:n/3
    TE_Wilkins(i) = Wilkins(3*i-1,11)/Wilkins(3*i-1,7);
    Vf_V0_Wilkins(i) = Wilkins(3*i,8);
  end
  [n, m] = size(Zerilli);
  for i=1:n/3
    TE_Zerilli(i) = Zerilli(3*i-1,11)/Zerilli(3*i-1,7);
    Vf_V0_Zerilli(i) = Zerilli(3*i,8);
  end
  fig1 = figure;
  p1 = plot(TE_ETPGust, Vf_V0_ETPGust,'ro','MarkerFaceColor','r'); hold on;
  p2 = plot(TE_Gust, Vf_V0_Gust,'gs','MarkerFaceColor','g');
  p3 = plot(TE_House, Vf_V0_House,'bd','MarkerFaceColor','b');
  p4 = plot(TE_Jones, Vf_V0_Jones,'mv','MarkerFaceColor','m');
  p5 = plot(TE_Wilkins, Vf_V0_Wilkins,'k^','MarkerFaceColor','k');
  p6 = plot(TE_Zerilli, Vf_V0_Zerilli,'kp','MarkerFaceColor','k');
  set(p6,'Color',[0.6 0.2 0.4],'MarkerFaceColor',[0.6 0.2 0.4]);
  set([p1 p2 p3 p4 p5 p6],'MarkerSize',10);
  set(gca, 'FontSize',16);
  xlabel('1/2 \rho_0 U_0^2 + \rho_0 C_p (T-295)','FontSize',16);
  ylabel('V_f/V_0','FontSize',16);
  legend([p5 p2 p1 p6 p4 p3], 'Wilkins and Guinan (1973)', 'Gust (1982)', 'Gust (ETP) (1982)',...
         'Johnson and Cook (1983)', 'Jones et al. (1987)', 'House et al. (1995)');
  title('Copper','FontSize',16);
  set(gca,'YLim',[0 2.6]);
  print -depsc Cu_TE_vs_Vf_V0.eps

