 %set up all
clear all; 

%import cost table
CostTable=xlsread('CostTable.xlsx');
%remove unnecessary rows and column numbers
CostTable=CostTable(2:9,2:13); 

N = 12; % number of teminals

%Need to run over a trail period
% These parameters can be changed
NumTrials= 50;
LearningRate=0.001;
NumberofLoops=200;

% Let's start with the PV and then move on to the BS. We syart the PV with
% values of 0.5 because the first Epoch of trials should have equally
% likely 1 and zero.

ProbVector = ones(1,40); % This gives us an array 40 1's
ProbVector = ProbVector*0.5;     % This sets all the values to 0.5

ConConnects = zeros(8,1); % Empty array with each element representing a concentrator

for Main = 1:NumberofLoops
    
    % Create empty array to store total cost of each trial
    TrialsCost = zeros(NumTrials, 1);
    % Create an epoch by creating an empty array.
    Epoch = zeros(NumTrials, 36);
    
    % Calculate the cost of each trial
    % vector in order to achieve minimum cost.
    for EpochLoop = 1:NumTrials
        ConConnects  = zeros(8,1);      % each element representing a concentrator.
                                        
        % Create a Random Binary array 12 by 3. 
        RandomBinary = rand([0 1], 1, 36);
        Epoch(EpochLoop, :) = RandomBinary < ProbVector;
        
        RandomBinary = reshape(Epoch(EpochLoop, :), 12,3);
        
        % Create binary matrix (12 by 3)
        for RowNum = 1:N
            CostTableRow(RowNum) = ConvertBinary2Number(RandomBinary(RowNum, :));
            ConConnects(CostTableRow(RowNum)+ 1) = ConConnects(CostTableRow(RowNum)+1) +1;
        end  
        
        %Checking to see if more than three terminals are connected to one
        %concentrator.
        % If so, assign TrailCost with a large number so that the trail is
        % not considered.
        for ConnectorNum = 1:8
            if ConConnects(ConnectorNum, 1) > 3
                TrialsCost(EpochLoop, 1) >= 10000;
            end
        end
        
        for RowNumber= 1:N