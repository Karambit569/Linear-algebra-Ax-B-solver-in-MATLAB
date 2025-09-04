function [L, U] = slu(A, tol)
 

    n = size(A, 1);        % 행렬 A의 크기 (n x n)
    L = eye(n);            % L을 단위행렬로 초기화
    U = zeros(n);          % U를 0으로 초기화

    for i = 1:n
        % U의 i번째 행 계산
        for j = i:n
            % L(i,1:i-1)과 U(1:i-1,j)의 곱을 빼서 U(i,j) 계산
            U(i,j) = A(i,j) - L(i,1:i-1)*U(1:i-1,j);
        end

        % U(i,i) 피벗이 너무 작으면 오류 발생
        if abs(U(i,i)) < tol
            error('Pivot too small at row %d (|%.2e| < tol)', i, abs(U(i,i)));
        end

        % L의 i번째 열 계산 (대각 아래 항)
        for j = i+1:n
            % L(j,i) 계산 시, 이전 항들의 영향을 제거한 후 U(i,i)로 나눔
            L(j,i) = (A(j,i) - L(j,1:i-1)*U(1:i-1,i)) / U(i,i);
        end
    end
end
