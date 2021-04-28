function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivoting
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix

% matrix
a = A;
[n,m] = size(a);
I = eye(n,m);
U = eye(n,m);

% if input is not a square matrix error
if n ~= m
    error('input is not a square matrix')
end

% pivoting
P = eye(n,m);
while n-1 >= 1
    a2 = a;
    if abs(a(n-1,1)) < abs(a(n,1))
        % matrix a
        a(n-1,:) = a(n,:);
        a(n,:) = a(n-1,:);
        % matrix P
        P(n,:) = P(n-1,:);
        P(n-1,:) = P(n,:);
    end
n = n-1;
end
% LU factorization

f21 = a(1,2)/a(1,1);
I(3,1) = f21;
U = [(a(1,:)*f21); a(2,:); a(3,:)];
U = [U(1,:); a(2,:)-U(1,:); U(3,:)];
L = I;

f31 = a(3,1)/a(1,1);
I(2,1) = f31;
U = [U(1,:)*f31; U(2,:); U(3,:)];
U = [U(1,:); U(2,:); U(3,:)-U(1,:)];
L = I;

f32 = U(3,2)/U(2,2)
I(3,2) = f32;
L = I;
U = [U(1,:); U(2,:)*f32; U(3,:)];
U = [U(1,:); U(2,:); U(3,:)-U(2,:)];

end
