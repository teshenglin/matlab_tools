function InterpolateRungeFunction(F)
% Select interpolation points by right clicking.
% When you get bored, left or double click to finish.
if ( nargin == 0 )
    F = @(x) 1./(1+25*x.^2);          % default function
end

% initialise
x = []; d = domain(-1,1);
LW = 'LineWidth'; MS = 'MarkerSize'; FS = 'FontSize';
xx = linspace(-1,1,500);
title(['Interpolation of ' char(F)])
% loop
while 1                          % keep clicking!
    hold off
    plot(xx,F(xx),'-k',LW,2), shg  % plot function F
    hold on, axis([-1 1 -1 2])
    if ( ~isempty(x) )
        plot(x,F(x),'.b',MS,20)      % plot interpolation points
        plot(x,0*x,'.k',MS,6)        % plot x values alone
        y = interp1(x,F(x),d);       % interpolate the data
        plot(y,'-b',LW,2), shg       % plot interpolant
    end
    [gx, ~, button] = ginput(1);    % input new interpolation point
    if ( button == 3 ) break, end  % if right button, stop
    x = unique([x; gx]);           % #ok<AGROW>
end
end