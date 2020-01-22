%Simulate random variates for Normal distribution using Matlab,Emperical
%and theoretical methods
%Theoretical Method
 x=[-4:.01:5.99]%range of the distribution
 normth= normpdf(x,2,1.414)%mean=2 variance=2
 
 %Matlab routine for T=100
rng default
normmat1 =normrnd(2,1.414,100,1);%define normal random variable

a1=histogram(normmat1,'normalization','pdf')%compute the histogram and normalize it to obtain pdf
vals1=a1.Values
vals1((length(a1.Values))+1)=0;
binedges1=a1.BinEdges;

%rejection method for T=100
f = @(x)(exp((-((x-2).^2))./(4))./((sqrt(2*pi))*1.414));%Define normal pdf
g = @(x)exp(-x);%consider exponential function which is less than the normal function
grnd = @()exprnd(1);
rng('default')
X = accrejrnd(f,g,grnd,10,1e4,1);% call the acceptance rejection method
pd1=fitdist(X,'Normal')% to obtain the meand and variance of the distribution
figure(2)
a4=histogram(X,'normalization','pdf');%obtain histogram and normalize to obtain pdf
vals4=a4.Values
vals4((length(a4.Values))+1)=0;
binedges4=a4.BinEdges


%Plot the graphs
figure(4)
plot(x,normth);
hold on
plot(binedges3,vals3)
hold on
plot(binedges4,vals4);
title('Normal PDF T=10000')
legend('Theoretical mean=2 sigma=1.414','Matlab routine mean=2.00 sigma=1.401', 'Emperical values mean=2.21 sigma=1.239');


%calculation of the mean square error
mse=immse(normth,X')
 