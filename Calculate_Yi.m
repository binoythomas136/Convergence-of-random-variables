rng default
  %norm1 = normrnd(2,4,10000,1);
%x=[-4:.01:5.99]%range of the distribution
%norm1= normrnd(2,1.414)
norm1 = normrnd(2,4,10000,1)

%Code for calculating y

for i=1:10000
    a=0;
    for j=1:i
        a=a+norm1(j);
    end
    y(i)=a/(2*i);
end

figure(1)
a1=histogram(y,'normalization','pdf')
title('Histogram for uniform random variable with T=10000');
vals1=a1.Values;
vals1((length(a1.Values))+1)=0;
binedges1=a1.BinEdges;
figure(2)
plot(a1.BinEdges,vals1);

figure(3)
a2=histfit(y,50,'normal')

figure(4)
plot(y)


