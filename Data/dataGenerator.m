function [X,y] = dataGenerator(seed, ncol, target, freq, noise_freq)

rng(seed); 

N       = Numbers(); 
nT      = size(target,2);
nPixels = size(N,1);

% Generation
for j=1:ncol
    
    if rand() < (freq-0.1*nT)/(1-0.1*nT) i = target(randi([1,nT]));
    else i = randi(10); end
    
    if i == 0  X(:,j) = N(:,end);
    else       X(:,j) = N(:,i); end
    
    if any(i == target) y(j) = 1;
    else y(j) = 0; end
    
end

% Noise
for j=1:ncol
    for k = 1:round(noise_freq*nPixels)
        ii = randi([1 nPixels]); X(ii,j) = mod(1,X(ii,j));
    end
end

end