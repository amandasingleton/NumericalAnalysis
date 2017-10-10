%This script calls compTrapArrayCopy twice to excute a double integral
%and displays the approximate value for the integral 
%for each number of subintervals

clear;
%specify function using function handle
f=@(x,y) (x.^3)-(x.^2*y.^2);
%define boundaries
a=-2;
b=2;
c=-1;
d=1;
%loops over values for n
for i=1:6
    n=2^i;
    %define vectors x and y
    x=linspace(a,b,n+1);
    y=linspace(c,d,n+1);
    
    %Integrate in the x-direction
    %Outputs a matrix containing information on y and n, I1
    for k=1:n+1
        I1(k)=compTrapArrayCopy(x,f(x,y(k)));
    end
    
    %Integrate in the y-direction
    %Uses I1
    %Outputs a vector, I2
    for z=1:n+1
        I2(i)=compTrapArrayCopy(y,I1);
    end
    
    %displays information nicely
    J(2,i)=I2(i);
    J(1,i)=n;
    error(i)=abs(I2(i)+3+5/9);
    relativeError(i)=error(i)/(3+5/9);
    J(3,i)=relativeError(i);
end
disp(J);