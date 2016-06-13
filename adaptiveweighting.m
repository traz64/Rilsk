function [weightmat]=adaptiveweighting(weightmat,winner,tervalues,rounds)
if isempty(gcp('nocreate'))

for j=1:100
        weightmat = weightmat+((winner==tervalues(:,:,j)).*(rounds-j)./(rounds.*100000));
end
weightmat=weightmat./max(max(weightmat));
save('weightmat.mat','weightmat')
end
end