function plsig1
% close all
% fig10 = figure;
% set(fig10,'Position',[182 150 1131 813]);
hold on;
% load seq_MTS_adi_2000_298K.dat;
% load eps_MTS_adi_2000_298K.dat;
% seq1 = seq_MTS_adi_2000_298K;
% eps1 = eps_MTS_adi_2000_298K;
% e331 = eps1(:,4);
% seqv1 = seq1(:,4)/1.0e6;
% seqv1 = seqv1;
% % plot(e33, seqv, 'k-', 'LineWidth', 2.5);
% hold on;


load seq_MTS_adi_1000_298K.dat;
load ep_MTS_adi_1000_298K.dat;
seq1 = seq_MTS_adi_1000_298K;
eps1 = ep_MTS_adi_1000_298K;
e331 = eps1(:,5);
seqv1 = seq1(:,4)/1.0e6;
seqv1 = seqv1;

load seq_MTS_adi_1000_463K.dat;
load ep_MTS_adi_1000_463K.dat;
seq2 = seq_MTS_adi_1000_463K;
eps2 = ep_MTS_adi_1000_463K;
e332 = eps2(:,5);
seqv2 = seq2(:,4)/1.0e6;
seqv2 = seqv2;

load seq_MTS_adi_1000_618K.dat;
load ep_MTS_adi_1000_618K.dat;
seq3 = seq_MTS_adi_1000_618K;
eps3 = ep_MTS_adi_1000_618K;
e333 = eps3(:,5);
seqv3 = seq3(:,4)/1.0e6;
seqv3 = seqv3;


p1 = plot(e331, seqv1, '--','color',[0.10 0.10 0.90], 'LineWidth', 2.5);
hold on;
p2 = plot(e332, seqv2, '--','color',[1.00 0.75 0.25], 'LineWidth', 2.5);

p3 = plot(e333, seqv3, '--','color',[0.60 0.20 0.00], 'LineWidth', 2.5);

%  legend([p1 p2 p3 ], ...
%          '298 K 1000/s (Rosenberg et al.)', ...
%          '463 K 1000/s (Rosenberg et al.)',...
%          '618 K 2000/s (Rosenberg et al.)');

% set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);
% set(gca, 'XLim',[0 0.1], 'YLim',[0 500]);
% xlabel('True Plastic Strain', 'FontName', 'bookman', 'FontSize', 16);
% ylabel('True Stress (MPa) ', 'FontName', 'bookman', 'FontSize', 16);


