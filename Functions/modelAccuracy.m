function[modAcc] = modelAccuracy(model, pixelDataset, valueDataset)

p = size(dataset,2);

for i=1:p
    %modelPredict either returns
    if modelPredict(model,pixelDataset(1:35,i)) == valueDataset(i)
        modAcc = modAcc + 1;
    end
end

modAcc = modAcc * (100 / p);

end
