%This is a basic lead model without magnetic
e0=0.1;t=1.2;
N=10;
epi0=e0;
tx=t;
ty=t;
%Use bands function to obtain band structure
bands(epi0,tx,ty,N);

%Use transmission function to obtain Transmittance
transmission(epi0,tx,ty,N);
