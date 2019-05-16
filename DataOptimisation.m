clear all; %set up all

%import cost table
CostTable=xlsread('CostTable.xlsx');
%CostTable=CostTable(2:9,2:13); %remove unnecessary rows and column numbers

N = 12; % number of teminals

NumTrials= 50;
LearningRate=0.001;
NumberofLoop=200;

CostTable=xlsread('CostTable.xlsx');
CostTable=CostTable(2:8,2:12);
CostTrials=zeros(NumTrials,1);

% Let's start with the PV and then move on to the BS. We syart the PV with
% values of 0.5 because the first Epoch of trials should have equally
% likely 1 and zero.

ProbVector = ones(1,40); % This gives us an array 40 1's
ProbVector = ProbVector*0.5;     % This sets all the values to 0.5

ConConnects = zeros(8,1); % Empty array with each element representing a concentrator

for main = 





CostBin2Dec = @(CostIndexBin) ...        % This is an anonymous function to  
                CostIndexBin(1)*8 + ...  % get the decimal value from the 
                CostIndexBin(2)*4 + ...  % 4 binary bits
                CostIndexBin(3)*2 + ...
                CostIndexBin(4)*1;
