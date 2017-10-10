function outvar = compTrapArrayCopy(x,f)
%This function approximates an integral using the composite
%trapazoid method, given a function and a vector, which contains
%the boundaries and number of subintervals

%lower boundary
a=x(1);
%upper boundary
b=x(end);
%number of intervals
n=length(x)-1;
%width of intervals
h=(b-a)/n;

I1=0;

for i=2:n
    I1=I1+f(i);
end
%where I1 is the part of the integral that is summed over
%and I is the entire integral
I=h/2*(f(1)+2*I1+f(n+1));
outvar=I;
