function result = hypTest(n, muBar, sd, hyp, test)
    % HYPTEST Test a alternate hypothesis against a null hypothesis
    %
    %   HYPTEST(N, MUBAR, SD, HYP, TEST)
    %   N = number of samples
    %   MUBAR = sample calculated mean
    %   SD = sample standard deviation of distribution
    %   HYP = the current hypothesis (default 0)
    %   TEST = hypothesis test we are conducting. One of 'equal', 'less' or 'upper'. (default 'equal')

    if ~exist('hyp','var')
        hyp = 0;
    end
    if ~exist('test','var')
        test = 'equal';
    end
    tstat =  (muBar - hyp) / (sd / sqrt(n))
    pval = 0;

    switch test 
    case 'equal'
        pval = min(tcdf(tstat, n-1), tcdf(tstat, n-1, 'upper')) * 2
    case 'less'
        pval = tcdf(tstat, n-1)
    case 'greater'
        pval = tcdf(tstat, n-1, 'upper')
    otherwise
        fprintf("test must be one of 'equal', 'less' or 'greater'\n")
        return
    end

    result = estrength(pval);
end