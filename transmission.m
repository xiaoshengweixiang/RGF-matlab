function transmission(T0,Tx,Ty,N,Txy,Emin,Emax,num)
    if nargin < 8
        num = 1001; % default value for num
    end
    if nargin < 7
        Emax =  5; % default value for num
    end
    if nargin < 6
        Emin = -5; % default value for num
    end
    if nargin < 4
        N = 1; % default value for state
    end
    if nargin < 5
        Txy = zeros(length(T0)); % default value for state
    end
    Ef=linspace(Emin,Emax,num);
H00=kron(eye(N),T0)+kron(diag(ones(1,N-1),1),Ty)+kron(diag(ones(1,N-1),-1),Ty');
H01=kron(eye(N),Tx)+kron(diag(ones(1,N-1),-1),Txy);
state=length(H00)/N;
for i=1:num
    
    E=Ef(i)+1j*10^(-6);
    time=25;
    ai=H01;bi=H01';ei=H00;eg=H00;
    for j=1:time
        mm=inv(E*eye(state*N)-ei);
        eg=eg+ai*mm*bi;
        ei=ei+ai*mm*bi+bi*mm*ai;
        ai=ai*mm*ai;bi=bi*mm*bi;
    end
    gr=inv(E*eye(state*N)-eg);
    hgh_R=H01*gr*H01';
    
    H10=H01';
    time=25;
    ai=H10;bi=H10';ei=H00;eg=H00;
    for j=1:time
        mm=inv(E*eye(state*N)-ei);
        eg=eg+ai*mm*bi;
        ei=ei+ai*mm*bi+bi*mm*ai;
        ai=ai*mm*ai;bi=bi*mm*bi;
    end
    gr=inv(E*eye(state*N)-eg);
    hgh_L=H10*gr*H10';
    
    GR_ii=inv(E*eye(state*N)-H00-hgh_L);
    GR_1j=GR_ii;
    
    for k=2:N
        GR_ii=inv(E*eye(state*N)-H00-H10*GR_ii*H01);
        GR_1j=GR_1j*H01*GR_ii;
    end

    GR_ii=inv(inv(GR_ii)-hgh_R);
    GR_1j=GR_1j+GR_1j*hgh_R*GR_ii;

    T_R=1j*(hgh_R-hgh_R');
    T_L=1j*(hgh_L-hgh_L');

    T_LR(i)=real(trace(T_L*GR_1j*T_R*GR_1j'));
end
figure;
plot(Ef,T_LR)
xlabel('Ef')
ylabel('T_{LR}')
title('Conductance')
end