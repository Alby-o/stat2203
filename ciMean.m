function ciMean(n, xBar, s, ci)
    % CIMEAN Construct the confidence interval for an unknown mean with a unknown variance using student's t-distribution
    %
    %   CIMEAN(n, xBar, sigma, ci)
    %   n = number of samples
    %   xBar = sample calucluated mean
    %   sigma = sample standard deviation of distribution
    %   ci = the % confidence inteval to construct
    a = 1 - ci;
    fprintf("%f = 1 - a => a = %f\n", ci, a)
    z = tinv(1 - (a/2), n-1);
    fprintf("t1-a/2;n-1 = t%f;%d = %f\n", 1-(a/2), n-1, z)
    
    serror = s / sqrt(n);
    fprintf("s.e.(estimate) = s / sqrt(n) = %f\n", serror)
    
    fprintf("CI is estimate +- critical value * s.e.(estimate) = %f +- %f*%f\n", xBar, z, serror)
    fprintf("= %f +- %f\n", xBar, z*serror)
    fprintf("A range of [%f,%f]\n", (xBar - z*serror), (xBar + z*serror))
end