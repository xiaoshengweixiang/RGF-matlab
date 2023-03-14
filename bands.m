function bands(T0,Tx,Ty,N,Txy,num)
    if nargin < 4
        N = 1; % default value for width
    end
    if nargin < 5
        Txy = zeros(length(T0)); % default value for Txy
    end
    if nargin < 6
        num = 1001;
    end
    state=length(T0);
    H00=kron(eye(N),T0)+kron(diag(ones(1,N-1),1),Ty)+kron(diag(ones(1,N-1),-1),Ty');
    H01=kron(eye(N),Tx)+kron(diag(ones(1,N-1),-1),Txy);
    Energy=zeros(state*N,num);
    k=linspace(-1,1,num);
    for i=1:num
        H=H00+H01*exp(1j*k(i)*pi)+H01'*exp(-1j*k(i)*pi);
        eigenvalue=eig(H);
        Energy(:,i)=real(eigenvalue);
    end
    figure;
    plot(k,Energy,'black')
    xlabel('kx/pi')
    ylabel('E')
    text=sprintf('band stucture');
    title(text);
end