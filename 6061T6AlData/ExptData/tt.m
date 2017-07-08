load AlSigEpsEleiche0001s70F.dat
load AlSigEpsEleiche0001s300F.dat
load AlSigEpsEleiche0001s400F.dat
load AlSigEpsEleiche0001s550F.dat
load AlSigEpsEleiche1000s70F.dat
load AlSigEpsEleiche1000s300F.dat
load AlSigEpsEleiche1000s400F.dat
load AlSigEpsEleiche1000s550F.dat

sig10 = AlSigEpsEleiche0001s70F;
sig11 = AlSigEpsEleiche0001s300F;
sig12 = AlSigEpsEleiche0001s400F;
sig13 = AlSigEpsEleiche0001s550F;
sig20 = AlSigEpsEleiche1000s70F;
sig21 = AlSigEpsEleiche1000s300F;
sig22 = AlSigEpsEleiche1000s400F;
sig23 = AlSigEpsEleiche1000s550F;

T = [70 300 400 500];
s1 = [sig10(1,2) sig11(1,2) sig12(1,2) sig13(1,2)];
s2 = [sig10(2,2) sig11(2,2) sig12(2,2) sig13(2,2)];
s3 = [sig20(1,2) sig21(1,2) sig22(1,2) sig23(1,2)];
s4 = [sig20(2,2) sig21(2,2) sig22(2,2) sig23(2,2)];

plot(T,s1,'r'); hold on;
plot(T,s2,'r'); hold on;
plot(T,s3,'b'); hold on;
plot(T,s4,'b'); hold on;

