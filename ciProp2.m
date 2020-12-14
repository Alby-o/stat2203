function ciProp2(n1, p1, n2, p2, ci)
    % CIPROP2 Caluclate the confidence interval for a proportion
    %   
    %   CIPROP2(N1, P1, N2, P2, CI)
    %   N1 = number of trials in first experiment
    %   P1 = number of successes in first experiment
    %   N2 = number of trials in second experiment
    %   P2 = number of successes in second experiment
    %   CI = Confidence interval
    ph1 = p1/n1;
    fprintf("ph1 = p1/n1 = %f\n", ph1)
    ph2 = p2/n2;
    fprintf("ph2 = p2/n2 = %f\n", ph2)
    phdiff = ph1-ph2;
    fprintf("phdiff = ph1-ph2 = %f\n", phdiff);
    serror = sqrt(((ph1*(1-ph1))/n1)+((ph2*(1-ph2))/n2));
    fprintf("serror = sqrt(((ph1*(1-ph1))/n1)+((ph2*(1-ph2))/n2)) = %f\n", serror)
    alpha = 1 - ci;
    fprintf("alpha = 1 - ci = %f\n", alpha)
    z = norminv(1 - (alpha/2));
    fprintf("z = norminv(1 - (alpha/2)) = %f\n", z)
    err = z * serror;
    fprintf("err = z * serror = %f\n", err)
    fprintf("phdiff +- err = %f +- %f\n", phdiff, err)
    fprintf("range [%f,%f]\n", phdiff - err,phdiff + err)
end