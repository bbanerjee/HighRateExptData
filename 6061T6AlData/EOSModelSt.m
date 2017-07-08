function testEOSModel

  fig = figure;
  set(fig, 'Position', [379 482 711 562]);

  %
  % Load EOS data from Bancroft et al., JAP, 1956, 27(3), 291.
  %
  load EOSIronBancroft.dat
  invEtaEx0 = EOSIronBancroft(:,1);
  presEx0 = EOSIronBancroft(:,2)*1.0e11;
  etaEx0 = 1.0./invEtaEx0;
  pEx0 = plot(etaEx0, presEx0/10^9, 'o'); hold on;
  set(pEx0, 'LineWidth', 2, 'MarkerSize', 8);
  set(pEx0, 'Color', [0.9 0.0 0.0]);

  %
  % Load EOS data from Katz et al., JAP, 1959, 30(4), 568.
  %
  load EOSMildSteelKatz.dat
  invEtaEx1 = EOSMildSteelKatz(:,1);
  presEx1 = EOSMildSteelKatz(:,2)*10^8;
  etaEx1 = 1.0./invEtaEx1;
  pEx1 = plot(etaEx1, presEx1/10^9, 's'); hold on;
  set(pEx1, 'LineWidth', 2, 'MarkerSize', 8);
  set(pEx1, 'Color', [0.0 0.9 0.4]);
  
  %
  % Load EOS data from McQueen et al., 1970
  %
  load EOSIronMcQueenPV.dat
  invEtaEx2 = EOSIronMcQueenPV(:,1);
  presEx2 = EOSIronMcQueenPV(:,2)*1.0e11;
  etaEx2 = 1.0./invEtaEx2;
  pEx2 = plot(etaEx2, presEx2/1.0e9, 'p'); hold on;
  set(pEx2, 'LineWidth', 2, 'MarkerSize', 8);
  set(pEx2, 'Color', [0.75 0.25 1.0]);

  load EOSSteelMcQueenPV.dat
  rho0Ex3 = EOSSteelMcQueenPV(1,1);
  rhoEx3 = EOSSteelMcQueenPV(:,1);
  presEx3 = EOSSteelMcQueenPV(:,2)*1.0e11;
  etaEx3 = rhoEx3/rho0Ex3;
  pEx3 = plot(etaEx3, presEx3/1.0e9, '^'); hold on;
  set(pEx3, 'LineWidth', 2, 'MarkerSize', 8);
  set(pEx3, 'Color', [0.25 0.75 1.0]);

  %
  % Load EOS data from Barker et al., JAP, 1974, 45(11), 4872.
  %
  load EOSIronBarker.dat
  invEtaEx4 = EOSIronBarker(:,1);
  presEx4 = EOSIronBarker(:,2);
  etaEx4 = 1.0./invEtaEx4;
  pEx4 = plot(etaEx4, presEx4, 'd'); hold on;
  set(pEx4, 'LineWidth', 2, 'MarkerSize', 8);
  set(pEx4, 'Color', [0.01 0.01 0.9]);
  
  %
  % Load EOS data from Gust et al., 1979
  %
  load EOS4340GustPV.dat
  [m,n] = size(EOS4340GustPV);
  vol0Ex5 = EOS4340GustPV(m,1);
  volEx5 = EOS4340GustPV(:,1);
  presEx5 = EOS4340GustPV(:,2);
  etaEx5 = vol0Ex5./volEx5;
  pEx5 = plot(etaEx5, presEx5, 'v'); hold on;
  set(pEx5, 'LineWidth', 2, 'MarkerSize', 8);
  set(pEx5, 'Color', [0.0 0.0 0.0]);


