# Team4DataOptimisation

A Github Repo for Team 4 of Data Engineering Class's Data Optimisation Project 

The Following Project is to create a Terminal Assignment Solution using Machine Learning / Stochastic
Optimization. 

The follwing info can be found on graphs inside of the Optimization Task description from UTS Online. 
12 x 12 Grid with Terminal in the Vertical and Concentrator in the Horizontal. 

The process of optimisation relates to the cost of each Concentrator Connection. The cost of each connection 
is defined inside of the cost table in an excel spreadsheet. 

Array Connectivity(x,y), represented with CONNECT(x,y) will be a table with related horizional and vertical variables as a logic table, either being 
on or off.

Array Cost(x,y), represented with COST(x,y) with be a table with realted horizional and verticles variables as a integer table. 
(Cost can be either Money or speed or any measurement of work)

What we do is that we first times the CONNECT(x,y) with the COST(x,y) which will give us either 0 or the cost itself. We can randomly accolcate the CONNECT table with either 0 or 1

EPOCH means interations of interations. 

We will start the probability vector as 0.5 for our inital epoch in which the change the connectivity table and find the most optimal solution, which gets us the lowest sum of the variables. From the change of 0 and 1, we can change the probability vector in order make it more likely that the cost will either be on or off, based on randint. For example, if the probability vector is 0.66, it's 66% likely, we will get 1. 

Afterwards, find the minimum solution but summating and then change the probability vector by some acount in order in increase or decrease the rate of appearence. 