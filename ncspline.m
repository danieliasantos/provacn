%http://www.dms.uaf.edu/~bueler/ncspline.m
function yi = ncspline(t,y,xi)
% NCSPLINE  yi = ncspline(t,y,xi)
% Computes natural cubic spline through points
%              t = t(1),...,t(n+1)
%              y = y(1),...,y(n+1)
% and evaluates at the x-values in xi, to give result yi.   Requires
% t(1) < t(2) < ... < t(n+1) and xi in [t(1),t(n+1)].
%
% Finds cubic polynomials in this form:
%     S_i(x) = y_i + b_i (x - t_i) + c_i (x - t_i)^2 + d_i (x - t_i)^3
%
% Example:
%   >> x=0:3; y=exp(x); xp=0:0.01:3; ync = ncspline(x,y,xp)
%   >> plot(x,y,'o',xp,exp(xp),xp,ync)
%   >> legend('data','underlying function','natural cubic spline')
%
% Random monotonic example:
%   >> x=sort(rand(10,1)); x=[0; x; 1]; y=sort(randn(12,1));
%   >> xp=0:0.001:1; plot(x,y,'o',xp,ncspline(x,y,xp)), legend('data','spline')

t = t(:);  y = y(:);          % force t and y to be column vectors

% check that inputs make sense
if (length(t) ~= length(y)), error('inputs t,y must be vectors of same size'),  end
n = length(t) - 1;
if n <= 0, error('must give at least two points to produce spline'), end
if any(xi < t(1)) | any(xi > t(n+1))
  error('xi must be in interior (interval [t(1),t(n+1)])')
end

h = diff(t);                  % gaps:   h(i) = t(i+1) - t(i)
if any(h <= 0.0), error('t = t(i)  must be increasing and with positive gaps'), end

m = diff(y) ./ h;             % slopes: m(i) = (y(i+1) - y(i)) / h(i)

% set up and solve tridiagonal system for coeffs c_i, using sparse storage
A = sparse(n,n);
A(1,1) = 1;
for i=2:n-1
  A(i,i-1:i+1) = [h(i-1), 2*(h(i)+h(i-1)), h(i)];
end
A(n,n-1:n) = [h(n-1), 2*(h(n)+h(n-1))];
r = [0; 3 * diff(m)];
c = A \ r;                    % solves tridiagonal system efficiently

% interesting idea:  setting c to zero here would generate piecewise-linear:
%c = zeros(n,1);

% determine other coeffs from c:
d = diff([c; 0]) ./ (3 * h);
b = m - h .* (c + d .* h);

% uncomment this to view table of coefficients:
%[b c d]

% evaluate cubics; requires finding interval in which xi lies
xi = xi(:);
yi = zeros(size(xi));
for k = 1:length(xi)
  i = 1;
  while xi(k) > t(i+1)
    i = i + 1;
  end
  % now xi(k) is in [t(i),t(i+1)], so apply Horner to evaluate S_i(x):
  dx = xi(k) - t(i);
  yi(k) = y(i) + dx * (b(i) + dx * (c(i) + d(i) * dx));
end

