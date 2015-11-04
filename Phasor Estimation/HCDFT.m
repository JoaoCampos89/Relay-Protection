function Y=HCDFT(window)
%% Half-Cycle Fourier algorithm
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
% $X_{re}=\frac{4}{N}\sum^{\frac{N}{2}}_{n=1} window_{n}\cos(n\theta)$
%
% $X_{im}=\frac{4}{N}\sum^{\frac{N}{2}}_{n=1} window_{n}\sin(n\theta)$


for m = 0:N/2-1
    
    %   Imaginary phasor computations with old window
    Xim = Xim - (4/N)*window(m+1)*sin(teta*m);
 
    %   Real  phasor computations 
    Xre = Xre + (4/N)*window(m+1)*cos(teta*m);
   
end


%   Phasor result
Y = complex(Xre,Xim);


