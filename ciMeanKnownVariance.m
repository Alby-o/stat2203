function ciMeanKnownVariance(n, xBar, sigma, ci)
    % CIMEAN Construct the confidence interval for an unknown mean with a known variance
    %
    %   CIMEAN(n, xBar, sigma, ci)
    %   n = number of samples
    %   xBar = sample calucluated mean
    %   sigma = known standard deviation of distribution
    %   ci = the % confidence inteval to construct
    a = 1 - ci;
    fprintf("a = 1 - ci = %f\n", a)
    z = norminv(1 - (a/2));
    fprintf("z = norminv(1 - (a/2)) = %f\n", z)
    
    serror = sigma / sqrt(n);
    fprintf("err = sigma / sqrt(n) = %f\n", serror)
    
    fprintf("CI is mean +- (z*err) = %f +- %f\n", xBar, z*serror)
    fprintf("A range of [%f,%f]\n", (xBar - z*serror),(xBar + z*serror))
end