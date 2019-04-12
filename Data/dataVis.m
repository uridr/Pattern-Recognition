[X,y] = dataGenerator(1234,10,[1],0.5,0.1);
for i=1:10
    subplot(2,5,i); numPlot(X,i);
end