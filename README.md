
# Team4DataOptimisation

#                     A Github Repo for Team 4 of Data Engineering Class's Data Optimisation Project IDEAS: 

The Following Project is to create a Terminal Assignment Solution using Machine Learning / Stochastic Optimization.

The following info can be found on graphs inside of the Optimization Task description from UTS Online. 12 x 8 Grid with Terminal in the Vertical and Concentrator in the Horizontal.

The process of optimisation relates to the cost of each Concentrator Connection. The cost of each connection is defined inside of the cost table in an excel spreadsheet.

Array Connectivity(x,y), represented with CONNECT(x,y) will be a table with related horizontal and vertical variables as a logic table, either being on or off.

Array Cost(x,y), represented with COST(x,y) with be a table with related horizontal and vertices variables as a integer table. (Cost can be either Money or speed or any measurement of work)

What we do is that we first times the CONNECT(x,y) with the COST(x,y) which will give us either 0 or the cost itself. We can randomly allocate the CONNECT table with either 0 or 1

EPOCH means iterations of iterations.

We will start the probability vector as 0.5 for our initial epoch in which the change the connectivity table and find the most optimal solution, which gets us the lowest sum of the variables. From the change of 0 and 1, we can change the probability vector in order make it more likely that the cost will either be on or off, based on random int. For example, if the probability vector is 0.66, it's 66% likely, we will get 1.

Afterwards, find the minimum solution but summating and then change the probability vector by some amount in order in increase or decrease the rate of appearance.


# Solution README.md

Customistation can be done inside of the code in order to change number of trials and number of loops. 
The code is a Population-Based Incremental Learning which is a method of optimisation through random generation. 
Our Code is made via Matlab. Our code works on the idea of connections and limited numbers of them. 
We proform a calculation on a random generation and compare that against our Probability Vector in order to generate our Randomised Solution. 
One of the problems is the fact that our Probability Vector always maximises to 1 when in reality, in order to assure the most efficent code, 
we should impliment some sort of mutation factor which shifts the probabilty vector randomly in some direction. 

Our probabilty vector updated just moves it by the learning rate and if it out of bounds, sets it to the correct value. 
