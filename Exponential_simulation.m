%Simulate random variates for Exponential distribution using Matlab,Emperical
%and theoretical methods
x=[0:0.001:10]%range of the distribution
 normth= exppdf(x,2)%mean=2 variance=2
 
 
 
 rng default
normmat1 =exprnd(2,10000,1);
pd=fitdist(normmat1,'Exponential')
a1=histogram(normmat1,'normalization','pdf')
vals1=a1.Values
vals1((length(a1.Values))+1)=0;
binedges1=a1.BinEdges;


%f = @(x)(exp((-((x-2).^2))./(4))./((sqrt(2*pi))*1.414));
f = @(x)0.5*exp(-(x./2));
g = @(x)exp(-x);
grnd = @()exprnd(1);
rng('default')
X = accrejrnd(f,g,grnd,10,1e4,1);
pd1=fitdist(X,'Exponential')
figure(2)
a4=histogram(X,'normalization','pdf');
vals4=a4.Values
vals4((length(a4.Values))+1)=0;
binedges4=a4.BinEdges

figure(4)

plot(x,normth);
hold on
plot(binedges1,vals1)
hold on
plot(binedges4,vals4);
title('EXP PDF T=10000')
legend('Theoretical lambda=2','Matlab lambda=2.003','Emperical lambda=1.819');

