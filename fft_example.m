%% An example illustrates the usage of FFT
%
%  In this example we show how to 
%  1. evaluate the Fourier coefficients of a periodic function f(x) defined 
%     on [0, 2*pi]
%  2. evaluate the derivative of the function at grid points


%% N: number of sample points
N = 20;

%% The domain is defined on [0, 2*pi]
L = 2*pi;

%% The grid points
%  We sample eh domain at N equally-spaced grid points.
%  Note that f(0) = f(2*pi) so the last point at x=2*pi is removed.
x = linspace(0, L, N+1);
x = x(1:N);

%% We evaluate the function f(x) at grid points
f = exp(sin(x));

%  f1 is the exact solution of f'(x), to be used for comparison later
f1 = f.*cos(x);
%  f2 is the exact solution of f''(x), to be used for comparison later
f2 = exp(sin(x)).*(cos(x).^2 - sin(x));

%%
% fft_f: Fourier coefficients of f(x), namely, \hat{f}
fft_f = fft(f);

% Fourier mode
k_mode = [0, 1:N/2-1, 0, -N/2+1:-1]*2*pi/L;

% fft_df: first derivative
fft_d1f = 1i*k_mode.*fft_f;

% fft_d2f: second derivative
fft_d2f = -(k_mode.^2).*fft_f;

% inverse Fourier transform to get f'(x) and f''(x)
d1f = ifft(fft_d1f);
d2f = ifft(fft_d2f);

%% Explain th results
%  Visual comparison
subplot(1,2,1); plot(x, f1, x, d1f, 'o')
subplot(1,2,2); plot(x, f2, x, d2f, 'o')

%  compare using L-\infty norm
%  error of f'(x)
disp('maximum error for evaluating f`(x) using FFT: ')
disp(max(abs(d1f - f1)))

%  error of f''(x)
disp('maximum error for evaluating f"(x) using FFT: ')
disp(max(abs(d2f - f2)))
