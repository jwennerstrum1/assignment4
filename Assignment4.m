%% read csv
try
    load('GridWorldData');
catch
    [num, txt, raw] = xlsread('test1Results.csv');
    save('GridWorldData', getVarName('num'), getVarName('txt'), getVarName('raw'));
end

%% graph 
close all
[r, c] = size(raw);
locations = zeros(1,3);
count = 1;
for i =1 : r
    if strcmp(raw{i,1}, 'Iterations')
        locations(count) = i;
        count = count + 1;
    end
end


for i=1:length(locations)
   figure(i)
   hold on
   p1 = plot(num(locations(i), :),num(locations(i)+1,:), 'LineWidth', 2);
   p2 = plot(num(locations(i), :),num(locations(i)+2,:), 'LineWidth', 2);
   p3 = plot(num(locations(i), :),num(locations(i)+3,:), 'LineWidth', 2);
   xlabel('Iterations');
   legend('Value Iteration', 'Policy Iteration', 'Q-Learning');
   hold off
end

figure(1)
ylabel('Number of steps/actions to reach terminal state');
figure(2)
ylabel('Milliseconds required to generate optimal policy');
figure(3)
ylabel('Reward gained by the optimal policy per iteration');
figure(4)
ylabel('Reward gained by the optimal policy per iteration');


   

    
    