function mrot(x,y,numofvar)
global M;
global Mturn;
global Ftemp;
for i=1:numofvar
    for j=1:numofvar
        if i==j
            Mturn(i,j)=1;
        else
            Mturn(i,j)=0;
        end
    end
end
alpha=2*pi*rand;
Mturn(x,x)=cos(alpha);
Mturn(y,y)=cos(alpha);
Mturn(x,y)=sin(alpha);
Mturn(y,x)=-sin(alpha);