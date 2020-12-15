function result = hypMean(n, xBar, sd, hyp, test)
    % HYPMEAN Test a mean alternate hypothesis against a null hypothesis
    %
    %   HYPMEAN(N, XBAR, SD, HYP, TEST)
    %   N = number of samples
    %   XBAR = sample calculated mean
    %   SD = sample standard deviation of distribution
    %   HYP = the current hypothesis (default 0)
    %   TEST = hypothesis test we are conducting. One of 'equal', 'less' or 'upper'. (default 'equal')

    if ~exist('hyp','var')
        hyp = 0;
    end
    if ~exist('test','var')
        test = 'equal';
    end
    tstat =  (xBar - hyp) / (sd / sqrt(n));

    fprintf("standard error = s/sqrt(n) = %f/sqrt(%d) = %f\n", sd, n, sd/sqrt(n))
    fprintf("test statistic = (estimate - hypothesised)/s.e.(estimate)\n")
    fprintf("test statistic = (%f - %f)/%f = %f\n", xBar, hyp, sd/sqrt(n), tstat)
    pval = 0;

    switch test 
    case 'equal'
        pval = min(tcdf(tstat, n-1), tcdf(tstat, n-1, 'upper')) * 2;
        fprintf("pval = 2 * min[P(Tn-1 > tstat), P(Tn-1 < tstat)]\n")
        fprintf("pval = 2 * min[P(T%d > %f), P(T%d < %f)] = %f\n", n-1, tstat, n-1, tstat, pval)
    case 'less'
        pval = tcdf(tstat, n-1);
        fprintf("pval = P(Tn-1 < tstat)\n")
        fprintf("pval = P(T%d < %f) = %f\n", n-1, tstat, pval)
    case 'greater'
        pval = tcdf(tstat, n-1, 'upper');
        fprintf("pval = P(Tn-1 > tstat)\n")
        fprintf("pval = P(T%d > %f) = %f\n", n-1, tstat, pval)
    otherwise
        fprintf("test must be one of 'equal', 'less' or 'greater'\n")
        return
    end

    result = estrength(pval);
end