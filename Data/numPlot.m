function numPlot(x,pos)
num = zeros(7,5);

for i=1:7
    num(i,1:5)=x((i-1)*5+1:(i-1)*5+5,pos);
end
imagesc(num); colormap(gray);
set(gca,'YTicklabel',[],'XTicklabel',[]);
end