##############################
# Intro to R Ex 3
# March 2016
##############################

#---------------------------------------------------------------
# 0.  This is an R file. It ends in .R
# You can run this file using source("ProgLang3ex.R", echo=T)
# You can also install the knitr package with
# install.packages("knitr")
# then make a web page out of this file using the command
# library(knitr)
# spin("ProgLang3ex.R")
#---------------------------------------------------------------


#---------------------------------------------------------------
# 1. Functions

# 1.1 Create a function called rolldie that samples die (the numbers 1:6) 1 time
rolldie <- function(){
  return(sample(c(1:6),1))
}
rolldie()

# 1.2 Create a function called rolldice (as a function of n) that samples a die n times (with replacement)
rolldice <- function(n){
  d <- c(1:6)
  sample(d,n,replace = TRUE)
}
rolldice(1)
rolldice(2)
rolldice(3)

# 1.3 Create a function called setPoint. This function should:
setPoint <- function(){
  #	1. roll 2 dice using rolldice()
  r <- rolldice(2)
  # 2. add them as dicesum
  dicesum <- r[1]+r[2]
  # 3. if the sum is 7 or 11, return "You win!"
  if(dicesum%in%c(7,11)){
    return("You win!")
  #	4. if the sum is 2,3 or 12 return "You Lose!"
  }else if(dicesum%in%c(2,3,12)){
    return("You lose!")
  # 5. if neither, it should return paste("Your point is",dicesum)
  }else{return(paste("Your point is",dicesum))}
# Hint: you can use %in%, like mysum%in%c(2,3,12) etc
}
setPoint()

#---------------------------------------------------------------
#---------------------------------------------------------------
# 2 Loops
# 2.1 create an empty vector called mypoints
mypoints <- c()

# 2.2 Write a for loop that takes i from 1 to 100,runs your setPoint function, and stores the value in mypoints[i]
for(i in 1:100){
  mypoints[i] <- setPoint()
}
head(mypoints)

# 2.3 How many games did you win on the open? How many did you lose?
table(mypoints)[1]
table(mypoints)[2]

# 2.4 Write a function called playGame(). It should:
playGame <- function(){
  open <- setPoint()
  if(open=="You win!" || open=="You lose!"){
    return(open)
  }else{
    keepGoing <- TRUE
    while(keepGoing){
      newroll <- rolldice(2);
      if(sum(newroll)==7){
        keepGoing <- F;
        return("You lose! not on open");
      }else if(sum(newroll)==open){
       keepGoing <- F;
       return("You win! not on open");
      }
    }
  }
}
playGame()
  
# 2.5 use a for loop to run playGame 100000 times and save in games
games <- c()
for(i in 1:1000){
  games[i] <- playGame()
}

head(games)

# 2.6 tabulate games, calculate the winning percentage, and check against 
# http://mathworld.wolfram.com/Craps.html
prop.table(table(games))

#---------------------------------------------------------------
#---------------------------------------------------------------
# 3 Cheat

# 3.1 Create a function called cheatdice that takes in pipnum and mult

# 3.1 In that function, first, get the denominator for the probability
# this should be 5 + your multiplier 

# 3.2 Then, get a vector of 6 1/denoms called myprobs

# 3.3 Then, multiply the pipnum element of myprobs by the mult

# 3.4 Return the result of sampling 1:6 twice using prob=myprobs

# 3.5 Create a copy of your playGame function that uses this cheatroll to cheat.

# 3.6 Test your function on pipnums 1 to 6 with a mult of 5 by playing 10000 games each

# 3.7 Which is the best number to roll to win?

#---------------------------------------------------------------
#---------------------------------------------------------------
