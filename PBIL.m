%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Wrote by Jayden Lee
% Date: 24/05/19
% PBIL of Cost Data via Matlab Scripting. 

% One of the errors we are getting is that the probability cost is always
% Heading towards 1 instead of having some divation which means that potentially we can 
% be stuck on local miniums and the program doesn't worked as instead. Therefore 
% there should be some mutations factor. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear all; 

%% Anonymous Function that converts bits to decimal value

costBin2Dec = @(costIndexBin) costIndexBin(1)*4 + costIndexBin(2)*2 + costIndexBin(3);


%% Customisation Parameters: 

% Number of Trials running
NumberOfTrials= 100;

% Learning Increment Rate
LearningRate=0.005;

% Number of Loops
NumberofLoops=2000;

% End of Customisation Parameters


%% Array Generation:

% Probability Vector
ProbVector = ones(1,36)*0.5; % Default 0.5 Probabiity Vector
% Connection Enabled Array
ConcConnect = zeros(8,1);   % Empty array with each element representing a concentrator
%Epoch Cost Storage
EpochCost = zeros(NumberofLoops, 1);
%Cost Table
CostTable=xlsread('CostTable.xlsx');
%Remove the Unnessecrary Rows and Columns From Import
CostTable=CostTable(2:9,2:13); 


%% End of Array Generation


%% Main Loop
for MainLoop = 1:NumberofLoops

    Epoch = zeros(NumberOfTrials,36);
    % Create an epoch by creating an empty array.

    CostTrials = zeros(NumberOfTrials,1);
    % Create empty array to store total cost of each trial

    for EpochLoop = 1:NumberOfTrials %% HAS TO BE DONE FIRST TO FILL ARRAY. 
        Epoch(EpochLoop,:) = rand(1,36)<ProbVector;
        % Concatecates from 1 - NumTrials 1 or 0 as logic variable for this epoch. 
    end


     %Cost Calculations
    for EpochLoop = 1:NumberOfTrials
        ConcentratorConnections = zeros(8,1); % each element representing a concentrator.
        BinCost = reshape(Epoch(EpochLoop,:),3,12); %Reshapes the array to make a "binary string."

        %This Converts our Decimal Array in a Binary String and allows us to search Cost Table. 
        for NumOfTerminal = 1:12
            CostIndexDec(NumOfTerminal) = ...
            costBin2Dec(BinCost(:,NumOfTerminal));
            ConcentratorConnections(CostIndexDec(NumOfTerminal)+1) ...
            = ConcentratorConnections(CostIndexDec(NumOfTerminal)+1) + 1;
        end


        % Retrieve data for Trial Cost
        for NumOfTerminal = 1:12
            Tmp = CostTable(CostIndexDec(NumOfTerminal)+1,NumOfTerminal);
            CostTrials(EpochLoop,1) = CostTrials(EpochLoop,1) + Tmp;
        end



        % Check if trial is viable/legal trial. 
        for ConcentratorNum = 1:8
           if ConcentratorConnections(ConcentratorNum,1)>3
               CostTrials(EpochLoop,1) = 9999;
           end
        end
    end


 % This finds the minnium cost value and the assigned 36 bit index that is associated with that cost.


    [minVal,minCounter] = min(CostTrials);
    costMinDisplay(MainLoop) = minVal;

    % Creates Array minEpoch and does the calculation in order to find minimum Epoch
    minEpoch = Epoch(minCounter,:);
    for i = 1:36
        if minEpoch(i) > 0
            ProbVector(1,i) = ProbVector(1,i) + LearningRate;
            if ProbVector(1,i) > 1
                ProbVector(1,i) = 1;
            end
        else
            ProbVector(1,i) = ProbVector(1,i) - LearningRate;
            if ProbVector(1,i) < 0
                ProbVector(1,i) = 0;
            end
        end
   end

    
% End of Functionality

end

%Data Visualisation

figure
plot(costMinDisplay);
title('Minimised Value');