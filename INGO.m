
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NGO.
% Northern Goshawk Optimization: A New Swarm-Based Algorithm for Solving Optimization Problems
% Mohammad Dehghani1, Pavel Trojovský1, and Stepan Hubálovský2
% 1Department of Mathematics, Faculty of Science, University of Hradec Králové, 50003 Hradec Králové, Czech Republic
% 2Department of Applied Cybernetics, Faculty of Science, University of Hradec Králové, 50003 Hradec Králové, Czech Republic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% INGO
% % % % % Improved Northern Goshawk Optimization Algorithm for Global Optimization
% Haval Tariq Sadeeq and Adnan Mohsin Abdulazeez            
%1Duhok Polytechnic University, Technical College of Informatics-Akre, Duhok, Kurdistan-Iraq                     
%2Duhok Polytechnic University, Technical College of Engineering-Duhok, Duhok, Kurdistan-Iraq
% Main Paper: 
% H. T. Sadeeq and A. M. Abdulazeez, "Improved Northern Goshawk Optimization Algorithm for Global Optimization," 
% 2022 4th International Conference on Advanced Science and Engineering (ICOASE), Zakho, Iraq, 2022, pp. 89-94, 
% doi: 10.1109/ICOASE56293.2022.10075576.

%       Author and programmer: Haval Tariq Sadeeq                                                %
%       E-Mail: haval.tariq@dpu.edu.krd                                                          %
%       Homepage:https://www.researchgate.net/profile/Haval-Sadeeq                               % 
                                                                                    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
function [Score,Best_pos,NGO_curve]=NGO(Search_Agents,Max_iterations,Lowerbound,Upperbound,dimensions,objective)
tic

disp('PLEASE WAIT, The program is running.')

Lowerbound=ones(1,dimensions).*(Lowerbound);                              % Lower limit for variables
Upperbound=ones(1,dimensions).*(Upperbound);                              % Upper limit for variables


X=[];
X_new=[];
fit=[];
fit_new=[];
NGO_curve=zeros(1,Max_iterations);



%%
for i=1:dimensions
    X(:,i) = Lowerbound(i)+rand(Search_Agents,1).*(Upperbound(i) -Lowerbound(i));              % Initial population
end
for i =1:Search_Agents
    L=X(i,:);
    fit(i)=objective(L);                    % Fitness evaluation (Explained at the top of the page. )
end


for t=1:Max_iterations  % algorithm iteration
    
    %%  update: BEST proposed solution
    [best , blocation]=min(fit);
    
    if t==1
        xbest=X(blocation,:);                                           % Optimal location
        fbest=best;                                           % The optimization objective function
    elseif best<fbest
        fbest=best;
        xbest=X(blocation,:);
    end
    
    
    %% UPDATE Northern goshawks based on PHASE1 and PHASE2
    
    for i=1:Search_Agents
        %% Phase 1: Exploration
       % I=round(1+rand);
       % I=2.0;
        k=randperm(Search_Agents,1);
        P=X(k,:); % Eq. (3)
        F_P=fit(k);
        beta=1.5;
sigma=(gamma(1+beta)*sin(pi*beta/2)/(gamma((1+beta)/2)*beta*2^((beta-1)/2)))^(1/beta);
u=randn(1,dimensions)*sigma;
v=randn(1,dimensions);
step=u./abs(v).^(1/beta);
LF=step.*0.01;

    k=1.99*(0.99-(t/Max_iterations));
  
    I=round(1+rand(1,1)); %1 or 2
    K=k*I; % Eq. (12)
       % if I==2
        if fit(i)> F_P 
            X_new(i,:)=X(i,:)+rand(1,dimensions) .*(P-I.*X(i,:)); % Eq. (4)
        else
             X_new(i,:)=X(i,:)+LF .* (X(i,:)-P); % Eq. (7)
        end
        X_new(i,:) = max(X_new(i,:),Lowerbound);X_new(i,:) = min(X_new(i,:),Upperbound);
        
        % update position based on Eq (5)
        L=X_new(i,:);
        fit_new(i)=objective(L);
        if(fit_new(i)<fit(i))
            X(i,:) = X_new(i,:);
            fit(i) = fit_new(i);
        end
        %% END PHASE 1
        
        %% PHASE 2 Exploitation
        X_new(i,:)= X(i,:) + (0.0001*2*k*rand(1,dimensions)-k).*X(i,:)+K; %Eq. (10)
       %%Boundary Check
        X_new(i,:) = max(X_new(i,:),Lowerbound);X_new(i,:) = min(X_new(i,:),Upperbound);
        
        % update position based on Eq (8)
        L=X_new(i,:);
        fit_new(i)=objective(L);
        if(fit_new(i)<fit(i))
            X(i,:) = X_new(i,:);
            fit(i) = fit_new(i);
        end
        %% END PHASE 2
        
    end% end for i=1:N
    
    %%
    %% SAVE BEST SCORE
    best_so_far(t)=fbest; % save best solution so far
    average(t) = mean (fit);
    Score=fbest;
    Best_pos=xbest;
    NGO_curve(t)=Score;
end
%%

end


