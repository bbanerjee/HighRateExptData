T = 300.0;
edot = [0.001 0.002 0.02 0.085 1.1 8.5 30 1000];

load AlSigEpsEleiche0001s300F.dat
a01 =  AlSigEpsEleiche0001s300F;

load AlSigEpsEleiche0002s300F.dat
a02 =  AlSigEpsEleiche0002s300F;
a02(:,2) = a02(:,2)*58/60;
fid = fopen('AlSigEpsEleiche0002s300F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a02(i,1),a02(i,2));
end
fclose(fid);

load AlSigEpsEleiche002s300F.dat
a03 =  AlSigEpsEleiche002s300F;
a03(:,2) = a03(:,2)*58/60;
fid = fopen('AlSigEpsEleiche002s300F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a03(i,1),a03(i,2));
end
fclose(fid);

load AlSigEpsEleiche0085s300F.dat
a04 =  AlSigEpsEleiche0085s300F;
a04(:,2) = a04(:,2)*58/60;
fid = fopen('AlSigEpsEleiche0085s300F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a04(i,1),a04(i,2));
end
fclose(fid);

load AlSigEpsEleiche11s300F.dat
a05 =  AlSigEpsEleiche11s300F;
a05(:,2) = a05(:,2)*58/60;
fid = fopen('AlSigEpsEleiche11s300F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a05(i,1),a05(i,2));
end
fclose(fid);

load AlSigEpsEleiche85s300F.dat
a06 =  AlSigEpsEleiche85s300F;
a06(:,2) = a06(:,2)*58/60;
fid = fopen('AlSigEpsEleiche85s300F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a06(i,1),a06(i,2));
end
fclose(fid);

load AlSigEpsEleiche30s300F.dat
a07 =  AlSigEpsEleiche30s300F;
a07(:,2) = a07(:,2)*58/60;
fid = fopen('AlSigEpsEleiche30s300F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a07(i,1),a07(i,2));
end
fclose(fid);

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
a12(:,2) = a12(:,2)*58/60;
fid = fopen('AlSigEpsEleiche0002s400F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a12(i,1),a12(i,2));
end
fclose(fid);

load AlSigEpsEleiche005s400F.dat
a13 =  AlSigEpsEleiche005s400F;
a13(:,2) = a13(:,2)*58/60;
fid = fopen('AlSigEpsEleiche005s400F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a13(i,1),a13(i,2));
end
fclose(fid);

load AlSigEpsEleiche075s400F.dat
a14 =  AlSigEpsEleiche075s400F;
a14(:,2) = a14(:,2)*58/60;
fid = fopen('AlSigEpsEleiche075s400F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a14(i,1),a14(i,2));
end
fclose(fid);

load AlSigEpsEleiche5s400F.dat
a15 =  AlSigEpsEleiche5s400F;
a15(:,2) = a15(:,2)*58/60;
fid = fopen('AlSigEpsEleiche5s400F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a15(i,1),a15(i,2));
end
fclose(fid);

load AlSigEpsEleiche30s400F.dat
a16 =  AlSigEpsEleiche30s400F;
a16(:,2) = a16(:,2)*58/60;
fid = fopen('AlSigEpsEleiche30s400F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a16(i,1),a16(i,2));
end
fclose(fid);

load AlSigEpsEleiche900s400F.dat
a17 =  AlSigEpsEleiche900s400F;
a17(:,2) = a17(:,2)*58/60;
fid = fopen('AlSigEpsEleiche900s400F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a17(i,1),a17(i,2));
end
fclose(fid);

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
a22(:,2) = a22(:,2)*58/60;
fid = fopen('AlSigEpsEleiche0002s550F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a22(i,1),a22(i,2));
end
fclose(fid);

load AlSigEpsEleiche002s550F.dat
a23 =  AlSigEpsEleiche002s550F;
a23(:,2) = a23(:,2)*58/60;
fid = fopen('AlSigEpsEleiche002s550F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a23(i,1),a23(i,2));
end
fclose(fid);

load AlSigEpsEleiche006s550F.dat
a24 =  AlSigEpsEleiche006s550F;
a24(:,2) = a24(:,2)*58/60;
fid = fopen('AlSigEpsEleiche006s550F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a24(i,1),a24(i,2));
end
fclose(fid);

load AlSigEpsEleiche0085s550F.dat
a25 =  AlSigEpsEleiche0085s550F;
a25(:,2) = a25(:,2)*58/60;
fid = fopen('AlSigEpsEleiche0085s550F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a25(i,1),a25(i,2));
end
fclose(fid);

load AlSigEpsEleiche015s550F.dat
a26 =  AlSigEpsEleiche015s550F;
a26(:,2) = a26(:,2)*58/60;
fid = fopen('AlSigEpsEleiche015s550F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a26(i,1),a26(i,2));
end
fclose(fid);

load AlSigEpsEleiche07s550F.dat
a27 =  AlSigEpsEleiche07s550F;
a27(:,2) = a27(:,2)*58/60;
fid = fopen('AlSigEpsEleiche07s550F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a27(i,1),a27(i,2));
end
fclose(fid);

load AlSigEpsEleiche12s550F.dat
a28 =  AlSigEpsEleiche12s550F;
a28(:,2) = a28(:,2)*58/60;
fid = fopen('AlSigEpsEleiche12s550F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a28(i,1),a28(i,2));
end
fclose(fid);

load AlSigEpsEleiche50s550F.dat
a29 =  AlSigEpsEleiche50s550F;
a29(:,2) = a29(:,2)*58/60;
fid = fopen('AlSigEpsEleiche50s550F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a29(i,1),a29(i,2));
end
fclose(fid);

load AlSigEpsEleiche1000s550F.dat
a210 =  AlSigEpsEleiche1000s550F;

load AlSigEpsEleiche1150s550F.dat
a211 =  AlSigEpsEleiche1150s550F;
a211(:,2) = a211(:,2)*58/60;
fid = fopen('AlSigEpsEleiche1150s550F.dat','w');
for i=1:2
  fprintf(fid,'%f %f\n',a211(i,1),a211(i,2));
end
fclose(fid);

sig22 = [a21(1,2) a22(1,2) a23(1,2) a24(1,2) a25(1,2) a26(1,2) a27(1,2) a28(1,2) ...
         a29(1,2) a210(1,2) a211(1,2)];
sig28 = [a21(2,2) a22(2,2) a23(2,2) a24(2,2) a25(2,2) a26(2,2) a27(2,2) a28(2,2) ...
         a29(2,2) a210(2,2) a211(2,2)];
semilogx(edot, sig22, 'b^-'); hold on;
semilogx(edot, sig28, 'b^-', 'MarkerFaceColor','r'); hold on;
