%%
% Time correlation function of direction
%
% Input: n-by-2 or n-by-3 vector
%        U: velocity vector
%        maxtau: max. of tau to be evaluated
%        step: number of steps to be evaluated
%
% Output: t: time stamps
%         C: Time correlation function, step-by-1 vector

%%
function [t, C] = time_correlation_directions3(U, maxtau, step)

    % evaluate length of U
    [n, m] = size(U);
    
    % Initialize the time correlation function
    t = zeros(step, 1);
    C = zeros(step, 1);
    
    % Calculate steps
    dx = log10(maxtau)/step;
    ii = 0;
    
    if(m==2)
        % normalize the velocity vector
        normal = sqrt(U(:,1).^2+U(:,2).^2);
        U = U./(normal*ones(1,m));
        
        for jj=1: step
            tmp = floor(10^(jj*dx));
            if tmp > ii
                ii = tmp;
            else
                ii = ii+1;
            end
            t(jj)=ii;
            tmax = n - ii;
            C(jj) = sum(U(1:(n-ii),1).*U(1+ii:n,1)+U(1:(n-ii),2).*U(1+ii:n,2))/tmax;
        end
        
    elseif(m==3)
        % normalize the velocity vector
        normal = sqrt(U(:,1).^2+U(:,2).^2+U(:,3).^2);
        U = U./(normal*ones(1,m));
        
        for jj=1: step
            tmp = floor(10^(jj*dx));
            if tmp > ii
                ii = tmp;
            else
                ii = ii+1;
            end
            t(jj)=ii;
            tmax = n - ii;
            C(jj) = sum(U(1:(n-ii),1).*U(1+ii:n,1)+U(1:(n-ii),2).*U(1+ii:n,2)+U(1:(n-ii),3).*U(1+ii:n,3))/tmax;
        end
    end
end