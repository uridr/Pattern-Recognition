function [Xtr, ytr, Xte, yte] = dataSets(trseed, teseed, ncol, target, freq, noise_freq)

[Xtr, ytr] = dataGenerator(trseed, ncol, target, freq, noise_freq);
[Xte, yte] = dataGenerator(teseed, 10*ncol, target, 0, noise_freq);

end