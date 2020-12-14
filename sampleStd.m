function [m, s] = sampleStd(X)
    % SAMPLESTD Caluclate the sample mean and standard deviation
    %
    %   SAMPLESTD(X)
    %   X = vector of measurements from the random variable
    m = mean(X);
    s = sqrt(sum((X-mean(X)).^2)/(numel(X)-1));
end