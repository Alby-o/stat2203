function linearRegression(slope, slopeSE, slopeHyp, intercept, interceptSE, interceptHyp, dof, ci)
    % LINEARREGRESSION perform an analysis of a linear regression
    %
    %   LINEARREGRESSION(SLOPE, SLOPESE, INTERCEPT, INTERCEPTSE, DOF, CI)
    %   SLOPE = Estimated slope
    %   SLOPESE = Standard error of slope estimate
    %   INTERCEPT = Estimated intercept
    %   INTERCEPTSE = Standard error of intercept estimate
    %   DOF = Reported Degrees of freedom
    %   CI = Confidence intervals (optional)

    fprintf("no. of participants = dof + 2 = %d\n", dof + 2)
    
    fprintf("\nSLOPE\n")
    slopeTStat = (slope - slopeHyp)/slopeSE;
    fprintf("tStat = %f\n", slopeTStat)
    pVal = tcdf(slopeTStat, dof, 'upper')
    if exist('ci','var')
        fprintf("\nSLOPE CI\n")
        a = 1 - ci;
        fprintf("%f = 1 - a => a = %f\n", ci, a)
        z = tinv(1 - (a/2), dof);
        fprintf("t1-a/2;dof = t%f;%d = %f\n", 1-(a/2), dof, z)
        fprintf("ci is estimate +- critical value * s.e.(estimate) = %f +- %f*%f\n", slope, z, slopeSE)
        fprintf("= %f +- %f\n", slope, z*slopeSE)
        fprintf("A range of [%f,%f]\n", (slope - z*slopeSE), (slope + z*slopeSE))
    end
    
    fprintf("\nINTERCEPT\n")
    interceptTStat = (intercept - interceptHyp)/interceptSE;
    fprintf("tStat = %f\n", interceptTStat)
    pVal = tcdf(interceptTStat, dof, 'upper')
    if exist('ci','var')
        fprintf("\nINTERCEPT CI\n")
        a = 1 - ci;
        fprintf("%f = 1 - a => a = %f\n", ci, a)
        z = tinv(1 - (a/2), dof);
        fprintf("t1-a/2;dof = t%f;%d = %f\n", 1-(a/2), dof, z)
        fprintf("ci is estimate +- critical value * s.e.(estimate) = %f +- %f*%f\n", intercept, z, slopeSE)
        fprintf("= %f +- %f\n", intercept, z*interceptSE)
        fprintf("A range of [%f,%f]\n", (intercept - z*interceptSE), (intercept + z*interceptSE))
    end
    
    fprintf("\nASSUMPTIONS\n")
    fprintf("1. Linearity of mean - look for trend in residuals v fitted values\n")
    fprintf("2. Variability has normal distribution - look at straightness in residual v theoretical quantiles\n")
    fprintf("3. Variability is constant - Look at spread in residuals v fitted values\n")
    fprintf("4. Independence (which we can't test with plots)\n")