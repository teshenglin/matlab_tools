% Matlab program
function B = principal_component_analysis(X, k)

%   Input: X, p*n data matrix, p 個 features 以及 n 個 samples
%          k, 要降到的維度, k 為正整數, k<n
%   Output: B: k*n data matrix, k 個 features 以及 n 個 samples

    [~, n] = size(X);               % p 個 features 以及 n 個 samples
    mu = sum(X, 2)/n;               % 計算 sample 的平均 mu
    Y = X - mu*ones(1,n);           % 資料平移得到 Y
    S = Y*Y';                       % 求出共變異數矩陣 S
    [U, D] = eig(S, 'vector');      % 求出特徵值 D 及特徵向量 U
    [~, ind] = sort(D, 'descend');  % 將特徵值由大到小排列
    U = U(:, ind);                  % 將特徵向量照樣排列
    B = U(:,1:k)'*Y;                % 投影到前 k 個組成的空間中並求出係數 B
end