%%
% Time correlation function of direction
%
% Input: n-by-2 or n-by-3 vector
%        U: velocity vector
%
% Output: C: Time correlation function, (n-1)-by-1 vector
%         The time stamp for C is from t(2) to t(end)

%%
function [C] = time_correlation_directions(U)

    % evaluate length of U
    [n, m] = size(U);
    
    % Initialize the time correlation function
    C = zeros(n-1, 1);
    
    if(m==2)
        % normalize the velocity vector
        normal = sqrt(U(:,1).^2+U(:,2).^2);
        U = U./(normal*ones(1,m));
        
        for ii=1: (n-1)
            tmax = n - ii;
            C(ii) = sum(U(1:(n-ii),1).*U(1+ii:n,1)+U(1:(n-ii),2).*U(1+ii:n,2))/tmax;
        end
        
    elseif(m==3)
        % normalize the velocity vector
        normal = sqrt(U(:,1).^2+U(:,2).^2+U(:,3).^2);
        U = U./(normal*ones(1,m));
        
        for ii=1: (n-1)
            tmax = n - ii;
            C(ii) = sum(U(1:(n-ii),1).*U(1+ii:n,1)+U(1:(n-ii),2).*U(1+ii:n,2)+U(1:(n-ii),3).*U(1+ii:n,3))/tmax;
        end
    end
end