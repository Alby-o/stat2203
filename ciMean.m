function ciMean(n, muBar, s, ci)
    % CIMEAN Construct the confidence interval for an unknown mean with a unknown variance using student's t-distribution
    %
    %   CIMEAN(n, muBar, sigma, ci)
    %   n = number of samples
    %   muBar = sample calucluated mean
    %   sigma = sample standard deviation of distribution
    %   ci = the % confidence inteval to construct
    a = 1 - ci;
    fprintf("a = 1 - ci = %f\n", a)
    z = tinv(1 - (a/2), n-1);
    fprintf("z = tinv(1-(a/2), n-1) = %f\n", z)
    
    serror = s / sqrt(n);
    fprintf("err = s / sqrt(n) = %f\n", serror)
    
    fprintf("CI is mean +- (z*err) = %f +- %f\n", muBar, z*serror)
    fprintf("A range of [%f,%f]\n", (muBar - z*serror),(muBar + z*serror))
end