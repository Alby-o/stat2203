function result = hypProportion(n, p, hyp, test)
    % HYPPROPORTION Conduct a hypothesis test for a proportion
    %
    %   HYPPROPORTION(N, P, HYP, TEST)
    %   N = number of samples
    %   P = number of successes
    %   HYP = the current hypothesis (e.g. H0: p=1/2)
    %   TEST = hypothesis test we are conducting. One of 'equal', 'less' or 'upper'. (default 'equal')

    if ~exist('test','var')
        test = 'equal';
    end
    fprintf("Under H0, X~Binomial(%d, %f)\n", n, hyp)
    switch test 
    case 'equal'
        fprintf("pval = 2 * min[P(X > %d), P(X < %d)]\n", p, p)
    case 'less'
        fprintf("pval = P(X < %d)\n", p)
    case 'greater'
        fprintf("pval = P(X > %d)\n", p)
    otherwise
        fprintf("test must be one of 'equal', 'less' or 'greater'\n")
        return
    end

    t = (p - hyp * n) / sqrt(n*hyp*(1-hyp));
    fprintf("test statistic = (successes - np) / sqrt(np(1-p)) \n")
    fprintf("test statistic = (%d - %d * %f) / sqrt(%d*%f*%f)\n", p, n, hyp, n, hyp, 1-hyp)
    fprintf("test statistic = %f\n", t)

    switch test 
    case 'equal'
        pval = min(normcdf(t), normcdf(t, 'upper')) * 2
        fprintf("pval = 2 * min[P(Z > tstat), P(Z < tstat)]\n")
        fprintf("pval = 2 * min[P(Z > %f), P(Z < %f)] = %f\n", t, t, pval)
    case 'less'
        pval = normcdf(t)
        fprintf("pval = P(Z < tstat)\n")
        fprintf("pval = P(Z < %f) = %f\n", t, pval)
    case 'greater'
        pval = normcdf(t, 'upper')
        fprintf("pval = P(Z > tstat)\n")
        fprintf("pval = P(Z > %f) = %f\n", t, pval)
    otherwise
        fprintf("test must be one of 'equal', 'less' or 'greater'\n")
        return
    end

    result = estrength(pval);
end