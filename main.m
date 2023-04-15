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
clc
clear
close all

SearchAgents=30; 
Fun_name='F23';  
Max_iterations=1000; 
[lowerbound,upperbound,dimension,fitness]=fun_info(Fun_name);
[Score,Best_pos,NGO_curve]=INGO(SearchAgents,Max_iterations,lowerbound,upperbound,dimension,fitness);

figure('Position',[300 300 660 290])

subplot(1,2,1);
fun_plot(Fun_name);
title('Objective space')
xlabel('x_1');
ylabel('x_2');
zlabel([Fun_name,'( x_1 , x_2 )'])

subplot(1,2,2);
plots=semilogx(NGO_curve,'Color','g');
set(plots,'linewidth',2)
hold on
title('Objective space')
xlabel('Iterations');
ylabel('Best score');

axis tight
grid on
box on
legend('INGO')


display(['The best solution obtained by INGO is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by INGO is : ', num2str(Score)]);

        