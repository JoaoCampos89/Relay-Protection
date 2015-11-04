function Y = KANG_FFC(janela)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
N = length(janela);

teta = 2*pi/N;

Xre = 0;
Xim = 0;

for m = 0:N-1
    
    Xre=Xre + (2/N)*janela(m+1)*cos(teta*m);
    Xim=Xim - (2/N)*janela(m+1)*sin(teta*m);
    
end

for m = 0:N/2-1
    
    Xre_odd = Xre + (2/N)*janela(2*m+1)*cos(teta*m);
    Xim_odd = Xim - (2/N)*janela(2*m+1)*sin(teta*m);
    
    Xre_even = Xre + (2/N)*janela(2*m+2)*cos(teta*m);
    Xim_even = Xim - (2/N)*janela(2*m+2)*sin(teta*m);
    
end

X_odd = complex(Xre_odd, Xim_odd);
X_even = complex(Xre_even, Xim_even);

X_dft = X_odd - X_even;

Kre = real(X_dft);
Kim = imag(X_dft);

E = Kim/( Kre*sin(teta) - Kim*cos(teta) );

X_dc = X_dft*(1+E*exp(-1i*teta))/(1-E*exp(-1i*teta));

Y = complex(Xre,Xim) - X_dc;
end

