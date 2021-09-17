function [sqrtR, iters] = sqrtApprox(R)
% sqrtApprox
%
% Implements a successive numeric approximation formula for determining 
% the square root of a single non-negative number R. The formula is:
%   x_n+1 = (1/2)(x_n + R/x_n)
% The initial guess, x_0, is R and the maximum number of iterations
% (calculations of new guesses) is capped at 20.
% 
% Input:
%   R  a single non-negative number whose square root is desired
%
% Output:
%   sqrtR  the value for the square root of R as determined using 
%          the successive numeric approximation given above
%   iters  the number of iterations it took to find the square root 
%          (note: the initial guess is not counted)
%
if R<0 %check if the input is negative
    error('sqrtApprox requires non-negative input');
end
if size(R)~=1 %check if the input is a scalar
    error('sqrtApprox requires scalar input');
end
x_0=R;%the initial guess is R
e= 10^(-15);%set the threshold to e
x_n=x_0;%the current guess is the initial guess
count=0;%count the number of iteration
while (abs(x_n^2-R)> e) && (count<20)
x_n1=0.5*(x_n+R/x_n);%use the given formula
x_n=x_n1;%set x_n1 to current guess and start the loop again
count=count+1;%count the iteration
end
%display the result
sqrtR=x_n;
iters=count;


