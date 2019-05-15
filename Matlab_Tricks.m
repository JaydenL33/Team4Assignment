%% Here are some Matlab tricks when doing the Optimization Assignment
%
% Let us assume that we have a binary string (BS) of 40 digits that fully 
% describe our solution. These are all values of either 0 or 1. 
%
% For the PBIL algorithm, we therefore need a Probability Vector (PV) of values
% that range from 0 to 1. They are real numbers with arbitrary number of
% decimal points.
%
% Let's start with the PV and then move on to the BS. We syart the PV with
% values of 0.5 because the first Epoch of trials should have equally
% likely 1 and zero.

PV = ones(1,40); % This gives us an array 40 1's
PV = PV*0.5;     % This sets all the values to 0.5

%% Now let us create a single trial of 40 1 and 0 based on the PV

Trial = rand(1,40)>=PV; % The rand function creates a single row of 40 
                        % values from 0 and 1.
                        % The >= function compares each one to the
                        % corresponding value in the PV. If it is greater or
                        % equal to it, it sets it to 1. If it is less than
                        % the value in the PV, it sets it to 0.
                        
%% Now let's make an Epoch. Let's assume we have 50 Trials in an Epoch

Epoch = rand(50,40)>=PV; % Now the rand function creates 50 rows of 40 random
                         % from 0 to 1. It then scans through each row,
                         % testing to see if each value is >= to the
                         % corresponding value in the PV
                         
%% Some other useful stuff
% Let's say that you are using 4 bits to indicate which concentrator each
% terminal is connected to. That means that you want to extract 4 bits at a
% time from the trial.

% Easiest is to use the reshape function in Matlab

TrialR = reshape(Trial,4,10);  % This changes your 1 by 40 array into a 
                               % 4 by 10 array
                               
TrialR1 = TrialR(:,1);  % This extracts the first terminals values
TrialR5 = TrialR(:,5);  % This extracts the fifth terminals values

%% Now let's create a simple local function that will convert these binary 
% digits to a decimal value. (Perhaps use this to index into the cost table.

CostBin2Dec = @(CostIndexBin) ...        % This is an anonymous function to  
                CostIndexBin(1)*8 + ...  % get the decimal value from the 
                CostIndexBin(2)*4 + ...  % 4 binary bits
                CostIndexBin(3)*2 + ...
                CostIndexBin(4)*1;

CostBin2Dec(TrialR1)   % or
CostBin2Dec(TrialR5)   
