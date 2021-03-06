function calcTheta

  color = [[0.90 0.10 0.10];[0.10 0.90 0.10];[0.10 0.10 0.90];...
           [0.75 0.25 1.00];[1.00 0.75 0.25];[0.15 0.30 0.70];...
           [0.10 0.80 0.30];[0.25 0.75 1.00];[0.66 0.60 0.00];...
           [0.60 0.20 0.00];[0.60 0.72 0.00];[0.30 0.55 0.60];...
           [0 0 0]];
  marker = ['o', 's', 'd', ...
            'v', 'p', '^', ...
            'h', 'x', '<', ...
            '+', '>', '*', ...
            '.'];

  fig1 = figure;
  set(fig1,'Position',[182 280 1131 813]);

  fit = 0;
  load ThetaData/ThetaHoge.dat
  plotTheta(ThetaHoge, color(1,:), marker(1), fit);

  load ThetaData/ThetaOgawa.dat
  plotTheta(ThetaOgawa, color(2,:), marker(2), fit);

  load ThetaData/ThetaFish.dat
  plotTheta(ThetaFish, color(3,:), marker(3), fit);

  load ThetaData/ThetaCady.dat
  plotTheta(ThetaCady, color(4,:), marker(4), fit);

  load ThetaData/ThetaDavidson.dat
  plotTheta(ThetaDavidson, color(5,:), marker(5), fit);

  load ThetaData/ThetaGreen.dat
  plotTheta(ThetaGreen, color(6,:), marker(6), fit);

  %load ThetaData/ThetaASMH.dat
  %plotTheta(ThetaASMH, color(7,:), marker(7), fit);

  load ThetaData/ThetaLee.dat
  plotTheta(ThetaLee, color(8,:), marker(8), fit);

  load ThetaData/ThetaRosenberg.dat
  plotTheta(ThetaRosenberg, color(9,:), marker(9), fit);

  load ThetaData/ThetaYadav.dat
  plotTheta(ThetaYadav, color(10,:), marker(10), fit);

  load ThetaData/ThetaLesuer.dat
  plotTheta(ThetaLesuer, color(11,:), marker(11), fit);

  load ThetaData/ThetaRamesh.dat
  plotTheta(ThetaRamesh, color(12,:), marker(12), fit);

  fit = 1;
  ThetaAll = [...
      %ThetaHoge; ...
      ThetaOgawa; ...
      %ThetaFish; ...
      %ThetaCady; ...
      %ThetaDavidson; ...
      ThetaGreen; ...
      %ThetaASMH; ...
      %ThetaLee; ...
      %ThetaRosenberg; ...
      ThetaYadav; ...
      %ThetaLesuer; ...
      %ThetaRamesh ...
      ];
  plotTheta(ThetaAll, color(13,:), marker(13), fit);

  thetaEdot = sortrows(ThetaAll, 3);
  thetaT = sortrows(ThetaAll, 4);

  fid = fopen('./ThetaData/ThetavsTconstEdot.dat','w');
  for i=1:length(thetaEdot)
    fprintf(fid,'%g %g %g %g\n',thetaEdot(i,3), ...
            thetaEdot(i,1),thetaEdot(i,2),thetaEdot(i,4));
  end
  fclose(fid);

  fid = fopen('./ThetaData/ThetavsEdotconstT.dat','w');
  for i=1:length(thetaT)
    fprintf(fid,'%g %g %g %g\n',thetaT(i,4), ...
            thetaEdot(i,1),thetaEdot(i,2),thetaEdot(i,3));
  end
  fclose(fid);

