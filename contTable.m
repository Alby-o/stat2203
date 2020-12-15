function result = contTable(x)
    rowSum = sum(x,2)
    colSum = sum(x,1)
    totSum = sum(x,'all')
    
    fprintf("H0: No association between rows & columns\n")
    fprintf("H1: Some association between rows & columns\n")

    fprintf("Expected counts = row totals * column totals / total\n")
    format longG
    expectedCounts = (rowSum*colSum) / totSum
    
    xSquare = sum((x-expectedCounts).^2./(expectedCounts), 'all');
    fprintf("X^2 = sum i ((ei - oi)^2 / ei) = %f\n", xSquare)
    
    dof = (length(rowSum)-1)*(length(colSum) - 1);
    fprintf("degrees of freedom = (#rows - 1)(#cols - 1) = %d\n", dof)
    
    pval = chi2cdf(xSquare, dof, 'upper')
    fprintf("p-value = P(chi%d^2 > %f) = %f\n", dof, xSquare, pval)

    result = estrength(pval);
end