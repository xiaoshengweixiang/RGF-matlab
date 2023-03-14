%This is a 2D SSH model

N=10;% width of the y direction

%Input corresponding epi,tx,ty
state=4;
w=1;v=4;
epi0=[0,w,w,0;w,0,0,w;w,0,0,w;0,w,w,0];
tx=zeros(state);
tx(1,3)=v;
tx(2,4)=v;
ty=zeros(state);
ty(1,2)=v;
ty(3,4)=v;

%Use bands function to obtain band structure
bands(epi0,tx,ty,N);

%Use transmission function to obtain Transmittance
transmission(epi0,tx,ty,N);

