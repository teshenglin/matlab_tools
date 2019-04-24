%% An example showing how to make mp4 animation
%

x = linspace(-10,10,1000);
dt = 0.1;

fig = figure;
vidobj = VideoWriter('wave_writevideo_2.mp4', 'MPEG-4');
open(vidobj);

y = exp(-x.^2);
h = plot(x, y);
drawnow
frame=getframe(fig);
writeVideo(vidobj, frame);
    
for k = 1:50
    time = k*dt;
    y = exp(-(x-time).^2);
    set(h, 'ydata', y);
    drawnow
    frame=getframe(fig);
    writeVideo(vidobj, frame);
end
close(vidobj);