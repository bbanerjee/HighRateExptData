T = 300.0;
edot = [0.001 0.002 0.02 0.085 1.1 8.5 30 1000];

load AlSigEpsEleiche0001s300F.dat
a01 =  AlSigEpsEleiche0001s300F;

load AlSigEpsEleiche0002s300F.dat
a02 =  AlSigEpsEleiche0002s300F;

load AlSigEpsEleiche002s300F.dat
a03 =  AlSigEpsEleiche002s300F;

load AlSigEpsEleiche0085s300F.dat
a04 =  AlSigEpsEleiche0085s300F;

load AlSigEpsEleiche11s300F.dat
a05 =  AlSigEpsEleiche11s300F;

load AlSigEpsEleiche85s300F.dat
a06 =  AlSigEpsEleiche85s300F;

load AlSigEpsEleiche30s300F.dat
a07 =  AlSigEpsEleiche30s300F;

load AlSigEpsEleiche1000s300F.dat
a08 =  AlSigEpsEleiche1000s300F;

sig02 = [a01(1,2) a02(1,2) a03(1,2) a04(1,2) a05(1,2) a06(1,2) a07(1,2) a08(1,2)];
sig08 = [a01(2,2) a02(2,2) a03(2,2) a04(2,2) a05(2,2) a06(2,2) a07(2,2) a08(2,2)];
semilogx(edot, sig02, 'r^-'); hold on;
semilogx(edot, sig08, 'r^-', 'MarkerFaceColor','r'); hold on;

T = 400.0;
edot = [0.001 0.002 0.05 0.75 5 30 900 1000];
load AlSigEpsEleiche0001s400F.dat
a11 =  AlSigEpsEleiche0001s400F;

load AlSigEpsEleiche0002s400F.dat
a12 =  AlSigEpsEleiche0002s400F;

load AlSigEpsEleiche005s400F.dat
a13 =  AlSigEpsEleiche005s400F;

load AlSigEpsEleiche075s400F.dat
a14 =  AlSigEpsEleiche075s400F;

load AlSigEpsEleiche5s400F.dat
a15 =  AlSigEpsEleiche5s400F;

load AlSigEpsEleiche30s400F.dat
a16 =  AlSigEpsEleiche30s400F;

load AlSigEpsEleiche900s400F.dat
a17 =  AlSigEpsEleiche900s400F;

load AlSigEpsEleiche1000s400F.dat
a18 =  AlSigEpsEleiche1000s400F;

sig12 = [a11(1,2) a12(1,2) a13(1,2) a14(1,2) a15(1,2) a16(1,2) a17(1,2) a18(1,2)];
sig18 = [a11(2,2) a12(2,2) a13(2,2) a14(2,2) a15(2,2) a16(2,2) a17(2,2) a18(2,2)];
semilogx(edot, sig12, 'b^-'); hold on;
semilogx(edot, sig18, 'b^-', 'MarkerFaceColor','r'); hold on;

T = 550.0;
edot = [0.001 0.002 0.02 0.06 0.085 0.15 0.7 1.2 50 1000 1150];
load AlSigEpsEleiche0001s550F.dat
a21 =  AlSigEpsEleiche0001s550F;

load AlSigEpsEleiche0002s550F.dat
a22 =  AlSigEpsEleiche0002s550F;

load AlSigEpsEleiche002s550F.dat
a23 =  AlSigEpsEleiche002s550F;

load AlSigEpsEleiche006s550F.dat
a24 =  AlSigEpsEleiche006s550F;

load AlSigEpsEleiche0085s550F.dat
a25 =  AlSigEpsEleiche0085s550F;

load AlSigEpsEleiche015s550F.dat
a26 =  AlSigEpsEleiche015s550F;

load AlSigEpsEleiche07s550F.dat
a27 =  AlSigEpsEleiche07s550F;

load AlSigEpsEleiche12s550F.dat
a28 =  AlSigEpsEleiche12s550F;

load AlSigEpsEleiche50s550F.dat
a29 =  AlSigEpsEleiche50s550F;

load AlSigEpsEleiche1000s550F.dat
a210 =  AlSigEpsEleiche1000s550F;

load AlSigEpsEleiche1150s550F.dat
a211 =  AlSigEpsEleiche1150s550F;

sig22 = [a21(1,2) a22(1,2) a23(1,2) a24(1,2) a25(1,2) a26(1,2) a27(1,2) a28(1,2) ...
         a29(1,2) a210(1,2) a211(1,2)];
sig28 = [a21(2,2) a22(2,2) a23(2,2) a24(2,2) a25(2,2) a26(2,2) a27(2,2) a28(2,2) ...
         a29(2,2) a210(2,2) a211(2,2)];
semilogx(edot, sig22, 'b^-'); hold on;
semilogx(edot, sig28, 'b^-', 'MarkerFaceColor','r'); hold on;
