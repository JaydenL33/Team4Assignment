clear all; 

%import cost table
CostTable=xlsread('CostTable.xlsx');
%remove unnecessary rows and column numbers
CostTable=CostTable(2:9,2:13); 

%size of epoch
NumTrials= 50;
LearningRate=0.001;
NumberofLoops=200;
NT = 12; % number of teminals


% Create Probability Vector.
PV= ones(1,40); %multiply by 0.5 so that it is a 50-50 chance of being a zero or a one.
PV = PV*0.5;     % This sets all the values to 0.5

ConConnects = zeros(8,1); % Empty array

for Main = 1:NumberofLoops
    % Create an epoch
    Epoch = zeros(NumTrials, 36);
    % Create empty array to store the trail cost
    TrialCost = zeros(NumTrials, 1);
    
    % Calculate the minimum cost of each trail vector
    for EpochLoop = 1:NumTrials
        ConConnects  = zeros(8,1);
        Epoch(EpochLoop, :) = RandomBinaryCost < PV; %Random Binary array
        
        RandomBinaryCost = reshape(Epoch(EpochLoop, :), 12,3);
       
        
        % Create binary matrix (12 by 3)
        for RowNum = 1:N
            CostTableRow(RowNum) = ConvertBinary2Number(RandomBinary(RowNum, :));
            ConConnects(CostTableRow(RowNum)+ 1) = ConConnects(CostTableRow(RowNum)+1) +1;
        end
    end
   
        %Verifying if there are more than three terminals connected to one concentrator
        for NumbConnector = 1:8
            if ConConnects(NumConnector, 1) > 3
                TrialCost(EpochLoop, 1) = 1000;
            end
        end
        
      %Choosing the best Trail
       for RowNum = 1:NT
           AssoCost = CostTable(CostTableRow(CostNum)+1,RowNum);
           TrailsCost(EpochLoop,1) 
       end
       
      %Best Epoch 
      MinEpoch = Epoch(MinElement, :); 
      
      %Update the probability Vector
      for i = 1:36                              
        if MinEpoch(i) > 0
             PV(1,i) = PV(1,i) - LearningRate;
            if PV(1,i) < 0
                PV(1,i) = 0;
            end
        else
           PV(1,i) = Pb(1,i) - LearningRate;
            if PV(1,i) < 0
                PV(1,i) = 0;
            end
        end
      end
end
       
%Plot
subplot(2,2,1);
Plot(MinCost);
title(MinimumCosts);

%pie chart


    