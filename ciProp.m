function ciProp(n, p, ci)
    % CIPROP Caluclate the confidence interval for a proportion
    %   
    %   CIPROP(N, P, CI)
    %   N = number of trials
    %   P = number of successes
    %   CI = Confidence interval
    ph = p/n;
    fprintf("ph = p/n = %f\n", ph)

    serror = sqrt(ph*(1-ph)/n);
    fprintf("serror = sqrt(ph*(1-ph)/n) = %f\n", serror)
    alpha = 1 - ci;
    fprintf("alpha = 1 - ci = %f\n", alpha)
    z = norminv(1 - (alpha/2));
    fprintf("z = norminv(1 - (alpha/2)) = %f\n", z)
    err = z * serror;
    fprintf("err = z * serror = %f\n", err)
    fprintf("ph +- err = %f +- %f\n", ph, err)
    fprintf("range of [%f,%f]\n", ph - err, ph + err)
end