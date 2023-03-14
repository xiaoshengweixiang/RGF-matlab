N=10;
state=4;
w=1;v=4;
epi0=[0,w,w,0;w,0,0,w;w,0,0,w;0,w,w,0];
tx=zeros(state);
tx(1,3)=v;
tx(2,4)=v;
ty=zeros(state);
ty(1,2)=v;
ty(3,4)=v;
bands(epi0,tx,ty,N);
transmission(epi0,tx,ty,N);