%------------------------------------------------------------------
% Plot Theta as a function of T and edot and fit a 
% 2-D surface using different methods
%
function plotTheta(dat, color, marker, fit)

  %
  % The theta vs Fx data were fitted to straight lines
  % of the form
  %  theta = theta_0*(1- (sige/siges)^2) + theta_1
  %
  theta_0 = dat(:,1); 
  theta_1 = dat(:,2); 
  edot = dat(:,3);
  T0 = dat(:,4);

  %
  % Set up x, y, and z
  %
  x = log(edot);
  y = T0;
  z0 = theta_0;
  z1 = theta_1;

  %
  % Plot data
  %
  subplot(1,2,1);
  p1 = plot3(x, y, z0*1.0e-6, 'k.'); hold on;
  set(p1, 'Color', color, 'Marker', marker);
  set(p1, 'LineWidth', 2,  'MarkerSize', 8);
  xlabel('Strain Rate (/s)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('Temperature (K)', 'FontName', 'bookman', 'FontSize', 16);
  zlabel('\theta_0 (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);

  subplot(1,2,2);
  p1 = plot3(x, y, z1*1.0e-6, 'k.'); hold on;
  set(p1, 'Color', color, 'Marker', marker);
  set(p1, 'LineWidth', 2,  'MarkerSize', 8);
  xlabel('Strain Rate (/s)', 'FontName', 'bookman', 'FontSize', 16);
  ylabel('Temperature (K)', 'FontName', 'bookman', 'FontSize', 16);
  zlabel('\theta_1 (MPa) ', 'FontName', 'bookman', 'FontSize', 16);
  set(gca, 'LineWidth', 3, 'FontName', 'bookman', 'FontSize', 14);

  if (fit == 0)
    return;
  end

  %[xg, yg, zg0, zg1] = plotThetaGridFit(x, y, z0, z1);
  %[C_theta0, C_theta1] = plotThetaSqFit(x, y, z0, z1);
  %[C_theta0, C_theta1] = plotThetaPolyFit(x, y, z0, z1);
  [C_theta0, C_theta1] = plotThetaPoly4Fit(x, y, z0, z1);

  fidA = fopen('MTSParams.dat','a');
  fprintf(fidA, 'a_00 = %g\n', C_theta0(1));
  fprintf(fidA, 'a_10 = %g\n', C_theta0(2));
  fprintf(fidA, 'a_20 = %g\n', C_theta0(3));
  fprintf(fidA, 'a_30 = %g\n', C_theta0(4));
  fprintf(fidA, 'a_01 = %g\n', C_theta1(1));
  fprintf(fidA, 'a_11 = %g\n', C_theta1(2));
  fprintf(fidA, 'a_21 = %g\n', C_theta1(3));
  fprintf(fidA, 'a_31 = %g\n', C_theta1(4));
  fclose(fidA);

%------------------------------------------------------------------
% Plot Theta as a function of T and edot and fit a faceted
% 2-D surface using gridfit
%
function [xg, yg, zg0, zg1] = plotThetaGridFit(x, y, z0, z1)

  %
  % Set up xg and yg
  %
  nx = 5;
  xg = linspace(min(x),max(x),nx);
  yg = linspace(min(y),max(y),nx);
  zg0 = zeros(nx, nx);
  zg1 = zeros(nx, nx);

  %
  % Fit faceted surfaces for theta_0 and theta_1
  %
  zg0 = gridfit(x, y, z0, xg, yg, ...
               'smooth',5, ...
               'interp','nearest', ...
               'solver','normal', ...
               'regularizer','diffusion', ...
               'extend','warning', ...
               'tilesize',inf);

  zg1 = gridfit(x, y, z1, xg, yg, ...
               'smooth',5, ...
               'interp','nearest', ...
               'solver','normal', ...
               'regularizer','diffusion', ...
               'extend','warning', ...
               'tilesize',inf);

  % Plot the surfaces
  drawSurface(xg, yg, zg0, zg1);

%------------------------------------------------------------------
% Plot Theta as a function of T and edot and fit 2-D surface
%
function [C_theta0, C_theta1] = plotThetaPolyFit(x, y, z0, z1)

  %
  % Fit surfaces for theta_0 and theta_1
  %
  [C_theta0] = surfaceFitPoly(x, y, z0)
  [C_theta1] = surfaceFitPoly(x, y, z1)

  a00 = C_theta0(1); a10 = C_theta0(2); a20 = C_theta0(3); 
  a01 = C_theta1(1); a11 = C_theta1(2); a21 = C_theta1(3); 

  nx = 10;
  xg = linspace(min(x), max(x), nx);
  yg = linspace(min(y), max(y), nx);
  for i=1:nx
    for j=1:nx
      zg0(i,j) = a00 + a10*xg(i) + a20*yg(j);
      zg1(i,j) = a01 + a11*xg(i) + a21*yg(j);
    end
  end

  % Plot the surfaces
  drawSurface(xg, yg, zg0, zg1);


%------------------------------------------------------------------
% Plot Theta as a function of T and edot and fit 2-D surface
%
function [C_theta0, C_theta1] = plotThetaPoly4Fit(x, y, z0, z1)

  %
  % Fit surfaces for theta_0 and theta_1
  %
  [C_theta0] = surfaceFitPoly4(x, y, z0)
  [C_theta1] = surfaceFitPoly4(x, y, z1)

  a00 = C_theta0(1); a10 = C_theta0(2); a20 = C_theta0(3); a30 = C_theta0(4);
  a01 = C_theta1(1); a11 = C_theta1(2); a21 = C_theta1(3); a31 = C_theta1(4);

  nx = 10;
  xg = linspace(min(x), max(x), nx);
  yg = linspace(min(y), max(y), nx);
  for i=1:nx
    for j=1:nx
      zg0(i,j) = a00 + a10*xg(i) + a20*yg(j) + a30*xg(i)*yg(j);
      zg1(i,j) = a01 + a11*xg(i) + a21*yg(j) + a31*xg(i)*yg(j);
    end
  end

  % Plot the surfaces
  drawSurface(xg, yg, zg0, zg1);

  %
  % Error analysis
  %
  % Compute residuals
  %
  z_pred0 = a00 + a10*x + a20*y + a30*(x.*y);
  z_pred1 = a01 + a11*x + a21*y + a31*(x.*y);
  resid0 = z0 - z_pred0;
  resid1 = z1 - z_pred1;
  %
  %  Calculate R^2
  %
  dev0 = z0 - mean(z0);
  dev1 = z1 - mean(z1);
  SST0 = sum(dev0.^2);
  SST1 = sum(dev1.^2);
  SSE0 = sum(resid0.^2);
  SSE1 = sum(resid1.^2);
  Rsq0 = 1 - SSE0/SST0
  Rsq1 = 1 - SSE1/SST1
  %
  %  Calculate  f-statistic
  %
  dfr = 3;
  dfe = length(x) - 1 - dfr;
  SSR0 = SST0 - SSE0;
  SSR1 = SST1 - SSE1;
  MSE0 = SSE0/dfe;
  MSE1 = SSE1/dfe;
  MSR0 = SSR0/dfr;
  MSR1 = SSR1/dfr;
  f0 = MSR0/MSE0
  f1 = MSR1/MSE1
  [dfr dfe]
  %
  % Calculate standard error
  %
  err0 = sqrt(SSE0/(length(x)-dfr-1))
  err1 = sqrt(SSE1/(length(x)-dfr-1))


%------------------------------------------------------------------
% Plot Theta as a function of T and edot and fit 2-D surface
%   using Sqrt fit
%
function [C_theta0, C_theta1] = plotThetaSqFit(x, y, z0, z1)

  %
  % Fit and plot an explicit surface
  %
  [C_theta0] = surfaceFitSq(x, y, z0);
  [C_theta1] = surfaceFitSq(x, y, z1);

  %
  % Plot fitted surfaces
  %
  a00 = C_theta0(1); a10 = C_theta0(2); a20 = C_theta0(3); a30 = C_theta0(4);
  a01 = C_theta1(1); a11 = C_theta1(2); a21 = C_theta1(3); a31 = C_theta1(4);

  nx = 10;
  xg = linspace(min(x),max(x),nx);
  yg = linspace(min(y),max(y),nx);
  for i=1:nx
    for j=1:nx
      zg0(i,j) = a00 + a10*xg(i) + a20*xg(i)^2 + a30*yg(j);
      zg1(i,j) = a01 + a11*xg(i) + a21*xg(i)^2 + a31*yg(j);
    end
  end

  % Plot the surfaces
  drawSurface(xg, yg, zg0, zg1);

%--------------------------------------------
% Draw the surfaces
%
function drawSurface(xg, yg, zg0, zg1)

  % Plot the surfaces
  subplot(1,2,1);
  surf(xg, yg, zg0*1.0e-6);
  colormap(hot(256));
  camlight right;
  lighting phong;
  shading interp;
  axis tight;

  subplot(1,2,2);
  surf(xg, yg, zg1*1.0e-6);
  colormap(hot(256));
  camlight right;
  lighting phong;
  shading interp;
  axis tight;

%-------------------------------------------------------
% Fit a surface to the data of the form
%    theta = a0 + a1*log(edot) + a2*sqrt(log(edot)) + a3*T
% or z = a0 + a1*x + a2*sqrt(x) + a3*y
%
%  Assume that x = log(edot), y = T, z = theta
%
function [C] = surfaceFitSq(x, y, z)

  n = length(z);

  sqx = x.*x;

  b(1) = sum(z);
  A(1,1) = n;
  A(1,2) = sum(x);
  A(1,3) = sum(sqx);
  A(1,4) = sum(y);

  b(2) = sum(x.*z);
  A(2,1) = A(1,2);
  A(2,2) = sum(x.*x);
  A(2,3) = sum(x.*sqx);
  A(2,4) = sum(x.*y);

  b(3) = sum(sqx.*z);
  A(3,1) = A(1,3);
  A(3,2) = A(2,3);
  A(3,3) = sum(sqx.*sqx);
  A(3,4) = sum(sqx.*y);

  b(4) = sum(y.*z);
  A(4,1) = A(1,4);
  A(4,2) = A(2,4);
  A(4,3) = A(3,4);
  A(4,4) = sum(y.*y);

  C = A\b'

%-------------------------------------------------------
% Fit a surface to the data of the form
%   z = a0 + a1*x + a2*y
% Assume that x is a n x 1 vector
%             y is a n x 1 vector
%
function [C] = surfaceFitPoly(x, y, z)

  n = length(z);

  xx = x.*x;
  xy = x.*y;
  xz = x.*z;
  yy = y.*y;
  yz = y.*z;

  b(1) = sum(z);
  A(1,1) = n;
  A(1,2) = sum(x);
  A(1,3) = sum(y);

  b(2) = sum(xz);
  A(2,1) = A(1,2);
  A(2,2) = sum(xx);
  A(2,3) = sum(xy);

  b(3) = sum(yz);
  A(3,1) = A(1,3);
  A(3,2) = A(2,3);
  A(3,3) = sum(yy);

  C = A\b'

%-------------------------------------------------------
% Fit a surface to the data of the form
%   z = a0 + a1*x + a2*y + a3*x*y
% Assume that x is a n x 1 vector
%             y is a n x 1 vector
%             z is a n x 1 matrix
%
function [C] = surfaceFitPoly4(x, y, z)

  n = length(z);

  xx = x.*x;
  xy = x.*y;
  xz = x.*z;
  yy = y.*y;
  yz = y.*z;

  b(1) = sum(z);
  A(1,1) = n;
  A(1,2) = sum(x);
  A(1,3) = sum(y);
  A(1,4) = sum(xy);

  b(2) = sum(xz);
  A(2,1) = A(1,2);
  A(2,2) = sum(xx);
  A(2,3) = sum(xy);
  A(2,4) = sum(x.*xy);

  b(3) = sum(yz);
  A(3,1) = A(1,3);
  A(3,2) = A(2,3);
  A(3,3) = sum(yy);
  A(3,4) = sum(y.*xy);

  b(4) = sum(z.*xy);
  A(4,1) = A(1,4);
  A(4,2) = A(2,4);
  A(4,3) = A(3,4);
  A(4,4) = sum(xy.*xy);

  C = A\b'

%-------------------------------------------------------
% Fit a surface to the data of the form
%   z = a0 + a1*x + a2*y + a3*x*y
% Assume that xx is a n x 1 vector
%             yy is a n x 1 vector
%             zz is a n x n matrix
%
function [C] = surfaceFitPolyAlt(xxx, yyy, zzz)

  %
  % Convert into column vectors
  %
  count = 0;
  for i=1:length(xxx)
    for j=1:length(yyy)
      count = count+1;
      x(count) = xxx(i);
      y(count) = yyy(j);
      z(count) = zzz(i,j);
    end
  end

  n = length(z);

  xx = x.*x;
  xy = x.*y;
  xz = x.*z;
  yy = y.*y;
  yz = y.*z;

  b(1) = sum(z);
  A(1,1) = n;
  A(1,2) = sum(x);
  A(1,3) = sum(y);
  A(1,4) = sum(xy);

  b(2) = sum(xz);
  A(2,1) = A(1,2);
  A(2,2) = sum(xx);
  A(2,3) = sum(xy);
  A(2,4) = sum(x.*xy);

  b(3) = sum(yz);
  A(3,1) = A(1,3);
  A(3,2) = A(2,3);
  A(3,3) = sum(yy);
  A(3,4) = sum(y.*xy);

  b(4) = sum(z.*xz);
  A(4,1) = A(1,4);
  A(4,2) = A(2,4);
  A(4,3) = A(3,4);
  A(4,4) = sum(xy.*xy);

  C = A\b'

%-------------------------------------------------------
function [zgrid,xgrid,ygrid] = gridfit(x,y,z,xnodes,ynodes,varargin)
% gridfit: estimates a surface on a 2d grid, based on scattered data
%          Replicates are allowed. All methods extrapolate to the grid
%          boundaries. Gridfit uses a modified ridge estimator to
%          generate the surface, where the bias is toward smoothness.
%
%          Gridfit is not an interpolant. Its goal is a smooth surface
%          that approximates your data, but allows you to control the
%          amount of smoothing.
%
% usage #1: zgrid = gridfit(x,y,z,xnodes,ynodes);
% usage #2: [zgrid,xgrid,ygrid] = gridfit(x,y,z,xnodes,ynodes);
% usage #3: zgrid = gridfit(x,y,z,xnodes,ynodes,prop,val,prop,val,...);
%
% Arguments: (input)
%  x,y,z - vectors of equal lengths, containing arbitrary scattered data
%          The only constraint on x and y is they cannot ALL fall on a
%          single line in the x-y plane. Replicate points will be treated
%          in a least squares sense.
%
%          ANY points containing a NaN are ignored in the estimation
%
%  xnodes - vector defining the nodes in the grid in the independent
%          variable (x). xnodes need not be equally spaced. xnodes
%          must completely span the data. If they do not, then the
%          'extend' property is applied, adjusting the first and last
%          nodes to be extended as necessary. See below for a complete
%          description of the 'extend' property.
%
%          If xnodes is a scalar integer, then it specifies the number
%          of equally spaced nodes between the min and max of the data.
%
%  ynodes - vector defining the nodes in the grid in the independent
%          variable (y). ynodes need not be equally spaced.
%
%          If ynodes is a scalar integer, then it specifies the number
%          of equally spaced nodes between the min and max of the data.
%
%          Also see the extend property.
%
%  Additional arguments follow in the form of property/value pairs.
%  Valid properties are:
%    'smoothness', 'interp', 'regularizer', 'solver', 'maxiter'
%    'extend', 'tilesize', 'overlap'
%
%  Any UNAMBIGUOUS shortening (even down to a single letter) is
%  valid for property names. All properties have default values,
%  chosen (I hope) to give a reasonable result out of the box.
%
%   'smoothness' - scalar - determines the eventual smoothness of the
%          estimated surface. A larger value here means the surface
%          will be smoother. Smoothness must be a non-negative real
%          number.
%
%          Note: the problem is normalized in advance so that a
%          smoothness of 1 MAY generate reasonable results. If you
%          find the result is too smooth, then use a smaller value
%          for this parameter. Likewise, bumpy surfaces suggest use
%          of a larger value. (Sometimes, use of an iterative solver
%          with too small a limit on the maximum number of iterations
%          will result in non-convergence.)
%
%          DEFAULT: 1
%
%
%   'interp' - character, denotes the interpolation scheme used
%          to interpolate the data.
%
%          DEFAULT: 'triangle'
%
%          'bilinear' - use bilinear interpolation within the grid
%                     (also known as tensor product linear interpolation)
%
%          'triangle' - split each cell in the grid into a triangle,
%                     then linear interpolation inside each triangle
%
%          'nearest' - nearest neighbor interpolation. This will
%                     rarely be a good choice, but I included it
%                     as an option for completeness.
%
%
%   'regularizer' - character flag, denotes the regularization
%          paradignm to be used. There are currently three options.
%
%          DEFAULT: 'gradient'
%
%          'diffusion' or 'laplacian' - uses a finite difference
%              approximation to the Laplacian operator (i.e, del^2).
%
%              We can think of the surface as a plate, wherein the
%              bending rigidity of the plate is specified by the user
%              as a number relative to the importance of fidelity to
%              the data. A stiffer plate will result in a smoother
%              surface overall, but fit the data less well. I've
%              modeled a simple plate using the Laplacian, del^2. (A
%              projected enhancement is to do a better job with the
%              plate equations.)
%
%              We can also view the regularizer as a diffusion problem,
%              where the relative thermal conductivity is supplied.
%              Here interpolation is seen as a problem of finding the
%              steady temperature profile in an object, given a set of
%              points held at a fixed temperature. Extrapolation will
%              be linear. Both paradigms are appropriate for a Laplacian
%              regularizer.
%
%          'gradient' - attempts to ensure the gradient is as smooth
%              as possible everywhere. Its subtly different from the
%              'diffusion' option, in that here the directional
%              derivatives are biased to be smooth across cell
%              boundaries in the grid.
%
%              The gradient option uncouples the terms in the Laplacian.
%              Think of it as two coupled PDEs instead of one PDE. Why
%              are they different at all? The terms in the Laplacian
%              can balance each other.
%
%          'springs' - uses a spring model connecting nodes to each
%              other, as well as connecting data points to the nodes
%              in the grid. This choice will cause any extrapolation
%              to be as constant as possible.
%
%              Here the smoothing parameter is the relative stiffness
%              of the springs connecting the nodes to each other compared
%              to the stiffness of a spting connecting the lattice to
%              each data point. Since all springs have a rest length
%              (length at which the spring has zero potential energy)
%              of zero, any extrapolation will be minimized.
%
%          Note: I don't terribly like the 'springs' strategy.
%          It tends to drag the surface towards the mean of all
%          the data. Its been left in only because the paradigm
%          interests me.
%
%
%   'solver' - character flag - denotes the solver used for the
%          resulting linear system. Different solvers will have
%          different solution times depending upon the specific
%          problem to be solved. Up to a certain size grid, the
%          direct \ solver will often be speedy, until memory
%          swaps causes problems.
%
%          What solver should you use? Problems with a significant
%          amount of extrapolation should avoid lsqr. \ may be
%          best numerically for small smoothnesss parameters and
%          high extents of extrapolation.
%
%          Large numbers of points will slow down the direct
%          \, but when applied to the normal equations, \ can be
%          quite fast. Since the equations generated by these
%          methods will tend to be well conditioned, the normal
%          equations are not a bad choice of method to use. Beware
%          when a small smoothing parameter is used, since this will
%          make the equations less well conditioned.
%
%          DEFAULT: 'normal'
%
%          '\' - uses matlab's backslash operator to solve the sparse
%                     system. 'backslash' is an alternate name.
%
%          'symmlq' - uses matlab's iterative symmlq solver
%
%          'lsqr' - uses matlab's iterative lsqr solver
%
%          'normal' - uses \ to solve the normal equations.
%
%
%   'maxiter' - only applies to iterative solvers - defines the
%          maximum number of iterations for an iterative solver
%
%          DEFAULT: min(10000,length(xnodes)*length(ynodes))
%
%
%   'extend' - character flag - controls whether the first and last
%          nodes in each dimension are allowed to be adjusted to
%          bound the data, and whether the user will be warned if
%          this was deemed necessary to happen.
%
%          DEFAULT: 'warning'
%
%          'warning' - Adjust the first and/or last node in
%                     x or y if the nodes do not FULLY contain
%                     the data. Issue a warning message to this
%                     effect, telling the amount of adjustment
%                     applied.
%
%          'never'  - Issue an error message when the nodes do
%                     not absolutely contain the data.
%
%          'always' - automatically adjust the first and last
%                     nodes in each dimension if necessary.
%                     No warning is given when this option is set.
%
%
%   'tilesize' - grids which are simply too large to solve for
%          in one single estimation step can be built as a set
%          of tiles. For example, a 1000x1000 grid will require
%          the estimation of 1e6 unknowns. This is likely to
%          require more memory (and time) than you have available.
%          But if your data is dense enough, then you can model
%          it locally using smaller tiles of the grid.
%
%          My recommendation for a reasonable tilesize is
%          roughly 100 to 200. Tiles of this size take only
%          a few seconds to solve normally, so the entire grid
%          can be modeled in a finite amount of time. The minimum
%          tilesize can never be less than 3, although even this
%          size tile is so small as to be ridiculous.
%
%          If your data is so sparse than some tiles contain
%          insufficient data to model, then those tiles will
%          be left as NaNs.
%
%          DEFAULT: inf
%
%
%   'overlap' - Tiles in a grid have some overlap, so they
%          can minimize any problems along the edge of a tile.
%          In this overlapped region, the grid is built using a
%          bi-linear combination of the overlapping tiles.
%
%          The overlap is specified as a fraction of the tile
%          size, so an overlap of 0.20 means there will be a 20%
%          overlap of successive tiles. I do allow a zero overlap,
%          but it must be no more than 1/2.
%
%          0 <= overlap <= 0.5
%
%          Overlap is ignored if the tilesize is greater than the
%          number of nodes in both directions.
%
%          DEFAULT: 0.20
%
%
%   'autoscale' - Some data may have widely different scales on
%          the respective x and y axes. If this happens, then
%          the regularization may experience difficulties. 
%          
%          autoscale = 'on' will cause gridfit to scale the x
%          and y node intervals to a unit length. This should
%          improve the regularization procedure. The scaling is
%          purely internal. 
%
%          autoscale = 'off' will disable automatic scaling
%
%          DEFAULT: 'on'
%
%
% Arguments: (output)
%  zgrid   - (nx,ny) array containing the fitted surface
%
%  xgrid, ygrid - as returned by meshgrid(xnodes,ynodes)
%
%
% Speed considerations:
%  Remember that gridfit must solve a LARGE system of linear
%  equations. There will be as many unknowns as the total
%  number of nodes in the final lattice. While these equations
%  may be sparse, solving a system of 10000 equations may take
%  a second or so. Very large problems may benefit from the
%  iterative solvers or from tiling.
%
%
% Example usage:
%
%  x = rand(100,1);
%  y = rand(100,1);
%  z = exp(x+2*y);
%  xnodes = 0:.1:1;
%  ynodes = 0:.1:1;
%
%  g = gridfit(x,y,z,xnodes,ynodes);
%
% Note: this is equivalent to the following call:
%
%  g = gridfit(x,y,z,xnodes,ynodes, ...
%              'smooth',1, ...
%              'interp','triangle', ...
%              'solver','normal', ...
%              'regularizer','gradient', ...
%              'extend','warning', ...
%              'tilesize',inf);
%
%
% Author: John D'Errico
% e-mail address: woodchips@rochester.rr.com
% Release: 2.0
% Release date: 5/23/06

% set defaults
params.smoothness = 1;
params.interp = 'triangle';
params.regularizer = 'gradient';
params.solver = 'normal';
params.maxiter = [];
params.extend = 'warning';
params.tilesize = inf;
params.overlap = 0.20;
params.mask = []; 
params.autoscale = 'on';
params.xscale = 1;
params.yscale = 1;

% was the params struct supplied?
if ~isempty(varargin)
  if isstruct(varargin{1})
    % params is only supplied if its a call from tiled_gridfit
    params = varargin{1};
    if length(varargin)>1
      % check for any overrides
      params = parse_pv_pairs(params,varargin{2:end});
    end
  else
    % check for any overrides of the defaults
    params = parse_pv_pairs(params,varargin);

  end
end

% check the parameters for acceptability
params = check_params(params);

% ensure all of x,y,z,xnodes,ynodes are column vectors,
% also drop any NaN data
x=x(:);
y=y(:);
z=z(:);
k = isnan(x) | isnan(y) | isnan(z);
if any(k)
  x(k)=[];
  y(k)=[];
  z(k)=[];
end
xmin = min(x);
xmax = max(x);
ymin = min(y);
ymax = max(y);

% did they supply a scalar for the nodes?
if length(xnodes)==1
  xnodes = linspace(xmin,xmax,xnodes)';
  xnodes(end) = xmax; % make sure it hits the max
end
if length(ynodes)==1
  ynodes = linspace(ymin,ymax,ynodes)';
  ynodes(end) = ymax; % make sure it hits the max
end

xnodes=xnodes(:);
ynodes=ynodes(:);
dx = diff(xnodes);
dy = diff(ynodes);
nx = length(xnodes);
ny = length(ynodes);
ngrid = nx*ny;

% set the scaling if autoscale was on
if strcmpi(params.autoscale,'on')
  params.xscale = mean(dx);
  params.yscale = mean(dy);
  params.autoscale = 'off';
end

% check to see if any tiling is necessary
if (params.tilesize < max(nx,ny))
  % split it into smaller tiles. compute zgrid and ygrid
  % at the very end if requested
  zgrid = tiled_gridfit(x,y,z,xnodes,ynodes,params);
else
  % its a single tile.
  
  % mask must be either an empty array, or a boolean
  % aray of the same size as the final grid.
  nmask = size(params.mask);
  if ~isempty(params.mask) && ((nmask(2)~=nx) || (nmask(1)~=ny))
    if ((nmask(2)==ny) || (nmask(1)==nx))
      error 'Mask array is probably transposed from proper orientation.'
    else
      error 'Mask array must be the same size as the final grid.'
    end
  end
  if ~isempty(params.mask)
    params.maskflag = 1;
  else
    params.maskflag = 0;
  end

  % default for maxiter?
  if isempty(params.maxiter)
    params.maxiter = min(10000,nx*ny);
  end

  % check lengths of the data
  n = length(x);
  if (length(y)~=n) || (length(z)~=n)
    error 'Data vectors are incompatible in size.'
  end
  if n<3
    error 'Insufficient data for surface estimation.'
  end

  % verify the nodes are distinct
  if any(diff(xnodes)<=0) || any(diff(ynodes)<=0)
    error 'xnodes and ynodes must be monotone increasing'
  end

  % do we need to tweak the first or last node in x or y?
  if xmin<xnodes(1)
    switch params.extend
      case 'always'
        xnodes(1) = xmin;
      case 'warning'
        warning(['xnodes(1) was decreased by: ',num2str(xnodes(1)-xmin),', new node = ',num2str(xmin)])
        xnodes(1) = xmin;
      case 'never'
        error(['Some x (',num2str(xmin),') falls below xnodes(1) by: ',num2str(xnodes(1)-xmin)])
    end
  end
  if xmax>xnodes(end)
    switch params.extend
      case 'always'
        xnodes(end) = xmax;
      case 'warning'
        warning(['xnodes(end) was increased by: ',num2str(xmax-xnodes(end)),', new node = ',num2str(xmax)])
        xnodes(end) = xmax;
      case 'never'
        error(['Some x (',num2str(xmax),') falls above xnodes(end) by: ',num2str(xmax-xnodes(end))])
    end
  end
  if ymin<ynodes(1)
    switch params.extend
      case 'always'
        ynodes(1) = ymin;
      case 'warning'
        warning(['ynodes(1) was decreased by: ',num2str(ynodes(1)-ymin),', new node = ',num2str(ymin)])
        ynodes(1) = ymin;
      case 'never'
        error(['Some y (',num2str(ymin),') falls below ynodes(1) by: ',num2str(ynodes(1)-ymin)])
    end
  end
  if ymax>ynodes(end)
    switch params.extend
      case 'always'
        ynodes(end) = ymax;
      case 'warning'
        warning(['ynodes(end) was increased by: ',num2str(ymax-ynodes(end)),', new node = ',num2str(ymax)])
        ynodes(end) = ymax;
      case 'never'
        error(['Some y (',num2str(ymax),') falls above ynodes(end) by: ',num2str(ymax-ynodes(end))])
    end
  end

  % determine which cell in the array each point lies in
  [junk,indx] = histc(x,xnodes); %#ok
  [junk,indy] = histc(y,ynodes); %#ok
  % any point falling at the last node is taken to be
  % inside the last cell in x or y.
  k=(indx==nx);
  indx(k)=indx(k)-1;
  k=(indy==ny);
  indy(k)=indy(k)-1;
  ind = indy + ny*(indx-1);

  % Do we have a mask to apply?
  if params.maskflag
    % if we do, then we need to ensure that every
    % cell with at least one data point also has at
    % least all of its corners unmasked.
    params.mask(ind) = 1;
    params.mask(ind+1) = 1;
    params.mask(ind+ny) = 1;
    params.mask(ind+ny+1) = 1;
  end

  % interpolation equations for each point
  tx = min(1,max(0,(x - xnodes(indx))./dx(indx)));
  ty = min(1,max(0,(y - ynodes(indy))./dy(indy)));
  % Future enhancement: add cubic interpolant
  switch params.interp
    case 'triangle'
      % linear interpolation inside each triangle
      k = (tx > ty);
      L = ones(n,1);
      L(k) = ny;

      t1 = min(tx,ty);
      t2 = max(tx,ty);
      A = sparse(repmat((1:n)',1,3),[ind,ind+ny+1,ind+L], ...
        [1-t2,t1,t2-t1],n,ngrid);

    case 'nearest'
      % nearest neighbor interpolation in a cell
      k = round(1-ty) + round(1-tx)*ny;
      A = sparse((1:n)',ind+k,ones(n,1),n,ngrid);

    case 'bilinear'
      % bilinear interpolation in a cell
      A = sparse(repmat((1:n)',1,4),[ind,ind+1,ind+ny,ind+ny+1], ...
        [(1-tx).*(1-ty), (1-tx).*ty, tx.*(1-ty), tx.*ty], ...
        n,ngrid);

  end
  rhs = z;

  % Build regularizer. Add del^4 regularizer one day.
  switch params.regularizer
    case 'springs'
      % zero "rest length" springs
      [i,j] = meshgrid(1:nx,1:(ny-1));
      ind = j(:) + ny*(i(:)-1);
      m = nx*(ny-1);
      stiffness = 1./(dy/params.yscale);
      Areg = sparse(repmat((1:m)',1,2),[ind,ind+1], ...
        stiffness(j(:))*[-1 1],m,ngrid);

      [i,j] = meshgrid(1:(nx-1),1:ny);
      ind = j(:) + ny*(i(:)-1);
      m = (nx-1)*ny;
      stiffness = 1./(dx/params.xscale);
      Areg = [Areg;sparse(repmat((1:m)',1,2),[ind,ind+ny], ...
        stiffness(i(:))*[-1 1],m,ngrid)];

      [i,j] = meshgrid(1:(nx-1),1:(ny-1));
      ind = j(:) + ny*(i(:)-1);
      m = (nx-1)*(ny-1);
      stiffness = 1./sqrt((dx(i(:))/params.xscale).^2 + ...
        (dy(j(:))/params.yscale).^2);
      
      Areg = [Areg;sparse(repmat((1:m)',1,2),[ind,ind+ny+1], ...
        stiffness*[-1 1],m,ngrid)];

      Areg = [Areg;sparse(repmat((1:m)',1,2),[ind+1,ind+ny], ...
        stiffness*[-1 1],m,ngrid)];

    case {'diffusion' 'laplacian'}
      % thermal diffusion using Laplacian (del^2)
      [i,j] = meshgrid(1:nx,2:(ny-1));
      ind = j(:) + ny*(i(:)-1);
      dy1 = dy(j(:)-1)/params.yscale;
      dy2 = dy(j(:))/params.yscale;

      Areg = sparse(repmat(ind,1,3),[ind-1,ind,ind+1], ...
        [-2./(dy1.*(dy1+dy2)), 2./(dy1.*dy2), ...
        -2./(dy2.*(dy1+dy2))],ngrid,ngrid);

      [i,j] = meshgrid(2:(nx-1),1:ny);
      ind = j(:) + ny*(i(:)-1);
      dx1 = dx(i(:)-1)/params.xscale;
      dx2 = dx(i(:))/params.xscale;

      Areg = Areg + sparse(repmat(ind,1,3),[ind-ny,ind,ind+ny], ...
        [-2./(dx1.*(dx1+dx2)), 2./(dx1.*dx2), ...
        -2./(dx2.*(dx1+dx2))],ngrid,ngrid);

    case 'gradient'
      % Subtly different from the Laplacian. A point for future
      % enhancement is to do it better for the triangle interpolation
      % case.
      [i,j] = meshgrid(1:nx,2:(ny-1));
      ind = j(:) + ny*(i(:)-1);
      dy1 = dy(j(:)-1)/params.yscale;
      dy2 = dy(j(:))/params.yscale;

      Areg = sparse(repmat(ind,1,3),[ind-1,ind,ind+1], ...
        [-2./(dy1.*(dy1+dy2)), 2./(dy1.*dy2), ...
        -2./(dy2.*(dy1+dy2))],ngrid,ngrid);

      [i,j] = meshgrid(2:(nx-1),1:ny);
      ind = j(:) + ny*(i(:)-1);
      dx1 = dx(i(:)-1)/params.xscale;
      dx2 = dx(i(:))/params.xscale;

      Areg = [Areg;sparse(repmat(ind,1,3),[ind-ny,ind,ind+ny], ...
        [-2./(dx1.*(dx1+dx2)), 2./(dx1.*dx2), ...
        -2./(dx2.*(dx1+dx2))],ngrid,ngrid)];

  end
  nreg = size(Areg,1);

  % Append the regularizer to the interpolation equations,
  % scaling the problem first. Use the 1-norm for speed.
  NA = norm(A,1);
  NR = norm(Areg,1);
  A = [A;Areg*(params.smoothness*NA/NR)];
  rhs = [rhs;zeros(nreg,1)];
  % do we have a mask to apply?
  if params.maskflag
    unmasked = find(params.mask);
  end
  % solve the full system, with regularizer attached
  switch params.solver
    case {'\' 'backslash'}
      if params.maskflag
        % there is a mask to use
        % permute for minimum fill in for R (in the QR)
        p = colamd(A(:,unmasked));
        zgrid=nan(ny,nx);
        zgrid(unmasked(p)) = A(:,unmasked(p))\rhs;
      else
        % permute for minimum fill in for R (in the QR)
        p = colamd(A);
        zgrid=zeros(ny,nx);
        zgrid(p) = A(:,p)\rhs;
      end

    case 'normal'
      % The normal equations, solved with \. Can be fast
      % for huge numbers of data points.
      if params.maskflag
        % there is a mask to use
        % Permute for minimum fill-in for \ (in chol)
        APA = A(:,unmasked)'*A(:,unmasked);
        p = symamd(APA);
        zgrid=nan(ny,nx);
        zgrid(unmasked(p)) = APA(p,p)\(A(:,unmasked(p))'*rhs);
      else
        % Permute for minimum fill-in for \ (in chol)
        APA = A'*A;
        p = symamd(APA);
        zgrid=zeros(ny,nx);
        zgrid(p) = APA(p,p)\(A(:,p)'*rhs);
      end

    case 'symmlq'
      % iterative solver - symmlq - requires a symmetric matrix,
      % so use it to solve the normal equations. No preconditioner.
      tol = abs(max(z)-min(z))*1.e-13;
      if params.maskflag
        % there is a mask to use
        zgrid=nan(ny,nx);
        [zgrid(unmasked),flag] = symmlq(A(:,unmasked)'*A(:,unmasked), ...
          A(:,unmasked)'*rhs,tol,params.maxiter);
      else
        [zgrid,flag] = symmlq(A'*A,A'*rhs,tol,params.maxiter);
        zgrid = reshape(zgrid,ny,nx);
      end
      % display a warning if convergence problems
      switch flag
        case 0
          % no problems with convergence
        case 1
          % SYMMLQ iterated MAXIT times but did not converge.
          warning(['Symmlq performed ',num2str(params.maxiter), ...
            ' iterations but did not converge.'])
        case 3
          % SYMMLQ stagnated, successive iterates were the same
          warning 'Symmlq stagnated without apparent convergence.'
        otherwise
          warning(['One of the scalar quantities calculated in',...
            ' symmlq was too small or too large to continue computing.'])
      end

    case 'lsqr'
      % iterative solver - lsqr. No preconditioner here.
      tol = abs(max(z)-min(z))*1.e-13;
      if params.maskflag
        % there is a mask to use
        zgrid=nan(ny,nx);
        [zgrid(unmasked),flag] = lsqr(A(:,unmasked),rhs,tol,params.maxiter);
      else
        [zgrid,flag] = lsqr(A,rhs,tol,params.maxiter);
        zgrid = reshape(zgrid,ny,nx);
      end

      % display a warning if convergence problems
      switch flag
        case 0
          % no problems with convergence
        case 1
          % lsqr iterated MAXIT times but did not converge.
          warning(['Lsqr performed ',num2str(params.maxiter), ...
            ' iterations but did not converge.'])
        case 3
          % lsqr stagnated, successive iterates were the same
          warning 'Lsqr stagnated without apparent convergence.'
        case 4
          warning(['One of the scalar quantities calculated in',...
            ' LSQR was too small or too large to continue computing.'])
      end

  end

end  % if params.tilesize...

% only generate xgrid and ygrid if requested.
if nargout>1
  [xgrid,ygrid]=meshgrid(xnodes,ynodes);
end

% ============================================
% End of main function - gridfit
% ============================================

% ============================================
% subfunction - parse_pv_pairs
% ============================================
function params=parse_pv_pairs(params,pv_pairs)
% parse_pv_pairs: parses sets of property value pairs, allows defaults
% usage: params=parse_pv_pairs(default_params,pv_pairs)
%
% arguments: (input)
%  default_params - structure, with one field for every potential
%             property/value pair. Each field will contain the default
%             value for that property. If no default is supplied for a
%             given property, then that field must be empty.
%
%  pv_array - cell array of property/value pairs.
%             Case is ignored when comparing properties to the list
%             of field names. Also, any unambiguous shortening of a
%             field/property name is allowed.
%
% arguments: (output)
%  params   - parameter struct that reflects any updated property/value
%             pairs in the pv_array.
%
% Example usage:
% First, set default values for the parameters. Assume we
% have four parameters that we wish to use optionally in
% the function examplefun.
%
%  - 'viscosity', which will have a default value of 1
%  - 'volume', which will default to 1
%  - 'pie' - which will have default value 3.141592653589793
%  - 'description' - a text field, left empty by default
%
% The first argument to examplefun is one which will always be
% supplied.
%
%   function examplefun(dummyarg1,varargin)
%   params.Viscosity = 1;
%   params.Volume = 1;
%   params.Pie = 3.141592653589793
%
%   params.Description = '';
%   params=parse_pv_pairs(params,varargin);
%   params
%
% Use examplefun, overriding the defaults for 'pie', 'viscosity'
% and 'description'. The 'volume' parameter is left at its default.
%
%   examplefun(rand(10),'vis',10,'pie',3,'Description','Hello world')
%
% params = 
%     Viscosity: 10
%        Volume: 1
%           Pie: 3
%   Description: 'Hello world'
%
% Note that capitalization was ignored, and the property 'viscosity'
% was truncated as supplied. Also note that the order the pairs were
% supplied was arbitrary.

npv = length(pv_pairs);
n = npv/2;

if n~=floor(n)
  error 'Property/value pairs must come in PAIRS.'
end
if n<=0
  % just return the defaults
  return
end

if ~isstruct(params)
  error 'No structure for defaults was supplied'
end

% there was at least one pv pair. process any supplied
propnames = fieldnames(params);
lpropnames = lower(propnames);
for i=1:n
  p_i = lower(pv_pairs{2*i-1});
  v_i = pv_pairs{2*i};
  
  ind = strmatch(p_i,lpropnames,'exact');
  if isempty(ind)
    ind = find(strncmp(p_i,lpropnames,length(p_i)));
    if isempty(ind)
      error(['No matching property found for: ',pv_pairs{2*i-1}])
    elseif length(ind)>1
      error(['Ambiguous property name: ',pv_pairs{2*i-1}])
    end
  end
  p_i = propnames{ind};
  
  % override the corresponding default in params
  params = setfield(params,p_i,v_i); %#ok
  
end


% ============================================
% subfunction - check_params
% ============================================
function params = check_params(params)

% check the parameters for acceptability
% smoothness == 1 by default
if isempty(params.smoothness)
  params.smoothness = 1;
else
  if (length(params.smoothness)>1) || (params.smoothness<=0)
    error 'Smoothness must be scalar, real, finite, and positive.'
  end
end

% regularizer  - must be one of 4 options - the second and
% third are actually synonyms.
valid = {'springs', 'diffusion', 'laplacian', 'gradient'};
if isempty(params.regularizer)
  params.regularizer = 'diffusion';
end
ind = find(strncmpi(params.regularizer,valid,length(params.regularizer)));
if (length(ind)==1)
  params.regularizer = valid{ind};
else
  error(['Invalid regularization method: ',params.regularizer])
end

% interp must be one of:
%    'bilinear', 'nearest', or 'triangle'
% but accept any shortening thereof.
valid = {'bilinear', 'nearest', 'triangle'};
if isempty(params.interp)
  params.interp = 'triangle';
end
ind = find(strncmpi(params.interp,valid,length(params.interp)));
if (length(ind)==1)
  params.interp = valid{ind};
else
  error(['Invalid interpolation method: ',params.interp])
end

% solver must be one of:
%    'backslash', '\', 'symmlq', 'lsqr', or 'normal'
% but accept any shortening thereof.
valid = {'backslash', '\', 'symmlq', 'lsqr', 'normal'};
if isempty(params.solver)
  params.solver = '\';
end
ind = find(strncmpi(params.solver,valid,length(params.solver)));
if (length(ind)==1)
  params.solver = valid{ind};
else
  error(['Invalid solver option: ',params.solver])
end

% extend must be one of:
%    'never', 'warning', 'always'
% but accept any shortening thereof.
valid = {'never', 'warning', 'always'};
if isempty(params.extend)
  params.extend = 'warning';
end
ind = find(strncmpi(params.extend,valid,length(params.extend)));
if (length(ind)==1)
  params.extend = valid{ind};
else
  error(['Invalid extend option: ',params.extend])
end

% tilesize == inf by default
if isempty(params.tilesize)
  params.tilesize = inf;
elseif (length(params.tilesize)>1) || (params.tilesize<3)
  error 'Tilesize must be scalar and > 0.'
end

% overlap == 0.20 by default
if isempty(params.overlap)
  params.overlap = 0.20;
elseif (length(params.overlap)>1) || (params.overlap<0) || (params.overlap>0.5)
  error 'Overlap must be scalar and 0 < overlap < 1.'
end

% ============================================
% subfunction - tiled_gridfit
% ============================================
function zgrid=tiled_gridfit(x,y,z,xnodes,ynodes,params)
% tiled_gridfit: a tiled version of gridfit, continuous across tile boundaries 
% usage: [zgrid,xgrid,ygrid]=tiled_gridfit(x,y,z,xnodes,ynodes,params)
%
% Tiled_gridfit is used when the total grid is far too large
% to model using a single call to gridfit. While gridfit may take
% only a second or so to build a 100x100 grid, a 2000x2000 grid
% will probably not run at all due to memory problems.
%
% Tiles in the grid with insufficient data (<4 points) will be
% filled with NaNs. Avoid use of too small tiles, especially
% if your data has holes in it that may encompass an entire tile.
%
% A mask may also be applied, in which case tiled_gridfit will
% subdivide the mask into tiles. Note that any boolean mask
% provided is assumed to be the size of the complete grid.
%
% Tiled_gridfit may not be fast on huge grids, but it should run
% as long as you use a reasonable tilesize. 8-)

% Note that we have already verified all parameters in check_params

% Matrix elements in a square tile
tilesize = params.tilesize;
% Size of overlap in terms of matrix elements. Overlaps
% of purely zero cause problems, so force at least two
% elements to overlap.
overlap = max(2,floor(tilesize*params.overlap));

% reset the tilesize for each particular tile to be inf, so
% we will never see a recursive call to tiled_gridfit
Tparams = params;
Tparams.tilesize = inf;

nx = length(xnodes);
ny = length(ynodes);
zgrid = zeros(ny,nx);

% linear ramp for the bilinear interpolation
rampfun = inline('(t-t(1))/(t(end)-t(1))','t');

% loop over each tile in the grid
h = waitbar(0,'Relax and have a cup of JAVA. Its my treat.');
warncount = 0;
xtind = 1:min(nx,tilesize);
while ~isempty(xtind) && (xtind(1)<=nx)
  
  xinterp = ones(1,length(xtind));
  if (xtind(1) ~= 1)
    xinterp(1:overlap) = rampfun(xnodes(xtind(1:overlap)));
  end
  if (xtind(end) ~= nx)
    xinterp((end-overlap+1):end) = 1-rampfun(xnodes(xtind((end-overlap+1):end)));
  end
  
  ytind = 1:min(ny,tilesize);
  while ~isempty(ytind) && (ytind(1)<=ny)
    % update the waitbar
    waitbar((xtind(end)-tilesize)/nx + tilesize*ytind(end)/ny/nx)
    
    yinterp = ones(length(ytind),1);
    if (ytind(1) ~= 1)
      yinterp(1:overlap) = rampfun(ynodes(ytind(1:overlap)));
    end
    if (ytind(end) ~= ny)
      yinterp((end-overlap+1):end) = 1-rampfun(ynodes(ytind((end-overlap+1):end)));
    end
    
    % was a mask supplied?
    if ~isempty(params.mask)
      submask = params.mask(ytind,xtind);
      Tparams.mask = submask;
    end
    
    % extract data that lies in this grid tile
    k = (x>=xnodes(xtind(1))) & (x<=xnodes(xtind(end))) & ...
        (y>=ynodes(ytind(1))) & (y<=ynodes(ytind(end)));
    k = find(k);
    
    if length(k)<4
      if warncount == 0
        warning 'A tile was too underpopulated to model. Filled with NaNs.'
      end
      warncount = warncount + 1;
      
      % fill this part of the grid with NaNs
      zgrid(ytind,xtind) = NaN;
      
    else
      % build this tile
      zgtile = gridfit(x(k),y(k),z(k),xnodes(xtind),ynodes(ytind),Tparams);
      
      % bilinear interpolation (using an outer product)
      interp_coef = yinterp*xinterp;
      
      % accumulate the tile into the complete grid
      zgrid(ytind,xtind) = zgrid(ytind,xtind) + zgtile.*interp_coef;
      
    end
    
    % step to the next tile in y
    if ytind(end)<ny
      ytind = ytind + tilesize - overlap;
      % are we within overlap elements of the edge of the grid?
      if (ytind(end)+max(3,overlap))>=ny
        % extend this tile to the edge
        ytind = ytind(1):ny;
      end
    else
      ytind = ny+1;
    end
    
  end % while loop over y
  
  % step to the next tile in x
  if xtind(end)<nx
    xtind = xtind + tilesize - overlap;
    % are we within overlap elements of the edge of the grid?
    if (xtind(end)+max(3,overlap))>=nx
      % extend this tile to the edge
      xtind = xtind(1):nx;
    end
  else
    xtind = nx+1;
  end

end % while loop over x

% close down the waitbar
close(h)

if warncount>0
  warning([num2str(warncount),' tiles were underpopulated & filled with NaNs'])
end




