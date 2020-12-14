function result = ciMean2(n1, mu1, sd1, n2, mu2, sd2, ci)
    % CIMEAN2 Calculate the difference between two means. Set var 'hyp' to change the hypothesis test from a difference of 0.
    if ~exist('hyp','var')
        hyp = 0;
    end
    poolsqrd  =  (((n1 - 1) * sd1^2) + (n2 - 1) * sd2^2)/ (n1 + n2 - 2)
    tstat =  ((mu1 - mu2) - hyp) / (sqrt(poolsqrd)*sqrt((1/n1) + (1/n2)))
    pval = tcdf(tstat,n1+n2-2)
    result = estrength(pval);

    alpha = 1 - ci;
    fprintf("alpha = 1 - ci = %f\n", alpha)
    z = tinv(1 - (alpha/2),n1+n2-2);
    fprintf("t_dof_alpha = tinv(1 - (alpha/2),n1+n2-2) = %f\n", z)
    
    serror = sqrt(poolsqrd)*sqrt((1/n1) + (1/n2));
    fprintf("err = sqrt(poolsqrd)*sqrt((1/n1) + (1/n2)) = %f\n", serror)
    
    fprintf("CI is (mu1-mu2) +- (z*err) = %f +- %f\n", (mu1-mu2), z*serror)
    fprintf("A range of [%f,%f]\n", ((mu1-mu2) - z*serror),((mu1-mu2) + z*serror))
    
end