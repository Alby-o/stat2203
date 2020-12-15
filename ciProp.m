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
    fprintf("s.e.(estimate) = sqrt(ph*(1-ph)/n) = %f\n", serror)
    a = 1 - ci;
    fprintf("%f = 1 - a => a = %f\n", ci, a)
    z = norminv(1 - (a/2));
    fprintf("critical value = norminv(1 - (a/2)) = %f\n", z)
    err = z * serror;
    fprintf("err = critical value * s.e.(estimate) = %f\n", err)
    fprintf("ph +- err = %f +- %f\n", ph, err)
    fprintf("range of [%f,%f]\n", ph - err, ph + err)
end