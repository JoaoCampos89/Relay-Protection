function Y=FCDFTMimic(window)
%% Full cycle Fourier with mimic filter
% The mimic filter usage avoids the DC exponential decay offset 
% <http://ieeexplore.ieee.org/xpl/login.jsp?tp=&arnumber=400869&url=http%3A%2F%2Fieeexplore.ieee.org%2Fiel3%2F61%2F9038%2F00400869.pdf%3Farnumber%3D400869 Digital Mimic Filter>

% Time constant in cycles
tau = 1;
% Computes the gain and the time constant (unities) based in the time constant
% (Cycles). It is assuming a unitary gain for 60 Hz
[K,taud] = mimicParameters(tau);
% Samples per cycle in 60 Hz signal
N = length(window)-1;

% The windows are separated in old and new
oldWindow = window(1:N);
newWindow = window(2:N+1);

%   Algorithm variables
teta = 2*pi/N;
XreOld = 0;
XimOld = 0;
XreNew = 0;
XimNew = 0;

for m = 0:N-1
    %Real and Imaginary phasor computations with old window
    XreOld = XreOld + (2/N)*oldWindow(m+1)*cos(teta*m);
    XimOld = XimOld - (2/N)*oldWindow(m+1)*sin(teta*m);
    
    %Real and Imaginary phasor computations with new window
    XreNew = XreNew + (2/N)*newWindow(m+1)*cos(teta*m);
    XimNew = XimNew - (2/N)*newWindow(m+1)*sin(teta*m);    
end

%   Phasor result with old window
XOld = complex(XreOld, XimOld);


%   Phasor result with new window
XNew = complex(XreNew, XimNew);

%   Digital mimic computation
Y = K*( (1+taud)*XNew - taud*XOld );


