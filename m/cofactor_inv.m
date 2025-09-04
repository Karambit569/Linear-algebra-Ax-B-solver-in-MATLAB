function invA = cofactor_inv(A, tol)
    % Matrix size
    [n, ~] = size(A);
    
    %  tol examination
    detA = det(A);
    if abs(detA) < tol
        error('Singular matrix: |det(A)| = %.2e < tol. Doesn't exist.', detA);
    end
    
    C = zeros(n);

    for i = 1:n
        for j = 1:n
           
            minor = A;
            minor(i,:) = [];
            minor(:,j) = [];
            
            C(i,j) = (-1)^(i+j) * det(minor);
        end
    end

    % 역행렬 계산
    invA = (1/detA) * C';
end
