function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

n = length(x);
j = length(y);
rem = mod(n,2);

% errors
if nargin > 2
    error('too many input arguments')
end
if nargin < 2 
    error('not enough input arguments')
end
% check that vectors are same length
if n ~= j
    error('input vectors must be the same length')
end
% check for uniform x spacing
d = diff(x);
if (max(d) - min(d)) ~= 0
    error('x values must have uniform spacing')
end



% Simpson's 1/3
a = x(1);
b = x(n);
h = (x(2)-x(1));

yodd = y(3:2:(n-2));
fxi = sum(yodd);
yeven = y(2:2:(n-1));
fxj = sum(yeven);

simpsons = (h/3) * ((y(1) + (4*fxj) + (2*fxi) + y(n)));
trap = (x(n)-x(n-1)) * ((y(n)+y(n-1)) / 2);
    
if n == 3
    I = ((h/3) * ((y(1) + (4*fxj) + (2*fxi) + y(n))));  
elseif rem == 0
    warning('only trapezoidal rule was applied')
    if n == 2
        %warning('only trapezoidal rule was applied')
                I = (x(n)-x(1)) * ((y(2)+y(1)) / 2);
    else
        I = simpsons;
    end
warning('trapezoidal rule was applied for last interval')
elseif rem == 1
    %warning('trapezoidal rule was applied for last interval')
    I = simpsons + trap;
end
end

