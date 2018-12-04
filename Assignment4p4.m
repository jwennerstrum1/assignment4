%% read csv
try
    load('GridWorldData');
    load('GridWorldData4');
catch
    [num, txt, raw] = xlsread('test1Results.csv');
    [num1,txt1,raw1]=xlsread('smallGridWorld.csv');
    save('GridWorldData', getVarName('num'), getVarName('txt'), getVarName('raw'));
    save('GridWorldData4', getVarName('num'), getVarName('txt'), getVarName('raw'));
end

%% graph 
close all
[r, c] = size(raw1);
locations = zeros(1,3);
count = 1;
for i =1 : r
    if strcmp(raw1{i,1}, 'Iterations')
        locations(count) = i;
        count = count + 1;
    end
end


for i=1:length(locations)
   figure(i)
   hold on
   p1 = plot(num1(locations(i), :),num1(locations(i)+1,:), 'LineWidth', 2);
   p2 = plot(num1(locations(i), :),num1(locations(i)+2,:), 'LineWidth', 2);
   p3 = plot(num1(locations(i), :),num1(locations(i)+3,:), 'LineWidth', 2);
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

%% compare
close all
[r, c] = size(raw);
locations2 = zeros(1,3);
count = 1;
for i =1 : r
    if strcmp(raw{i,1}, 'Iterations')
        locations2(count) = i;
        count = count + 1;
    end
end
figNum = 1;
for i=1:length(locations)
    figure(figNum);
    figNum = figNum+1;
    hold on
    p1 = plot(num1(locations(i), :),num1(locations(i)+1,:), 'LineWidth', 2);
    p1 = plot(num(locations2(i),:), num(locations2(i)+1,:), 'LineWidth',2);
    hold off
    title('Value Iteration Comparison');
    xlabel('Iterations');
    legend('Large grid world', 'Small grid world');
    
    figure(figNum);
    figNum = figNum+1;
    hold on
    p1 = plot(num1(locations(i), :),num1(locations(i)+2,:), 'LineWidth', 2);
    p1 = plot(num(locations2(i),:), num(locations2(i)+2,:), 'LineWidth',2);
    hold off
    title('Policy Iteration Comparison');
    xlabel('Iterations');
    legend('Large grid world', 'Small grid world');
    
    figure(figNum);
    figNum = figNum+1;
    hold on
    p1 = plot(num1(locations(i), :),num1(locations(i)+3,:), 'LineWidth', 2);
    p1 = plot(num(locations2(i),:), num(locations2(i)+3,:), 'LineWidth',2);
    hold off
    title('Q learning Comparison');
    xlabel('Iterations');
    legend('Large grid world', 'Small grid world');

end
figure(1)
ylabel('Number of steps/actions to reach terminal state');
figure(2)
ylabel('Number of steps/actions to reach terminal state');
figure(3)
ylabel('Number of steps/actions to reach terminal state');

figure(4)
ylabel('Milliseconds required to generate optimal policy');
figure(5)
ylabel('Milliseconds required to generate optimal policy');
figure(6)
ylabel('Milliseconds required to generate optimal policy');

figure(7)
ylabel('Reward gained by the optimal policy per iteration');
figure(8)
ylabel('Reward gained by the optimal policy per iteration');
figure(9)
ylabel('Reward gained by the optimal policy per iteration');
