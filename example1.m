N=10;
state=4;
w=1;v=4;
T0=[0,w,w,0;w,0,0,w;w,0,0,w;0,w,w,0];
Tx=zeros(state);
Tx(1,3)=v;
Tx(2,4)=v;
Ty=zeros(state);
Ty(1,2)=v;
Ty(3,4)=v;
bands(T0,Tx,Ty,N);
transmission(T0,Tx,Ty,N);

