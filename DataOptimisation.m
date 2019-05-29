clear all;

NumTrials=100;
LearningRate=0.001;
numLoops=2000;

CostTable= xlsread('CostTable.xlsx');
CostTable=CostTable(2:9,2:13);

CostTrials=zeros(NumTrials,1);

PV=ones(1,36)*0.5;

Epoch=zeros(NumTrials,36);

CostBin2Dec = @(CostIndexBin) ...        % This is an anonymous function to  
                CostIndexBin(1)*4 + ...  % get the decimal value from the 
                CostIndexBin(2)*2 + ...  % 4 binary bits
                CostIndexBin(3);
ConcentorConnections = zeros(8,1);
    
        
        for TerminalNum = 1:12
            Tmp = CostTable(CostIndexDec(TerminalNum)+1,TerminalNum);
            CostTrials(EpochLoop,1) = CostTrials(EpochLoop,1) + Tmp;
        end
        % Lets check if this is a legal trial.if not legal, set its cost
        % to 9999
        for ConcentratorNum = 1:8
            if ConcentratorConnections(ConcentratorNum,1)>3
                CostTrials(EpochLoop,1) = 9999;
            end
        end
    end
    % Now let us find the index of the minimum cost trial, we can then
    % use this to find the 36 bit binary string that corresponds to
    % this
    [MinimumValue,MinIndex]= Min(CostTrials);
    CostMinProgressive(Mainloop) = MinimumValue;
    % Test to see if we are finished
    if Mainloop > 20
            if std(CostMinProgressive(1,ebd-10:end)) == 0
            break
        end
    end
    % Then EpochMin is found as follows 
    EpochMin = Epoch(MinIndex,1);
    % Write Some Code that updates the PV
        for j = 1:36
            if EpochMin(j) > 0
                PV(i,j) = PV(i,j) + LearningRate;
            if PV(i,j) > 1
                PV(i,j)=1;
            else
                PV(i,j) = PV(i,j) - LearningRate;
            if PV(i,j) < 0
                PV(i,j)=0;
            end
        end
     end
    % End of the main loop
end

%% Give some Results

figure
subplot(2,2,1);
plot(CostMinProgressive);
title('Progressive minimums');

subplot(2,2,2);
pie(ConcentratorConnections');
title('Connection per Concentrator');

subplot(2,2,3);
bar(CostIndexDec);
title('Connections selected per terminal');

subplot(2,2,4);
plot(CosMinProgressive(1,end-10:end));
titletxt = strcat('Final value:', num2str(CostMinProgressive(1,end)));
title(titletxt);