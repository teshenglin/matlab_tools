%%
% Time correlation function of two time dependent signals
%
% Input: Three n-by-1 vectors
%        t: time 
%        A: signal 1
%        B: signal 2
%
% Output: C: Time correlation function, (n-1)-by-1 vector
%         The time stamp for C is from t(2) to t(end)

%%
function [C] = time_correlation(t, A, B)

    % evaluate length of t
    n = length(t);
    
    % Initialize the time correlation function
    C = zeros(n-1, 1);

    for ii=1: (n-1)
        tmax = n - ii;
        C(ii) = sum(A(1:(n-ii)).*B(1+ii:n))/tmax;
    end
end