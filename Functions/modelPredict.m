function[indicator] = modelPredict(model, object)

sig = @(X)   1./(1+exp(-X)); 
y   = @(X,w) sig(w'*sig(X));

predict = round(y(object,model));

%If model recognizes obj as one in chosen subset indicator = 1

if predict == 1 indicator = 1;
else            indicator = 0; end

end