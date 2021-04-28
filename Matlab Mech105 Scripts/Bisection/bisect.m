function [root,fx,ea,iter]=bisect(func,xl,xu,es,maxit,varargin)
% bisect: root location zeroes
% [root,fx,ea,iter]=bisect(func,xl,xu,es,maxit,p1,p2,...):
% uses bisection method to find the root of func
% input:
% func = name of function
% xl, xu = lower and upper guesses
% es = desired relative error (default = 0.0001%)
% maxit = maximum allowable iterations (default = 50)
% p1,p2,... = additional parameters used by func
% output:
% root = real root
% fx = function value at root
% ea = approximate relative error (%)
% iter = number of iterations
if nargin<3,error('at least 3 input arguments required'),end
test = func(xl,varargin{:})*func(xu,varargin{:});
if test>0,error('no sign change'),end
if nargin<4||isempty(es), es=.0001;end
if nargin<5||isempty(maxit), maxit=50;end
iter = 0; xr = xl; ea = 100;
while (1)
xrold = xr;
xr = (xl + xu)/2;
iter = iter + 1;
if xr ~= 0,ea = abs((xr - xrold)/xr) * 100;
end
fl = func(xl,varargin{:});
fu = func(xu,varargin{:});
fr = func(xr,varargin{:});
test = fl*fr;

% added output for each iteration
if(iter == 1)
    fprintf('i  x_l     f(x_l)   x_u    f(x_u)    x_r   f(x_r)  e_a \n');
end
fprintf('%d %5.5f %5.5f %5.5f %5.5f %5.5f %5.5f %2.2f\n', iter, xl, fl, xu, fu, xr, fr, abs(ea));

if test < 0
xu = xr;
elseif test > 0
xl = xr;
else
ea = 0;
end
if ea <= es || iter >= maxit,break,end
end
root = xr; fx = func(xr, varargin{:});
% %Code to call fct for drag coefficient equation
% m = 95; % [kg]
% g = 9.81; % [m/s^2]
% v = 46; % [m/s]
% T = 9; % [s]
% 
% % Define upper and lower guesses
% xu = 0.5;
% xl = 0.2;
% 
% % Define the function whose root we want to find
% f = @(c) sqrt(g*m/c)*tanh(sqrt(g*c/m)*T)-v;
% [drag, fx, ea, iter] = bisect(f,xl,xu, 2)

% % % Code to call for revesible chemical reaction
% K = 0.016;
% c_a0 = 42;
% c_b0 = 28;
% c_c0 = 4;
% % Define upper and lower guesses
% xu = 20;
% xl = 0;
% 
% f = @(x) (c_c0 + x)/((c_a0 - 2*x)^2*(c_b0 - x)) - K;
% [K,fx,ea,iter]=bisect(f,xl,xu,2)

% Code to call for polynomial bisection
%f = @(x) [insert fct here];
% [ans, fx, ea, iter] = bisect(f,xl,xu, 2)
%xl=
%xu=



      