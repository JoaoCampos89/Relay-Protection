function X=FCDFT(window)
%% Full Cycle Fourier algorithm 
% This algorithm computes the phasor with a full windom length
% Source: Thorp, J. S., & Phadke, Arun G. (2009). Computer Relaying for Power Systems. John Wiley & Sons.
%%
% $N$ - window length
N = length(window);

%%
% $\theta=\frac{2\pi}{N}$
%%
% $\theta$ is the rotation angle in the unitary circle
teta = 2*pi/N;
%%
% $X_{re}$ - phasor real part
Xre = 0;
%%
% $X_{im}$ - phasor imaginary part
Xim = 0;
%%
% Phasor Computation of each part
%
% $X_{re}=\frac{2}{N}\sum^{N}_{n=1} window_{n}\cos(n\theta)$
%
% $X_{im}=\frac{2}{N}\sum^{N}_{n=1} window_{n}\sin(n\theta)$

for m = 1:N
    
    Xre = Xre + (2/N)*window(m)*cos(teta*m);
    Xim = Xim - (2/N)*window(m)*sin(teta*m);
    
end
%%
% $X$ - Phasor computation result
X = complex(Xre, Xim);

