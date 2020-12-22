% Matlab program
function Y = multidimensional_scaling(D, k)

%   Input: D, n*n EDM 矩陣, 元素為距離平方
%          k, 要降到的維度, k 為正整數, k<n
%   Output: Y: k*n data matrix, k 個 features 以及 n 個 samples

    n = size(D, 1);                         % n 個 samples
    mu = sum(D, 1)/n; D = D - mu;           %
    mu = sum(D, 2)/n; B = D - mu;           %
    B = -0.5*B;                             % B = -0.5*H*D*H
    [V, D] = eig(B, 'vector');              % 求出特徵值及特徵向量
    [sqD, ind] = sort(sqrt(D), 'descend');  % 將特徵值按大小排列
    sqD = sqD(1:k);                         % 取前 k 個
    V = V(:, ind(1:k));                     % 取相對應的特徵向量
    Y = V'.*(sqD*ones(1,n));                % 求出 k 維資料點
end