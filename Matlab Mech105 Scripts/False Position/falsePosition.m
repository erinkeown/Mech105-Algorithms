function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
%inputs: func, xl, xu, es, maxit, varargin; 
%func = given function, xl = lower limit, xu = upper limit, es = max error, maxit = max iterations, varargin = any other arguments needed for function.

%error checking
if nargin < 3
    error('at least 3 arguments required')
end
test = func(xl,varargin{:}) * func(xu,varargin{:});
if test > 0
    error('no sign change')
end

%set defaults
if nargin < 4 || isempty(es)
    es = 0.0001;
end
if nargin < 5 || isempty(maxit)
    maxit = 50;
end

%set start values
iter = 0;
xr = xl;
ea = 100;

while (1)
%takes testFunc and plugs in variables
iter = iter + 1;
fxl = func(xl, varargin{:});
fxu = func(xu, varargin{:});
fxr = func(xr, varargin{:});
check = fxl * fxr;

%new xr
xrold = xr;
xr = xu - ((fxu * (xl - xu)) / (fxl - fxu));
fxr = func(xr, varargin{:});
if fxr == 0
    ea = 0
    break
end


%error
if xr ~= 0
    ea = abs((xr - xrold)/xr) * 100;
end
% replace xu or xl
if check > 0
    xl = xr;
elseif check < 0
    xu = xr;
else
    ea = 0;
end
if ea <= es || iter >= maxit
    break
end
end

root = xr; 
fx = func(xr, varargin{:});

%based off of sign, reassign variables. Assign xl or xu xr value depending on which one has the same sign as xr
end

