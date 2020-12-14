function sp = pooledStd(Sx, Nx, Sy, Ny)
    % POOLEDSTD Caluclate the sample standard deviation for a difference in means with a common variance
    %
    %   POOLEDSTD(Sx, Nx, Sy, Ny)
    %   Sx = Sample std of x
    %   Nx = Number of samples in x
    %   Sy = Sample std of y
    %   Ny = Number of samples in y
    sp = sqrt(((Nx - 1)*Sx^2 + (Ny - 1)*Sy^2)/(Nx+Ny - 2));
end