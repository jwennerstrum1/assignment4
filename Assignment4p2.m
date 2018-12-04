%% read csv
try
    load('GridWorldData2');
catch
    [num, txt, raw] = xlsread('Qlearning2.csv');
    save('GridWorldData2', getVarName('num'), getVarName('txt'), getVarName('raw'));
end

%% graph 
close all
[r, c] = size(raw);
locations = zeros(1,3);
count = 1;
for i =1 : r
    if strcmp(raw{i,1}, 'actions')
        locations(count) = i;
        count = count + 1;
    end
end

iterations = 1:100;
index = [1,3,5];
for i=1:3
   figure(i)
   hold on
   for j = 1:length(locations)
    p1 = plot(iterations,num(locations(j)+index(i),:), 'LineWidth', 2);
   end
   
%    p2 = plot(iterations,num(locations(i)+2,:), 'LineWidth', 2);
%    p3 = plot(iterations,num(locations(i)+3,:), 'LineWidth', 2);
%    xlabel('Iterations');
   legend('e = 0.1', 'e = 0.2', 'e = 0.5', 'e = 0.7', 'e = 0.02');
   hold off
end

figure(1)
ylabel('Number of steps/actions to reach terminal state');
figure(2)
ylabel('Milliseconds required to generate optimal policy');
figure(3)
ylabel('Reward gained by the optimal policy per iteration');



   

    
    