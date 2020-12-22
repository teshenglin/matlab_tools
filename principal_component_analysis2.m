% Matlab program
function B = principal_component_analysis2(X, k)

%   Input: X, p*n data matrix, p 個 features 以及 n 個 samples
%          k, 要降到的維度, k 為正整數, k<=p
%   Output: B: k*n data matrix, k 個 features 以及 n 個 samples

    [~, n] = size(X);               % p 個 features 以及 n 個 samples
    mu = sum(X, 2)/n;               % 計算 sample 的平均, mu
    Y = X - mu*ones(1,n);           % 資料平移得到 Y
    [~, S, V] = svds(Y, k);         % 將 Y 做奇異值分解並取前 k 個 eigenvectors
    B = S*V';                       % 求出投影後的係數
end