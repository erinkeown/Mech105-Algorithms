function [base2] = binaryConverter(base10)
%binary A simple function to convert a base10 number to binary
%   Inputs:
%       base10 - A number in base10
%   Outputs:
%       base2 - The base10 number converted to binary
nbase = 2;
quotient = base10;
remainder = 0;

i = 1;
base2 = 0;
while quotient ~= 0
    remainder = mod(quotient, nbase);
    quotient = floor(quotient ./ nbase);
    base2(i) = remainder;
    i = i + 1;
end

base2 = flip(base2);

end