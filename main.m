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
%1Technical Informatics College of Akre, Duhok Polytechnic University, Duhok, Kurdistan-Iraq, haval.tariq@dpu.edu.krd                      
%2Technical College of Engineering-Duhok,Duhok Polytechnic University, Duhok, Kurdistan-Iraq, adnan.mohsin@dpu.edu.krd  
                                                                                    
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

        