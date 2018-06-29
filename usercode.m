%%  1
 
clear all
clc
 
data = load('1.txt');
x = data(:,1)';
y = data(:,2)';
 
plot(x,y)
 
 
% testFx = b(4)*((b(3)*(1-((x-b(2))/b(1)).^2)-2*(x-b(2))/b(1))/((1+((x-b(2))/b(1)).^5).^2))
 
% testFy = (-b(3)*(1-((x+b(2))/b(1)).^2)-2*(x+b(2))/b(1))/((1+((x+b(2))/b(1)).^2).^2)
 
 
fun = @(b,x)(b(4)*((b(3)*(1-((x-b(2))/b(1)).^2)-2*(x-b(2))/b(1))/((1+((x-b(2))/b(1)).^5).^2))+...
    (-b(3)*(1-((x+b(2))/b(1)).^2)-2*(x+b(2))/b(1))/((1+((x+b(2))/b(1)).^2).^2));
 
% b4 alfi ; b3 Amplify ; b2 Hres ;  b1 Width
 

 
 

 
 
b0 = [2 3511 1 60];  %初始值
 
lb = [1 3450 -100 0];
 
ub = [400 3600 200 10];
 

 
 
b = lsqcurvefit(fun,b0,x,y,lb,ub);
 

 
 

 
 
y1 = b(4)*((b(3)*(1-((x-b(2))/b(1)).^2)-2*(x-b(2))/b(1))/((1+((x-b(2))/b(1)).^2).^2)+(-b(3)*(1-((x+b(2))/b(1)).^2)-2*(x+b(2))/b(1))/((1+((x+b(2))/b(1)).^2).^2));
 
plot(x,y,':',x,fun(b,x),'r',x,y1,'k')
 
xlabel('x'),ylabel('y')
 
legend('data','fit','Dyson')
 
title('Dyson')
