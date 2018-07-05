
clear all
clc
data = load('C:\Users\Wangbin\Desktop\1.txt');
x = data(:,1);
y = data(:,2);
plot(x,y)

y = (x-A(2))/A(1); %b(2) H0; b(1) deta H

Ydyson = @(A,x)(cos(A(3)*pi/180)/A(1)/A(1))*(-2*y+(1-y*y)*tan(A(3)*pi/180))/(1+y*y)/(1+y*y); 
%is the function writing OK? or the expression approach of cos/tan function is correct and its value seating?

A0 = [2 3509 10];  %≥ı º÷µ
lA = [1 3485 0];
uA = [40 3520 45];

A = lsqcurvefit(Ydyson,A0,x,y,lA,uA);
y1 = (cos(A(3)*pi/180)/A(1)/A(1))*(-2*y+(1-y*y)*tan(A(3)*pi/180))/(1+y*y)/(1+y*y);

plot(x,y,':',x,ygld(b,x),'r',x,y1,'k')
xlabel('x'),ylabel('y')
legend('data','fit','Dyson')
title('Dyson')