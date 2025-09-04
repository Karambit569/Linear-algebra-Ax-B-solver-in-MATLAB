function main_3_2()
    % Signal matrix A
    t = 0.01:0.01:0.2;       % 20 time samples
    freq = 11:30;            % 20 frequencies
    A = zeros(20);
    for i = 1:20
        A(i,:) = cos(2*pi*freq(i)*t);
    end
    A = A';  % A: 20x20

    %loading output
    load('output.mat');      % output 벡터는 20x1

    tol = 1e-40;

    %LU factorization
    tic;
    [L, U] = slu(A, tol);    % LU
    x1 = slv(L, U, output);  % Forward + Backward Substitution
    t1 = toc;

    % Cofactor
    tic;
    invA = cofactor_inv(A, tol);   %Cofactor역행렬
    x2 = invA * output;
    t2 = toc;

    % MATLAB inv() 
    tic;
    x3 = inv(A) * output;
    t3 = toc;

    %result
    disp('--- Absorption Rates ---');
    fprintf('\n[1] LU (slu + slv):\n');     disp(x1);
    fprintf('\n[2] Cofactor Inverse:\n');   disp(x2);
    fprintf('\n[3] inv() Function:\n');     disp(x3);

    fprintf('\n=== Execution Time Comparison ===\n');
    fprintf('LU (slu+slv)     : %.6f s\n', t1);
    fprintf('Cofactor Inverse: %.6f s\n', t2);
    fprintf('inv()           : %.6f s\n', t3);
end
