function creatematrix(numofvar)
global M;
global Mturn;
global Ftemp;
for i=1:numofvar
    for j=1:numofvar
        if i==j
            M(i,j)=1;
        else
            M(i,j)=0;
        end
    end
end
for i=2:numofvar
    mrot(1,i,numofvar);
    mulmatrix(numofvar);
end
for i=2:numofvar-1
    mrot(1,i,numofvar);
    mulmatrix(numofvar);
end