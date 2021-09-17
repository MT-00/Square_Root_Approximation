%% CS310 Spring 2019 Homework Assignment 2b
% * Name: Meng Tian
% * Team Lab: 302
% * Due Date: Friday, April 5 by 11:59 pm

clear
%set the initial value for all variables we need
sum=0;
max=0;
count1=0;
count2=0;
sumErr=0;
for i=1:5000
    [sqrtR,iter]=sqrtApprox(i);%Calculate the square root for each integer value from 1 to 5000
%calculate the percentage of times the sqrtApprox function took the maximum number of iterations to calculate its result   
%claculate the maximum percent error in the square root approximation for those values that result in the maximum number of iterations.     
if iter>=max 
        if max==iter %if the iterations of current i equals to max iteration
            count1=count1+1;%count the number of i that needs max iteration
            error=(abs(sqrtR-sqrt(i)))/i;%calculate the percent error for i that needs max iteration
            sumErr=sumErr+error;%calculate the sum of 
        else
            max=iter;
        end
end
end
X=['% requiring max iters: ',num2str(count1/5000*100)];
disp(X)
Y=['% max % error(for max iters):',num2str(sumErr)];
disp(Y)
%calculate the average number of iterations
for i=1:5000
    [sqrtR,iter]=sqrtApprox(i);
    if iter<max%since we already determined the max value above
    sum=sum+iter;%sum all the iter if it doesn't equal max
    count2=count2+1;%count the number if it'iters doesn't equal max
    end
end        
Z=['avg # iters (non-max):',num2str(sum/count2)];%calculate the average number of iterations
disp(Z)