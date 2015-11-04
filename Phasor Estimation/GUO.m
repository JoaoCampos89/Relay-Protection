function Y=GUO(window)
%% Guo algorithm for phasor estimation
% With changes in Fourier algorithm, Guo algorithm is immune to the DC
% exponential decay present in current signals during faults
% source:
% <http://ieeexplore.ieee.org/xpl/login.jsp?tp=&arnumber=1208346&url=http%3A%2F%2Fieeexplore.ieee.org%2Fiel5%2F61%2F27186%2F01208346.pdf%3Farnumber%3D1208346 Article>
%


% Window length
N = length(window);

% Algorithm variables
teta = 2*pi/N;
Yre = 0;
Yim = 0;

% Partial sums
PS1 = sum(window(1:2:N));

PS2 = sum(window(2:2:N));    

% Phasor estimation with FCDFT
for m = 0:N-1
    
    Yre = Yre + (2/N)*window(m+1)*cos(m*teta);
    
    Yim = Yim - (2/N)*window(m+1)*sin(m*teta);
    
end

% Guo et al. algorithm
Y = complex(Yre,Yim-(2/N)*coth(pi/N)*(PS2-PS1));

