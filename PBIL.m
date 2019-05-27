%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Wrote by Jayden Lee
% Date: 24/05/19
% PBIL of Cost Data via Matlab Scripting. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; 

%% Anonymous Function that converts bits to decimal value

costBin2Dec = @(costIndexBin) costIndexBin(1)*4 + costIndexBin(2)*2 + costIndexBin(3);


%% Customisation Parameters: 

% Number of Trials running
NumTrials= 50;

% Learning Increment Rate
LearningRate=0.001;

% Number of Loops
NumberofLoops=200;

% End of Customisation Parameters


%% Array Generation:

% Probability Vector
ProbVector = ones(1,36)*0.5; % Default 0.5 Probabiity Vector
% Connection Enabled Array
ConConnects = zeros(1,36); % Empty array with each element representing a concentrator
%Epoch Cost Storage
EpochCost = zeros(NumberofLoops, 1);
%Cost Table
CostTable=xlsread('CostTable.xlsx');
%Remove the Unnessecrary Rows and Columns From Import
CostTable=CostTable(2:9,2:13); 


%% End of Array Generation


%%%%%%%%%%%%%%% PBIL Implementation %%%%%%%%%%%%%%%%%%%%%%

%% Main Loop
for Main = 1:NumberofLoops
    
    % Create empty array to store total cost of each trial
    TrialsCost = zeros(NumberofLoops, 1);
    % Create an epoch by creating an empty array.
    Epoch = zeros(NumberofLoops, 1);
    
    for EpochLoop = 1:NumTrials
        Epoch(EpochLoop,:) = rand(1,36)<ProbVector; 
        % Concatecates from 1 - NumTrials 1 or 0 as logic variable for this epoch. 
    end

    %Cost Calculations
    for EpochLoop = 1:NumTrials

        ConConnects = zeros(8,1); % each element representing a concentrator.
        BinCost = reshape(epoch(EpochLoop,:),3,12); %Reshapes the array to make a "binary string."




        %This Converts our Decimal Array in a Binary String. 
        for NumOfTerminal = 1:12
            costIndexDec(NumOfTerminal) = costBin2Dec(BinCost(:,NumOfTerminal));
        
            ConConnects(costIndexDec(NumOfTerminal)+1) = ConConnects(costIndexDec(NumOfTerminal)+1) + 1;
        end



        % Retrieve data
        for NumOfTerminal = 1:12
            tmp = costTable(costIndexDec(NumOfTerminal)+1,NumOfTerminal);
            TrialsCost(EpochLoop,1) = TrialsCost(EpochLoop,1) + tmp;
        end
        

        % Check if trial is viable
        for NumofConc = 1:8
           if ConConnects(NumofConc,1)>3
               TrialsCost(EpochLoop,1) = 6666;
           end
        end

    % Find minimum value and its index
    [minumumValue,minIndex] = min(TrialsCost);
    costMinProgressive(mainLoop) = minumumValue;
    
    % Locate minimum epoch and update the probability vector 
    EpochMin = Epoch(minIndex,:);
    for i = 1:36
        if EpochMin(i) > 0
            ProbVector(1,i) = ProbVector(1,i) + learningRate;
            if ProbVector(1,i) > 1
                ProbVector(1,i) = 1;
            end
        else
            ProbVector(1,i) = ProbVector(1,i) - learningRate;
            if ProbVector(1,i) < 0
                ProbVector(1,i) = 0;
            end
        end
    end  
end
        
    
end
    
