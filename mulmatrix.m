function mulmatrix(numofvar)
global M;
global Mturn;
global Ftemp;
for i=1:numofvar
    for j=1:numofvar
        Ftemp(i,j)=0;
        for k=1:numofvar
            Ftemp(i,j)=Ftemp(i,j)+M(i,k)*Mturn(k,j);
        end
    end
end
for i=1:numofvar
    for j=1:numofvar
        M(i,j)=Ftemp(i,j);
    end
end