

%% 
% NGO.
% Northern Goshawk Optimization: A New Swarm-Based Algorithm for Solving Optimization Problems
% Mohammad Dehghani1, Pavel Trojovský1, and Stepan Hubálovský2
% 1Department of Mathematics, Faculty of Science, University of Hradec Králové, 50003 Hradec Králové, Czech Republic 
% 2Department of Applied Cybernetics, Faculty of Science, University of Hradec Králové, 50003 Hradec Králové, Czech Republic 

% " Optimizer"
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%%
function func_plot(fun_name)

[lowerbound,upperbound,dimension,fitness]=fun_info(fun_name);

switch fun_name 
    case 'F1' 
        x=-100:2:100; y=x; %[-100,100]
        
    case 'F2' 
        x=-100:2:100; y=x; %[-10,10]
        
    case 'F3' 
        x=-100:2:100; y=x; %[-100,100]
        
    case 'F4' 
        x=-100:2:100; y=x; %[-100,100]
    case 'F5' 
        x=-200:2:200; y=x; %[-5,5]
    case 'F6' 
        x=-100:2:100; y=x; %[-100,100]
    case 'F7' 
        x=-1:0.03:1;  y=x  %[-1,1]
    case 'F8' 
        x=-500:10:500;y=x; %[-500,500]
    case 'F9' 
        x=-5:0.1:5;   y=x; %[-5,5]    
    case 'F10' 
        x=-20:0.5:20; y=x;%[-500,500]
    case 'F11' 
        x=-500:10:500; y=x;%[-0.5,0.5]
    case 'F12' 
        x=-10:0.1:10; y=x;%[-pi,pi]
    case 'F13' 
        x=-5:0.08:5; y=x;%[-3,1]
    case 'F14' 
        x=-100:2:100; y=x;%[-100,100]
    case 'F15' 
        x=-5:0.1:5; y=x;%[-5,5]
    case 'F16' 
        x=-1:0.01:1; y=x;%[-5,5]
    case 'F17' 
        x=-5:0.1:5; y=x;%[-5,5]
    case 'F18' 
        x=-5:0.06:5; y=x;%[-5,5]
    case 'F19' 
        x=-5:0.1:5; y=x;%[-5,5]
    case 'F20' 
        x=-5:0.1:5; y=x;%[-5,5]        
    case 'F21' 
        x=-5:0.1:5; y=x;%[-5,5]
    case 'F22' 
        x=-5:0.1:5; y=x;%[-5,5]     
    case 'F23' 
        x=-5:0.1:5; y=x;%[-5,5]  
end    

    

L=length(x);
f=[];

for i=1:L
    for j=1:L
        if strcmp(fun_name,'F15')==0 && strcmp(fun_name,'F19')==0 && strcmp(fun_name,'F20')==0 && strcmp(fun_name,'F21')==0 && strcmp(fun_name,'F22')==0 && strcmp(fun_name,'F23')==0
            f(i,j)=fitness([x(i),y(j)]);
        end
        if strcmp(fun_name,'F15')==1
            f(i,j)=fitness([x(i),y(j),0,0]);
        end
        if strcmp(fun_name,'F19')==1
            f(i,j)=fitness([x(i),y(j),0]);
        end
        if strcmp(fun_name,'F20')==1
            f(i,j)=fitness([x(i),y(j),0,0,0,0]);
        end       
        if strcmp(fun_name,'F21')==1 || strcmp(fun_name,'F22')==1 ||strcmp(fun_name,'F23')==1
            f(i,j)=fitness([x(i),y(j),0,0]);
        end          
    end
end

surfc(x,y,f,'LineStyle','none');

end

