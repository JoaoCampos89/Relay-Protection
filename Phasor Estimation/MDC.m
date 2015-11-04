function Y=MDC(window)
%% Modified Cossine Filter
% The modified cossine algorithm is presented in <http://www.google.com/patents/US6154687 patent US6154687>.
% This algorithm filters the DC exponential decay using the cossine superior filter
% capabilities 

%%
% $N$ - window length
N = length(window)-1;
%%
% The windows are separated in old and new
oldWindow = window(1:N);
newWindow = window(2:N+1);
%%
% $\theta=\frac{2\pi}{N}$
%%
% $\theta$ is the rotation angle in the unitary circle
teta = 2*pi/N;
%%
% variables initiation
XreOld = 0;
XreNew = 0;
%%
% Phasor real part estimation using FCDFT
%
% $Xold_{re}=\frac{2}{N}\sum^{N-1}_{n=1} window_{n}\cos(n\theta)$
% $Xnew_{re}=\frac{2}{N}\sum^{N+1}_{n=2} window_{n}\cos(n\theta)$

for m=0:N-1
    %%
    % Real phasor computation with old window
    XreOld = XreOld + (2/N)*oldWindow(m+1)*cos(teta*m);
    %%
    % Real phasor computation with new window
    XreNew = XreNew + (2/N)*newWindow(m+1)*cos(teta*m);
end
%%
% Cossine modified algorithm
% Y_{re}[k]=Xnew_{re}.
% Y_{im}[k]=\dfrac{Y_{re}[k-1]-Y_{re}[k]\cos\theta}{\sin\theta}.,
Yre = XreNew;
Yim = (XreOld-XreNew*cos(teta))/sin(teta);

% Phasor Estimation
Y = complex(Yre,Yim);