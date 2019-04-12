function [Xtr, ytr, Xte, yte] = dataSets(seed, ncol, target, freq, noise_freq)

[Xtr, ytr] = dataGenerator(seed, ncol, target, freq, noise_freq);
[Xte, yte] = dataGenerator(seed, 10*ncol, target, 0, noise_freq);

end