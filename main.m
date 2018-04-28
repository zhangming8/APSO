% An implementation of PSO in: 
% "Alireza. A., PSO with adaptive mutation and inertia weight and its application in parameter estimation of dynamic systems,
% Acta Automatica, vol. 37, no. 5, pp. 541-549, 2011."
% Operating environment: HP Z640 (20 cores), windows 7, matlab 2014  --by MingZhang 2018.4.20 
tic;clc;close all;clear all
global M 
global initial_flag
load Xrange % In Xrang, the first and second column are the range of the particle position, the last column is dimension

core_num = 20; %Parallel computing, the number of cpu core. if core_num<0 means don't use parallel computing
                %if set core_num>0, please change "for" into "parfor" in line 26
pop_size = 20; % pop size
runs = 30; % the run times independently
distcomp.feature('LocalUseMpiexec',false)
if core_num > 0
    parpool('local',core_num) % strart parallel computing
end
for i=1:20  %i=1:20, it is the function number.
    func_num=i;
    Xmin=Xrange(func_num,1); % the minimum position of paritcles
    Xmax=Xrange(func_num,2); % the maximum position of paritcles
    D=Xrange(func_num,3); % dimension
    iter_max=10000*D; % iteration
    result1=zeros(runs,iter_max);
    disp function£º,i
        for j=1:runs
%         parfor j=1:runs
            disp runs:,j
            creatematrix(D); %Generate orthogonal matrix M, will be used in f16-f20
            initial_flag=0;
            [yy1]= APSO(iter_max,pop_size,Xmax,Xmin,D,func_num); % pso algorithm    
            result1(j,:)=yy1;
        end
    mean1 = mean(result1,1); % average of runs time
    eval(['save APSO_f',num2str(func_num)]) %save result of func_num-th function 
end
toc
if core_num > 0
    delete(gcp('nocreate')) % close parallel computing
end

% %% plot figure
% semilogy(mean1,'r','LineWidth',2.2);
% hold on