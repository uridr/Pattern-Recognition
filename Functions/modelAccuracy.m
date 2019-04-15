function[modAcc] = modelAccuracy(model, pixelDataset, valueDataset)

modAcc = 0;
p = size(pixelDataset,2);

for i=1:p
    if modelPredict(model,pixelDataset(1:35,i)) == valueDataset(i)
        modAcc = modAcc + 1;
    end
end

modAcc = modAcc * (100 / p);

end
