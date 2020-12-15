function result = hypMean2(n1, mu1, sd1, n2, mu2, sd2, hyp, test)
    % HYPMEAN2 Test an alternate hypothesis against a null hypothesis in difference in means 
    %
    %   HYPMEAN2(N1, XBAR1, SD1, N2, XBAR2, SD2, HYP, TEST)
    %   N1 = number of samples in first distribution
    %   XBAR1 = sample calculated mean in first distribution
    %   SD1 = sample standard deviation of distribution in first distribution
    %   N2 = number of samples in second distribution
    %   XBAR2 = sample calculated mean in second distribution
    %   SD2 = sample standard deviation of distribution in second distribution
    %   HYP = the current hypothesis (default 0)
    %   TEST = hypothesis test we are conducting. One of 'equal', 'less' or 'upper'. (default 'equal')

    if ~exist('hyp','var')
        hyp = 0;
    end
    if ~exist('test','var')
        test = 'equal';
    end
    poolsqrd  =  (((n1 - 1) * sd1^2) + (n2 - 1) * sd2^2)/ (n1 + n2 - 2);
    fprintf("Sp^2 = ((n1-1)S1^2 + (n2-1)S2^2)/(n1+n2-2)\n")
    fprintf("Sp^2 = (%d*%f^2 + %d*%f^2)/%d = %f\n", n1-1, sd1, n2-1, sd2, n1+n2-2, poolsqrd)

    tstat =  ((mu1 - mu2) - hyp) / (sqrt(poolsqrd)*sqrt((1/n1) + (1/n2)));
    fprintf("tstat =  ((xBar1 - xBar2) - hyp) / (Sp*sqrt(1/n1 + 1/n2)) = %f \n", tstat)

    switch test 
    case 'equal'
        pval = 2 * min(tcdf(tstat,n1+n2-2),tcdf(tstat,n1+n2-2,'upper'))
        fprintf("pval = 2 * min[P(Tn+m-2 > tstat), P(Tn+m-2 < tstat)]\n")
        fprintf("pval = 2 * min[P(T%d > %f), P(T%d < %f)] = %f\n", n1+n2-2, tstat, n1+n2-2, tstat, pval)
    case 'less'
        pval = tcdf(tstat,n1+n2-2)
        fprintf("pval = P(Tn+m-2 < tstat)\n")
        fprintf("pval = P(T%d < %f) = %f\n", n1+n2-2, tstat, pval)
    case 'greater'
        pval = tcdf(tstat,n1+n2-2,'upper')
        fprintf("pval = P(Tn+m-2 > tstat)\n")
        fprintf("pval = P(T%d > %f) = %f\n", n1+n2-2, tstat, pval)
    otherwise
        fprintf("test must be one of 'equal', 'less' or 'greater'\n")
        return
    end
    result = estrength(pval);
end