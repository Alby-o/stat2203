function result = ciMean2(n1, mu1, sd1, n2, mu2, sd2, ci)
    % CIMEAN2 Calculate the confidence interval for a difference between two means. Set var 'hyp' to change the hypothesis test from a difference of 0.
    %
    %   CIMEAN2(n1, xBar1, s1, n2, xBar2, s2, ci)
    %   n1 = number of samples
    %   xBar1 = sample calucluated mean
    %   s1 = sample standard deviation of distribution
    %   ci = the % confidence inteval to construct
    if ~exist('hyp','var')
        hyp = 0;
    end
    poolsqrd  =  (((n1 - 1) * sd1^2) + (n2 - 1) * sd2^2)/ (n1 + n2 - 2);
    fprintf("Sp^2 = ((n1-1)S1^2 + (n2-1)S2^2)/(n1+n2-2)\n")
    fprintf("Sp^2 = (%d*%f^2 + %d*%f^2)/%d = %f\n", n1-1, sd1, n2-1, sd2, n1+n2-2, poolsqrd)

    a = 1 - ci;
    fprintf("%f = 1 - a => a = %f\n", ci, a)
    z = tinv(1 - (a/2), n1+n2-2);
    fprintf("t1-a/2;n+m-2 = t%f;%d = %f\n", 1-(a/2), n1+n2-2, z)
    
    serror = sqrt(poolsqrd)*sqrt((1/n1) + (1/n2));
    fprintf("s.e.(xBar1-xBar2) = Sp*sqrt(1/n1 + 1/n2)\n")
    fprintf("s.e.(xBar1-xBar2) = %f*sqrt(1/%d + 1/%d) = %f\n", sqrt(poolsqrd), n1, n2, serror)
    
    fprintf("CI is (xBar1-xBar2) +- critical value * s.e.(estimate) = %f +- %f*%f\n", (mu1-mu2), z, serror)
    fprintf("= %f +- %f\n", (mu1-mu2), z*serror)
    fprintf("A range of [%f,%f]\n", ((mu1-mu2) - z*serror),((mu1-mu2) + z*serror))
    
end