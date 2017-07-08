function calcTrueSigEps

  calcYadav
  calcRosenberg
  calcOgawa
  calcLesuer
  calcLee
  calcRamesh
  calcHoge
  calcGreen
  calcFish
  calcEleiche
  calcDavidson
  calcCady;
  calcASMH;

%====================================================================
% Compute bulk and shear modulus at temperature T, and from that
% the Young's modulus
%
function E = calcModulus(T)

  mu0 = 28.5e9;
  D = 4.55e9;
  T_0 = 298;
  mu = mu0 - D/(exp(T_0/T) - 1);

  K0 = 77.0e9;
  D = 6.20e9;
  T0 = 260;
  K = K0 - D/(exp(T0/T) - 1);

  E = 9*K*mu/(3*K + mu);

%====================================================================
%
% Load experimental data from
%  Yadav S., Chichili D.R., Ramesh K.T., 1995, "The mechanical response 
%  of a 6061-T6 Al/Al2O3 metal matrix composite at high rates of
%  deformation", Acta metall.mater., vol.43, no.12, 4453-4464.
%
function calcYadav

  fig1 = figure;
  fig2 = figure;

  %
  % Factor for conversion to MPa and strain
  %
  facSig = 1.0;
  facEps = 1.0;

  color = [1 0 0];
  P = 0.0;
  edot = 380.0;
  T = 298;
  E = calcModulus(T);
  load RawData/AlSigEpsYadav380s298K.dat
  dat = AlSigEpsYadav380s298K;
  plotWriteSigEps(dat, './ProcData/SigEpsEp380s298KYad.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  color = [1 0 0];
  edot = 500.0;
  T = 298;
  E = calcModulus(T);
  load RawData/AlSigEpsYadav500s298K.dat
  dat = AlSigEpsYadav500s298K;
  plotWriteSigEps(dat, './ProcData/SigEpsEp500s298KYad.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  color = [1 0 0];
  edot = 2000.0;
  T = 298;
  E = calcModulus(T);
  load RawData/AlSigEpsYadav2000s298K.dat
  dat = AlSigEpsYadav2000s298K;
  plotWriteSigEps(dat, './ProcData/SigEpsEp2000s298KYad.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  color = [1 0 0];
  edot = 3600.0;
  T = 298;
  E = calcModulus(T);
  load RawData/AlSigEpsYadav3600s298K.dat
  dat = AlSigEpsYadav3600s298K;
  plotWriteSigEps(dat, './ProcData/SigEpsEp3600s298KYad.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

%====================================================================
%
% Load experimental data from
%  Rosenberg, Z., Dawicke, E., Strader, E., and Bless, S.J., 
%  "A new technique for heating specimens in Split-Hopkinson-Bar 
%   Experiments Using Induction-Coil Heaters", Experimental
%   Mechanics, Vol 26(3), 1986.
%
function calcRosenberg

  fig1 = figure;
  fig2 = figure;

  %
  % Factor for conversion to MPa and strain
  %
  facSig = 1.0e2;
  facEps = 1.0;

  color = [1 0 0];
  P = 0.0;
  edot = 1000.0;
  T = 298;
  E = calcModulus(T);
  load RawData/AlSigEpsRosen1000s298K.dat
  dat = AlSigEpsRosen1000s298K;
  plotWriteSigEps(dat, './ProcData/SigEpsEp1000s298KRos.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  color = [1 0 0];
  edot = 1000.0;
  T = 463;
  E = calcModulus(T);
  load RawData/AlSigEpsRosen1000s463K.dat
  dat = AlSigEpsRosen1000s463K;
  plotWriteSigEps(dat, './ProcData/SigEpsEp1000s463KRos.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  color = [1 0 0];
  edot = 1000.0;
  T = 618;
  E = calcModulus(T);
  load RawData/AlSigEpsRosen1000s618K.dat
  dat = AlSigEpsRosen1000s618K;
  plotWriteSigEps(dat, './ProcData/SigEpsEp1000s618KRos.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

%====================================================================
%
% Load experimental data from
%  Ogawa, K, "Impact tensile characteristics of 6061-T6 aluminum alloy", Journal of
%  Japan Institute of Light Metals, Vol.51(3), (2001), 173-181.
%
function calcOgawa

  fig1 = figure;
  fig2 = figure;

  %
  % Factor for conversion to MPa and strain
  %
  facSig = 1.0;
  facEps = 1.0e-2;

  color = [1 0 0];
  P = 0.0;
  edot = 5.7e-4;
  T = 77;
  E = calcModulus(T);
  load RawData/AlSigEpsOgawa000057s77K.dat
  dat = AlSigEpsOgawa000057s77K;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp000057s77KOga.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 5.7e-4;
  T = 201;
  E = calcModulus(T);
  load RawData/AlSigEpsOgawa000057s201K.dat
  dat = AlSigEpsOgawa000057s201K;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp000057s201KOga.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 5.7e-4;
  T = 289;
  E = calcModulus(T);
  load RawData/AlSigEpsOgawa000057s289K.dat
  dat = AlSigEpsOgawa000057s289K;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp000057s289KOga.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 5.7e-4;
  T = 373;
  E = calcModulus(T);
  load RawData/AlSigEpsOgawa000057s373K.dat
  dat = AlSigEpsOgawa000057s373K;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp000057s373KOga.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 5.7e-4;
  T = 473;
  E = calcModulus(T);
  load RawData/AlSigEpsOgawa000057s473K.dat
  dat = AlSigEpsOgawa000057s473K;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp000057s473KOga.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  color = [0 0 1];
  edot = 1500;
  T = 77;
  E = calcModulus(T);
  load RawData/AlSigEpsOgawa1500s77K.dat
  dat = AlSigEpsOgawa1500s77K;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp1500s77KOga.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 1500;
  T = 201;
  E = calcModulus(T);
  load RawData/AlSigEpsOgawa1500s201K.dat
  dat = AlSigEpsOgawa1500s201K;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp1500s201KOga.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 1500;
  T = 289;
  E = calcModulus(T);
  load RawData/AlSigEpsOgawa1500s289K.dat
  dat = AlSigEpsOgawa1500s289K;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp1500s289KOga.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 1500;
  T = 373;
  E = calcModulus(T);
  load RawData/AlSigEpsOgawa1500s373K.dat
  dat = AlSigEpsOgawa1500s373K;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp1500s373KOga.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 1500;
  T = 473;
  E = calcModulus(T);
  load RawData/AlSigEpsOgawa1500s473K.dat
  dat = AlSigEpsOgawa1500s473K;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp1500s473KOga.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

%====================================================================
%
% Load experimental data from
%  Lesuer D.R., Kay G.J., LeBlanc M.M., 2001, "Modelling Large-Strain, 
%  High-Rate Deformation in Metals", Third Biennial Tri-Laboratory 
%  Engineering Conference Modeling and Simulation, Pleasanton, CA,
%  November 3-5, 1999 , UCRL-JC-134118, Lawrence Livermore National Laboratory.
%
function calcLesuer

  fig1 = figure;
  fig2 = figure;

  %
  % Factor for conversion to MPa and strain
  %
  facSig = 1.0;
  facEps = 1.0;

  color = [1 0 0];
  P = 0.0;
  edot = 4000.0;
  T = 298;
  E = calcModulus(T);
  load RawData/AlSigEpsLesuer4000s298K.dat
  dat = AlSigEpsLesuer4000s298K;
  plotWriteSigEps(dat, './ProcData/SigEpsEp4000s298KLes.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  color = [1 0 0];
  edot = 8000.0;
  T = 298;
  E = calcModulus(T);
  load RawData/AlSigEpsLesuer8000s298K.dat
  dat = AlSigEpsLesuer8000s298K;
  plotWriteSigEps(dat, './ProcData/SigEpsEp8000s298KLes.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

%====================================================================
%
% Load experimental data from
%  Lee, W.S., Shyu, J.C., and Chiou, S.T., "EFFECT OF STRAIN RATE ON IMPACT RESPONSE AND
%  DISLOCATION SUBSTRUCTURE OF 6061-T6 ALUMINUM ALLOY", Scripta mater. 42(2000), 51-56.
%
function calcLee

  fig1 = figure;
  fig2 = figure;

  %
  % Factor for conversion to MPa and strain
  %
  facSig = 1.0;
  facEps = 1.0;

  color = [1 0 0];
  P = 0.0;
  edot = 1000.0;
  T = 298;
  E = calcModulus(T);
  load RawData/AlSigEpsLee1000s298K.dat
  dat = AlSigEpsLee1000s298K;
  plotWriteSigEps(dat, './ProcData/SigEpsEp1000s298KLee.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 2000.0;
  T = 298;
  E = calcModulus(T);
  load RawData/AlSigEpsLee2000s298K.dat
  dat = AlSigEpsLee2000s298K;
  plotWriteSigEps(dat, './ProcData/SigEpsEp2000s298KLee.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 3000.0;
  T = 298;
  E = calcModulus(T);
  load RawData/AlSigEpsLee3000s298K.dat
  dat = AlSigEpsLee3000s298K;
  plotWriteSigEps(dat, './ProcData/SigEpsEp3000s298KLee.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 4000.0;
  T = 298;
  E = calcModulus(T);
  load RawData/AlSigEpsLee4000s298K.dat
  dat = AlSigEpsLee4000s298K;
  plotWriteSigEps(dat, './ProcData/SigEpsEp4000s298KLee.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

%====================================================================
%
% Load experimental data from
%  Jia, D. and Ramesh, K. T., "A Rigorous Assessment of the Benefits of
%  Miniaturization in the Kolsky Bar System.",Experimental Mechanics, 
%  44(5), 445-454, 2004.
%
function calcRamesh

  fig1 = figure;
  fig2 = figure;

  %
  % Factor for conversion to MPa and strain
  %
  facSig = 1.0;
  facEps = 1.0;

  color = [1 0 0];
  P = 0.0;
  edot = 29000;
  T = 298;
  E = calcModulus(T);
  load RawData/AlSigEpsRamesh29000s298K.dat
  dat = AlSigEpsRamesh29000s298K;
  plotWriteSigEps(dat, './ProcData/SigEpsEp29000s298KRam.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

%====================================================================
%
% Load experimental data from
%  Kenneth G. Hoge, Influence of Strain Rate on Mechanical Properties of 6061-T6 
%  Aluminum under Uniaxial and Biaxial States of Stress, Experimental Mechanics, 
%  April 1966.  204-211.
%
function calcHoge

  fig1 = figure;
  fig2 = figure;

  %
  % Factor for conversion to MPa and strain
  %
  facSig = 6.9;
  facEps = 1.0;

  color = [1 0 0];
  P = 0.0;
  edot = 4.8e-5;
  T = 297;
  E = calcModulus(T);
  load RawData/AlSigEpsHoge0000048s297K.dat
  dat = AlSigEpsHoge0000048s297K;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0000048s297KHog.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 28.0;
  T = 297;
  E = calcModulus(T);
  load RawData/AlSigEpsHoge28s297K.dat
  dat = AlSigEpsHoge28s297K;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp28s297KHog.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 65.0;
  T = 297;
  E = calcModulus(T);
  load RawData/AlSigEpsHoge65s297K.dat
  dat = AlSigEpsHoge65s297K;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp65s297KHog.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  color = [0 1 0];
  edot = 1.0e-5;
  T = 533;
  E = calcModulus(T);
  load RawData/AlSigEpsHoge0000010s533K.dat
  dat = AlSigEpsHoge0000010s533K;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0000010s533KHog.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 18.0;
  T = 533;
  E = calcModulus(T);
  load RawData/AlSigEpsHoge18s533K.dat
  dat = AlSigEpsHoge18s533K;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp18s533KHog.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 130.0;
  T = 533;
  E = calcModulus(T);
  load RawData/AlSigEpsHoge130s533K.dat
  dat = AlSigEpsHoge130s533K;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp130s533KHog.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  color = [0 0 1];
  edot = 1.0e-5;
  T = 644;
  E = calcModulus(T);
  load RawData/AlSigEpsHoge0000010s644K.dat
  dat = AlSigEpsHoge0000010s644K;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0000010s644KHog.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 23.0;
  T = 644;
  E = calcModulus(T);
  load RawData/AlSigEpsHoge23s644K.dat
  dat = AlSigEpsHoge23s644K;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp23s644KHog.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 54.0;
  T = 644;
  E = calcModulus(T);
  load RawData/AlSigEpsHoge54s644K.dat
  dat = AlSigEpsHoge54s644K;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp54s644KHog.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);


%====================================================================
%
% Load experimental data from
%  Green and Babcock (1966) data from
%  Eleiche, Abdel-Salam Mohamed, "Experimental investigations in the stress-strain
%  characteristics of polycrystalline metals and alloys at high strain-rates and
%  elevated temperatures - survey.", M.S. thesis, 1972, Division of engineering,
%  Brown University, RI.
%
function calcGreen

  fig1 = figure;
  fig2 = figure;

  %
  % Factor for conversion 
  %
  facSig = 1.0;
  facEps = 1.0;

  color = [1 0 0];
  P = 0.0;
  edot = 0.002;
  T = 295;
  E = calcModulus(T);
  load RawData/AlSigEpsGreen0002s72F.dat
  dat = AlSigEpsGreen0002s72F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0002s295KGre.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 18.0;
  T = 295;
  E = calcModulus(T);
  load RawData/AlSigEpsGreen18s72F.dat
  dat = AlSigEpsGreen18s72F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp18s295KGre.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 0.001;
  T = 422;
  E = calcModulus(T);
  load RawData/AlSigEpsGreen0001s300F.dat
  dat = AlSigEpsGreen0001s300F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s422KGre.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 9.0;
  T = 422;
  E = calcModulus(T);
  load RawData/AlSigEpsGreen9s300F.dat
  dat = AlSigEpsGreen9s300F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp9s422KGre.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 0.001;
  T = 589;
  E = calcModulus(T);
  load RawData/AlSigEpsGreen0002s600F.dat
  dat = AlSigEpsGreen0002s600F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s589KGre.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 10.0;
  T = 589;
  E = calcModulus(T);
  load RawData/AlSigEpsGreen10s600F.dat
  dat = AlSigEpsGreen10s600F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp10s589KGre.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

%====================================================================
%
% Load experimental data from
%   Fish, J., Oskay, C., Fan R., Barsoum, R., "Al 6061-T6-Elastomer 
%   Impact Simulations", June 21, 2005,
%   <http://www.scorec.rpi.edu/REPORTS/2005-11.pdf>
%
function calcFish

  fig1 = figure;
  fig2 = figure;

  %
  % Factor for conversion 
  %
  facSig = 1.0;
  facEps = 1.0;

  color = [1 0 0];
  P = 0.0;
  edot = 0.001;
  T = 295;
  E = calcModulus(T);
  load RawData/AlSigEpsFish0001s71F.dat
  dat = AlSigEpsFish0001s71F;
  plotWriteSigEps(dat, './ProcData/SigEpsEp0001s295KFis.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 2500.0;
  T = 295;
  E = calcModulus(T);
  load RawData/AlSigEpsFish2500s71F.dat
  dat = AlSigEpsFish2500s71F;
  plotWriteSigEps(dat, './ProcData/SigEpsEp2500s295KFis.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

%====================================================================
%
% Load experimental data from
%  Green and Babcock (1966) data from
%  Eleiche, Abdel-Salam Mohamed, "Experimental investigations in the stress-strain
%  characteristics of polycrystalline metals and alloys at high strain-rates and
%  elevated temperatures - survey.", M.S. thesis, 1972, Division of engineering,
%  Brown University, RI.
%
function calcEleiche

  fig1 = figure;
  fig2 = figure;

  %
  % Factor for conversion from ksi to MPa
  %
  facSig = 6.9;
  facEps = 1.0;

  color = [1 0 0];
  P = 0.0;
  edot = 0.001;
  T = 294;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche0001s70F.dat
  dat = AlSigEpsEleiche0001s70F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s294KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 0.001;
  T = 422;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche0001s300F.dat
  dat = AlSigEpsEleiche0001s300F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s422KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 0.001;
  T = 478;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche0001s400F.dat
  dat = AlSigEpsEleiche0001s400F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s478KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 0.001;
  T = 561;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche0001s550F.dat
  dat = AlSigEpsEleiche0001s550F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s561KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 0.002;
  T = 422;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche0002s300F.dat
  dat = AlSigEpsEleiche0002s300F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0002s422KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 0.002;
  T = 478;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche0002s400F.dat
  dat = AlSigEpsEleiche0002s400F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0002s478KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 0.002;
  T = 561;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche0002s550F.dat
  dat = AlSigEpsEleiche0002s550F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0002s561KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 0.02;
  T = 422;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche002s300F.dat
  dat = AlSigEpsEleiche002s300F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp002s422KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 0.02;
  T = 561;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche002s550F.dat
  dat = AlSigEpsEleiche002s550F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp002s561KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 0.05;
  T = 478;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche005s400F.dat
  dat = AlSigEpsEleiche005s400F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp005s478KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 0.06;
  T = 561;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche006s550F.dat
  dat = AlSigEpsEleiche006s550F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp006s561KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 0.085;
  T = 422;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche0085s300F.dat
  dat = AlSigEpsEleiche0085s300F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0085s422KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 0.085;
  T = 561;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche0085s550F.dat
  dat = AlSigEpsEleiche0085s550F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0085s561KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 0.15;
  T = 561;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche015s550F.dat
  dat = AlSigEpsEleiche015s550F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp015s561KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 0.75;
  T = 478;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche075s400F.dat
  dat = AlSigEpsEleiche075s400F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp075s478KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 0.70;
  T = 561;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche07s550F.dat
  dat = AlSigEpsEleiche07s550F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp070s561KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 1.1;
  T = 422;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche11s300F.dat
  dat = AlSigEpsEleiche11s300F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp11s422KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 1.2;
  T = 561;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche12s550F.dat
  dat = AlSigEpsEleiche12s550F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp12s561KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 5.0;
  T = 478;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche5s400F.dat
  dat = AlSigEpsEleiche5s400F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp5s478KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 8.5;
  T = 422;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche85s300F.dat
  dat = AlSigEpsEleiche85s300F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp85s422KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 30.0;
  T = 422;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche30s300F.dat
  dat = AlSigEpsEleiche30s300F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp30s422KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 30.0;
  T = 478;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche30s400F.dat
  dat = AlSigEpsEleiche30s400F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp30s478KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 50.0;
  T = 561;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche50s550F.dat
  dat = AlSigEpsEleiche50s550F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp50s561KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 900.0;
  T = 478;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche900s400F.dat
  dat = AlSigEpsEleiche900s400F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp900s478KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 1000.0;
  T = 294;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche1000s70F.dat
  dat = AlSigEpsEleiche1000s70F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp1000s294KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 1000.0;
  T = 422;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche1000s300F.dat
  dat = AlSigEpsEleiche1000s300F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp1000s422KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 1000.0;
  T = 478;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche1000s400F.dat
  dat = AlSigEpsEleiche1000s400F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp1000s478KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 1000.0;
  T = 561;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche1000s550F.dat
  dat = AlSigEpsEleiche1000s550F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp1000s561KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  edot = 1150.0;
  T = 561;
  E = calcModulus(T);
  load RawData/AlSigEpsEleiche1150s550F.dat
  dat = AlSigEpsEleiche1150s550F;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp1150s561KEle.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

%====================================================================
%
% Load experimental data from
%  Davidson, P.G., "The Effects of High Pressure and Temperature Environments on the
%  Properties of 6061-T651 Aluminum",Ph.D. thesis, 1973, Department of Mechanical
%  Engineering, University of Missouri-Rolla, Mo.
%
function calcDavidson

  fig1 = figure;
  fig2 = figure;

  %
  % Factor for conversion from ksi to MPa
  %
  facSig = 6.9;
  facEps = 1.0e-3;

  %
  % 0.001/s 300K 0.1014 MPa
  %
  color = [1 0 0];
  P = 0.0;
  edot = 0.001;
  T = 300;
  E = calcModulus(T);
  load RawData/AlSigEpsDavidson80F15psi.dat;
  dat = AlSigEpsDavidson80F15psi;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s300K01MPaDav.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.001/s 300K 138 MPa
  %
  P = 138.0;
  edot = 0.001;
  T = 300;
  E = calcModulus(T);
  load RawData/AlSigEpsDavidson80F20000psi.dat;
  dat = AlSigEpsDavidson80F20000psi;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s300K138MPaDav.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.001/s 300K 276 MPa
  %
  P = 276.0;
  edot = 0.001;
  T = 300;
  E = calcModulus(T);
  load RawData/AlSigEpsDavidson80F40000psi.dat;
  dat = AlSigEpsDavidson80F40000psi;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s300K276MPaDav.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.001/s 300K 414 MPa
  %
  P = 414.0;
  edot = 0.001;
  T = 300;
  E = calcModulus(T);
  load RawData/AlSigEpsDavidson80F60000psi.dat;
  dat = AlSigEpsDavidson80F60000psi;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s300K414MPaDav.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.001/s 367K 0.1014 MPa
  %
  P = 0.0;
  edot = 0.001;
  T = 367;
  E = calcModulus(T);
  load RawData/AlSigEpsDavidson200F15psi.dat;
  dat = AlSigEpsDavidson200F15psi;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s367K01MPaDav.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.001/s 367K 138 MPa
  %
  P = 138.0;
  edot = 0.001;
  T = 367;
  E = calcModulus(T);
  load RawData/AlSigEpsDavidson200F20000psi.dat;
  dat = AlSigEpsDavidson200F20000psi;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s367K138MPaDav.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.001/s 367K 276 MPa
  %
  P = 276.0;
  edot = 0.001;
  T = 367;
  E = calcModulus(T);
  load RawData/AlSigEpsDavidson200F40000psi.dat;
  dat = AlSigEpsDavidson200F40000psi;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s367K276MPaDav.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.001/s 367K 414 MPa
  %
  P = 414.0;
  edot = 0.001;
  T = 367;
  E = calcModulus(T);
  load RawData/AlSigEpsDavidson200F60000psi.dat;
  dat = AlSigEpsDavidson200F60000psi;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s367K414MPaDav.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.001/s 422K 0.1014 MPa
  %
  P = 0.0;
  edot = 0.001;
  T = 422;
  E = calcModulus(T);
  load RawData/AlSigEpsDavidson300F15psi.dat;
  dat = AlSigEpsDavidson300F15psi;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s422K01MPaDav.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.001/s 422K 138 MPa
  %
  P = 138.0;
  edot = 0.001;
  T = 422;
  E = calcModulus(T);
  load RawData/AlSigEpsDavidson300F20000psi.dat;
  dat = AlSigEpsDavidson300F20000psi;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s422K138MPaDav.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.001/s 422K 276 MPa
  %
  P = 276.0;
  edot = 0.001;
  T = 422;
  E = calcModulus(T);
  load RawData/AlSigEpsDavidson300F40000psi.dat;
  dat = AlSigEpsDavidson300F40000psi;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s422K276MPaDav.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.001/s 422K 414 MPa
  %
  P = 414.0;
  edot = 0.001;
  T = 422;
  E = calcModulus(T);
  load RawData/AlSigEpsDavidson300F60000psi.dat;
  dat = AlSigEpsDavidson300F60000psi;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s422K414MPaDav.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.001/s 478K 0.1014 MPa
  %
  P = 0.0;
  edot = 0.001;
  T = 478;
  E = calcModulus(T);
  load RawData/AlSigEpsDavidson400F15psi.dat;
  dat = AlSigEpsDavidson400F15psi;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s478K01MPaDav.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.001/s 478K 138 MPa
  %
  P = 138.0;
  edot = 0.001;
  T = 478;
  E = calcModulus(T);
  load RawData/AlSigEpsDavidson400F20000psi.dat;
  dat = AlSigEpsDavidson400F20000psi;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s478K138MPaDav.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.001/s 478K 276 MPa
  %
  P = 276.0;
  edot = 0.001;
  T = 478;
  E = calcModulus(T);
  load RawData/AlSigEpsDavidson400F40000psi.dat;
  dat = AlSigEpsDavidson400F40000psi;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s478K276MPaDav.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.001/s 478K 414 MPa
  %
  P = 414.0;
  edot = 0.001;
  T = 478;
  E = calcModulus(T);
  load RawData/AlSigEpsDavidson400F60000psi.dat;
  dat = AlSigEpsDavidson400F60000psi;
  plotWriteSigEpsTrue(dat, './ProcData/SigEpsEp0001s478K414MPaDav.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

%====================================================================
%
% Load experimental data from
%  Cady, C.M., Gray III, G.T., 2001, "Influence of strain rate on the deformation and 
%  fracture response of a 6061-T6 Al 50 vol.% Al2O3 continuous-reinforced composite,"
%  Materials Science and Engineering A298 (2001) 56-62.
%
function calcCady

  fig1 = figure;
  fig2 = figure;

  %
  % Conversion factors
  %
  facSig = 1.0;
  facEps = 1.0;

  %
  % 0.001/s 298K
  %
  color = [1 0 0];
  P = 0.0;
  edot = 0.001;
  T = 298;
  E = calcModulus(T);
  load RawData/AlSigEpsCady0001s298K.dat;
  dat = AlSigEpsCady0001s298K;
  plotWriteSigEps(dat, './ProcData/SigEpsEp0001s298KCad.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 4000/s 298K
  %
  edot = 4000.0;
  T = 298;
  E = calcModulus(T);
  load RawData/AlSigEpsCady4000s298K.dat;
  dat = AlSigEpsCady4000s298K;
  plotWriteSigEps(dat, './ProcData/SigEpsEp4000s298KCad.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

%
%====================================================================
%
% Load experimental data from Aerospace Structural Metals Handbook
% and ASM Handbook
%
function calcASMH

  %
  % Factor for conversion from ksi to MPa
  %
  facSig = 6.9;
  facEps = 1.0;

  fig1 = figure;
  fig2 = figure;

  %
  % 0.002/s 298K
  %
  color = [1 0 0];
  P = 0.0; 
  edot = 0.002;
  T = 298;
  E = calcModulus(T);
  TT0(1) = T;
  EE0(1) = E;
  load RawData/AlSigEpsAero298K.dat;
  dat = AlSigEpsAero298K;
  plotWriteSigEpsTrueE(dat, './ProcData/SigEpsEp0002s298KASM.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.002/s 373K
  %
  color = [0.1 0.8 0.1];
  edot = 0.002;
  T = 373;
  E = calcModulus(T);
  TT0(2) = T;
  EE0(2) = E;
  load RawData/AlSigEpsAero373K.dat;
  dat = AlSigEpsAero373K;
  plotWriteSigEpsTrueE(dat, './ProcData/SigEpsEp0002s373KASM.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.002/s 422K
  %
  color = [0 0 1];
  edot = 0.002;
  T = 422;
  E = calcModulus(T);
  TT0(3) = T;
  EE0(3) = E;
  load RawData/AlSigEpsAero422K.dat;
  dat = AlSigEpsAero422K;
  plotWriteSigEpsTrueE(dat, './ProcData/SigEpsEp0002s422KASM.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.002/s 477K
  %
  color = [0.75 0.25 1.0];
  edot = 0.002;
  T = 477;
  E = calcModulus(T);
  TT0(4) = T;
  EE0(4) = E;
  load RawData/AlSigEpsAero477K.dat;
  dat = AlSigEpsAero477K;
  plotWriteSigEpsTrueE(dat, './ProcData/SigEpsEp0002s477KASM.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.002/s 535K
  %
  color = [0.75 1.0 0.25];
  edot = 0.002;
  T = 535;
  E = calcModulus(T);
  TT0(5) = T;
  EE0(5) = E;
  load RawData/AlSigEpsAero535K.dat;
  dat = AlSigEpsAero535K;
  plotWriteSigEpsTrueE(dat, './ProcData/SigEpsEp0002s535KASM.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.002/s 589K
  %
  color = [1.0 0.75 0.25];
  edot = 0.002;
  T = 589;
  E = calcModulus(T);
  TT0(6) = T;
  EE0(6) = E;
  load RawData/AlSigEpsAero589K.dat;
  dat = AlSigEpsAero589K;
  plotWriteSigEpsTrueE(dat, './ProcData/SigEpsEp0002s589KASM.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % 0.002/s 644 K
  %
  color = [1.0 0.25 0.75];
  edot = 0.002;
  T = 644;
  E = calcModulus(T);
  TT0(7) = T;
  EE0(7) = E;
  load RawData/AlSigEpsAero644K.dat;
  dat = AlSigEpsAero644K;
  plotWriteSigEpsTrueE(dat, './ProcData/SigEpsEp0002s644KASM.dat.raw', ...
                      facEps, facSig, E, fig1, fig2, color, ...
                      edot, T, P);

  %
  % ASM data
  % 
  load RawData/AlSigEpsASMAllT.dat;
  TAll = AlSigEpsASMAllT(:,1)+273;
  TSig = AlSigEpsASMAllT(:,3);
  YSig = AlSigEpsASMAllT(:,5);
  Elong = AlSigEpsASMAllT(:,7);
  col = 'kkkrgbmgyr';
  for i=1:length(TAll)
    TT(i) = TAll(i);
    EE(i) = calcModulus(TT(i)); 
    SigY(i) = YSig(i);
    EpsY(i) = SigY(i)/EE(i)*1.0e6;
    SigT(i) = TSig(i);
    EpsT(i) = Elong(i)*0.01;
    Seq = [0 SigY(i) SigT(i)]; 
    Eps = [0 EpsY(i) EpsT(i)]; 
    Seq = Seq.*(1.0 + Eps);
    Eps = log(1.0 + Eps);
    Ep = Eps - Seq*1.0e6/EE(i);
    figure(fig1);
    plot(Eps, Seq, col(i)); hold on;
    figure(fig2);
    plot(Ep, Seq, col(i)); hold on;
  end
  %TT
  %TT0
  %EE
  %EE0
  %EE1
  %nu = 0.33;
  %for i=1:length(EE0)
  %  GG0(i) = EE0(i)/(2*(1+nu));
  %end
  %for i=1:length(EE1)
  %  GG1(i) = EE1(i)/(2*(1+nu));
  %  nu1(i) = EE1(i)/(2*GG0(i)) - 1.0;
  %end
  %GG0
  %GG1
  %nu1
  %EpsY
  %SigY
  %figure
  %plot(TT0,GG0, 'ro-'); hold on;
  %plot(TT0,GG1, 'bs-'); hold on;

%===================================================================
% Write and plot stress strain data (after converting to true sig-eps)
%
function plotWriteSigEpsTrue(dat, filename, facEps, facSig, E, ...
         fig1, fig2, color, edot, T, P)

  epsEx = dat(:,1)*facEps;
  seqEx = dat(:,2)*facSig;
  seqEx = seqEx.*(1.0 + epsEx);
  epsEx = log(1.0 + epsEx);
  epEx = epsEx - seqEx*1.0e6/E;
  fid = fopen(filename, 'w');
  for i=1:length(epEx)
   fprintf(fid, '%g %g %g %g %g %g\n', P, T, edot, ...
           epsEx(i), epEx(i), seqEx(i));
  end
  fclose(fid);

  figure(fig1);
  p1 = plot(epsEx, seqEx); hold on;
  set(p1, 'LineWidth', 2, 'Color', color);
  figure(fig2);
  p2 = plot(epEx, seqEx); hold on;
  set(p2, 'LineWidth', 2, 'Color', color);

%===================================================================
% Write and plot stress strain data
%
function plotWriteSigEps(dat, filename, facEps, facSig, E, ...
         fig1, fig2, color, edot, T, P)

  epsEx = dat(:,1)*facEps;
  seqEx = dat(:,2)*facSig;
  epEx = epsEx - seqEx*1.0e6/E;
  fid = fopen(filename, 'w');
  for i=1:length(epEx)
   fprintf(fid, '%g %g %g %g %g %g\n', P, T, edot, ...
           epsEx(i), epEx(i), seqEx(i));
  end
  fclose(fid);

  figure(fig1);
  p1 = plot(epsEx, seqEx); hold on;
  set(p1, 'LineWidth', 2, 'Color', color);
  figure(fig2);
  p2 = plot(epEx, seqEx); hold on;
  set(p2, 'LineWidth', 2, 'Color', color);

%===================================================================
% Write and plot stress strain data (after converting to true sig-eps)
% (Use the data to determine Young's modulus)
%
function plotWriteSigEpsTrueE(dat, filename, facEps, facSig, E, ...
         fig1, fig2, color, edot, T, P)

  epsEx = dat(:,1)*facEps;
  seqEx = dat(:,2)*facSig;
  seqEx = seqEx.*(1.0 + epsEx);
  epsEx = log(1.0 + epsEx);
  E = seqEx(2)/epsEx(2)*1.0e6;
  epEx = epsEx - seqEx*1.0e6/E;
  fid = fopen(filename, 'w');
  for i=1:length(epEx)
   fprintf(fid, '%g %g %g %g %g %g\n', P, T, edot, ...
           epsEx(i), epEx(i), seqEx(i));
  end
  fclose(fid);

  figure(fig1);
  p1 = plot(epsEx, seqEx); hold on;
  set(p1, 'LineWidth', 2, 'Color', color);
  figure(fig2);
  p2 = plot(epEx, seqEx); hold on;
  set(p2, 'LineWidth', 2, 'Color', color);

