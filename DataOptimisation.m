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

            
