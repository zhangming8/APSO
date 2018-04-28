function [yy4]=APSO(maxgen,sizepop,Xmax,Xmin,D,func_num)

Vmax=(Xmax-Xmin);
Vmin=-Vmax;
%% Initialization
for i=1:sizepop
      X(i,:)=(Xmax-Xmin)*rands(1,D)+Xmin; 
      V(i,:)=(Vmax-Vmin)*rands(1,D)+Vmin;
      fitness(i)=MDAPSOfunction(X(i,:),func_num);  
end

%% Initialization gbest and pbest
[bestfitness bestindex]=min(fitness);
gbest=X(bestindex,:);  
pbest=X;   
fitnesspbest=fitness; 
fitnessgbest=bestfitness;  
a=fitnessgbest;
%% iterate
for i=1:maxgen
    W(i)=0.5*(1+tanh(fitnessgbest/a)); % inertia weight
    M(i)=Xmax*(tanh(fitnessgbest/a));
    a=0.6;
    for j=1:sizepop
        c1 = 2 ;
        c2 = 2;
        V(j,:) =W(i)*V(j,:) +c1*rand*(pbest(j,:) -X(j,:)) + c2*rand*(gbest - X(j,:));
        % update v
        V(j,find(V(j,:)>Vmax))=Vmax;
        V(j,find(V(j,:)<Vmin))=Vmin;
        % update x
        X(j,:)=X(j,:)+V(j,:);
        X(j,:)=X(j,:)+M(i)*randn; % mutation
        X(j,find(X(j,:)>Xmax))=Xmax;
        X(j,find(X(j,:)<Xmin))=Xmin;
        % evaluate fitness
        fitness(j)=MDAPSOfunction(X(j,:),func_num);
        % update pbest
        if fitness(j) < fitnesspbest(j)
            pbest(j,:) = X(j,:);
            fitnesspbest(j) = fitness(j);
        end
        % update gbest
        if fitness(j) < fitnessgbest
            gbest = X(j,:);
            fitnessgbest = fitness(j);
        end    
    end
%     X(j,:)=X(j,:)+M(i)*randn;
    yy4(i)=fitnessgbest; 
end

  
  
