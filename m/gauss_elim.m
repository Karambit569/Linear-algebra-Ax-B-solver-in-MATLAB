function x = gauss_elim(A, b, tol)
   

    n = length(b);        % 시스템의 크기 (행 또는 열의 수)
    Aug = [A b];          % 확장 행렬 생성 [A | b]
    
    % Forward elimination (전진 소거)
    for i = 1:n-1
        % 피벗이 너무 작으면 오류 발생
        if abs(Aug(i,i)) < tol
            error('Pivot too small at row %d (|%.2e| < tol)', i, abs(Aug(i,i)));
        end
        
        % 아래 행들에 대해 소거 수행
        for j = i+1:n
            factor = Aug(j,i) / Aug(i,i);           % i번째 열의 소거 계수 계산
            Aug(j,:) = Aug(j,:) - factor * Aug(i,:); % j번째 행 갱신 (i번째 행을 빼서 0 만듦)
        end
    end

    x = zeros(n,1);  % 해 벡터 초기화

    % Back substitution
    for i = n:-1:1
        % 역대입 중 오류 발생 상황
        if abs(Aug(i,i)) < tol
            error('Zero pivot at back substitution (row %d)', i);
        end
        % 이미 구한 해 제외, 새로운 해 계산
        x(i) = (Aug(i,end) - Aug(i,1:n)*x) / Aug(i,i);
    end
end
