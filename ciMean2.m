function result = ciMean2(n1, mu1, sd1, n2, mu2, sd2, ci)
    % CIMEAN2 Calculate the difference between two means. Set var 'hyp' to change the hypothesis test from a difference of 0.
    if ~exist('hyp','var')
        hyp = 0;
    end
    poolsqrd  =  (((n1 - 1) * sd1^2) + (n2 - 1) * sd2^2)/ (n1 + n2 - 2);
    fprintf("Sp^2 = ((m-1)Sx^2 + (n-1)Sy^2)/(m+n-2) = %f\n", poolsqrd)

    a = 1 - ci;
    fprintf("%f = 1 - a => a = %f\n", ci, a)
    z = tinv(1 - (a/2), n1+n2-2);
    fprintf("t1-a/2;n+m-2 = t%f;%d = %f\n", 1-(a/2), n1+n2-2, z)
    
    serror = sqrt(poolsqrd)*sqrt((1/n1) + (1/n2));
    fprintf("s.e.(estimate) = s / sqrt(n) = %f\n", serror)
    fprintf("err = sqrt(poolsqrd)*sqrt((1/n1) + (1/n2)) = %f\n", serror)
    
    fprintf("CI is (xBar1-xBar2) +- (z*err) = %f +- %f\n", (mu1-mu2), z*serror)
    fprintf("A range of [%f,%f]\n", ((mu1-mu2) - z*serror),((mu1-mu2) + z*serror))
    
end