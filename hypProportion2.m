function result = hypProportion2(n1, p1, n2, p2, hyp, test)
    % HYPPROPORTION2 Conduct a hypothesis test for a proportion
    %
    %   HYPPROPORTION2(N1, P1, N2, P2, HYP, TEST)
    %   N1 = number of samples in first distribution
    %   P1 = number of successes in first distribution
    %   N2 = number of samples in second distribution
    %   P2 = number of successes in second distribution
    %   HYP = the current hypothesis (e.g. H0: pHat1 - pHat2 = 0)
    %   TEST = hypothesis test we are conducting. One of 'equal', 'less' or 'upper'. (default 'equal')

    if ~exist('hyp','var')
        hyp = 0;
    end
    if ~exist('test','var')
        test = 'equal';
    end

    ph1 = p1/n1;
    fprintf("ph1 = p1/n1 = %f\n", ph1)
    ph2 = p2/n2;
    fprintf("ph2 = p2/n2 = %f\n", ph2)
    phdiff = ph1-ph2;
    fprintf("phdiff = ph1-ph2 = %f\n", phdiff);
    
    pHat = (p1 + p2) / (n1 + n2);
    fprintf("pHat = (p1 + p2) / (n1 + n2) = %f\n", pHat)
    
    t = ((ph1 - ph2) - hyp)/(sqrt(pHat * (1 - pHat))*sqrt((1/n1) + (1/n2)));
    fprintf("test statistic = ((ph1 - ph2) - hyp)/(sqrt(pHat * (1 - pHat))*sqrt(1/n1 + 1/n2)) = %f\n", t)
    

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