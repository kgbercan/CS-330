##############################
# Intro to R Ex 1
# March 2016
##############################

#---------------------------------------------------------------
# 0.  This is an R file. It ends in .R
# You can run this file using source("ProgLang1ex.R", echo=T)
# You can also install the knitr package with
# install.packages("knitr")
# then make a web page out of this file using the command
# library(knitr)
# spin("ProgLang1ex.R")
#---------------------------------------------------------------

#---------------------------------------------------------------
# 1. Atomic elements
# Create a variable called myroll, and set its value to the value
# you recorded in your log
myroll <- 3

# 1.1 Print the value of myroll
myroll

# 1.2 Is myroll equal (==) to 6?
myroll == 6

# 1.3 Is myroll > 3?
myroll > 3

# 1.4 Is myroll even? (check modulus operator)
myroll%%2 == 0

#---------------------------------------------------------------
#---------------------------------------------------------------

# 2. Vectors
# Create a vector using c() called myrolls of the 5 rolls recorded in your log
myrolls <- c(3,2,6,3,6)

# 2.1 Print this vector
myrolls

# 2.2 What was your 2nd roll?
myrolls[2]

# 2.3 Print the first 3 rolls
myrolls[1:3]

# 2.4 Print the 1st, 3rd, and 4th roll.
myrolls[c(1,3,4)]

# 2.5 Check if each die roll was >3.
myrolls > 3

# 2.6 Only print the rolls >2.
myrolls[myrolls>2]

# 2.7 What was the maximum roll?
max(myrolls)

# 2.8 Tabulate (table) your rolls
table(myrolls)

# 2.9 Did you have any duplicate rolls?
# Hint- you can use functions like duplicated, any, table, and unique
any(duplicated(myrolls))
length(unique(myrolls))

#---------------------------------------------------------------
#---------------------------------------------------------------

# 3.  Matrices
# Create a matrix of the dice rolls from your log using rbind() and c()

# 3.1 Create vectors called roll1, roll2, and roll3 with the 3 dice rolls
roll1 <- c(4,1)
roll2 <- c(1,2)
roll3 <- c(4,4)

# 3.2 Create a matrix called rollmat by rbind()'ing roll1, roll2, and roll3
rollmat <- rbind(roll1, roll2, roll3)

# 3.3 Set the colnames of the matrix to "die1" and "die2"
colnames(rollmat) <- c("die1","die2")

# 3.4 Print the 2nd dice roll (second row)
rollmat[2,]

# 3.5 Print the 1st die roll from the 3rd dice roll (row3, col1)
rollmat[3,1]

# 3.6 Print the second column
rollmat[,2]

# 3.7 Create a new vector called rollsum that is the first column+ the second column
rollsum <- rollmat[,1]+rollmat[,2]

# 3.8 Cbind the new vector to the matrix
rollmat <- cbind(rollmat,rollsum)

# 3.9 Print your matrix
rollmat

#---------------------------------------------------------------
#---------------------------------------------------------------

# 4. Data frame
# Create a data frame of your games table

# 4.1 Create a vector for game called gamenum,
gamenum <- c(1:5)

#                    for shooter called shooter,
shooter <- c("n","y","n","y","n")
shooter[shooter=="n"] <- FALSE
shooter[shooter=="y"] <- TRUE

#                    for first die called die1,
die1 <- c(1,4,2,4,1)

#                    for second die called die2,
die2 <- c(2,6,3,4,6)

#                    for final bet called finalbet,
finalbet <- rep(NA,5)

#                    for final sum called finalsum,
finalsum <- die1 + die2

#                and for yourresult called result
result <- c("w","l","l","l","l")
result[result=="w"] <- TRUE
result[result=="l"] <- FALSE

# 4.2 Create a dataframe called gamedf using the example as a guide
gamedf <- data.frame(game=gamenum,shooter,die1,die2,finalbet,finalsum,yourresult=result)

# 4.3 Print the shooter column using the $
gamedf$shooter

# 4.4 Create a column called firstsum (gamedf$checksum) that is the sum of die1 and die2

# 4.5 Print the subset (using ['s) of the gamedf that is only rows where finalsum<8.
gamedf[gamedf$finalsum<8,]

# 4.6 Tabulate the result column. What percentage did you win?
results <- 100*prop.table(table(gamedf$yourresult))
results[2]

# 4.7 Print the data frame
gamedf

#---------------------------------------------------------------
#---------------------------------------------------------------

# 5. List
# Create a list from one of your game records

# 5.1 Create a new list called game
game <- list()

# 5.2 Add an element to game called GameNum with the value of game from your log
game$GameNum <- 1

# 5.3 Repeat for Shooter, WinOnOpen, and Point.
game$Shooter <- TRUE
game$WinOnOpen <- FALSE
game$Point <- 10

# 5.4 Add a vector element to game called openroll with the values from the log.
game$openroll <- c(4,6)

# 5.5 Construct a data frame called logroll that has the data from your table
Roll <- c(1,2)
Die1 <- c(3,3)
Die2 <- c(1,4)
Tot <- Die1+Die2
Bet <- rep(NA,2)
Win <- c(NA,FALSE)
logroll <- data.frame(Roll,Die1,Die2,Tot,Bet,Win)

# 5.6 Add an element named logroll to your list and set the value as the logroll dataframe
game$logroll <- logroll

# 5.7 Print the list
game

# 5.8 use str(game) What do you see?
str(game)

# 5.9 Print the Point of the game.
game$Point

# 5.10 Print the 2nd logroll row 
game[["logroll"]][2,]
game$logroll[2,]

# 5.11 Did any roll have the sum of 10?
any(game$logroll$Tot==10)

#---------------------------------------------------------------
#---------------------------------------------------------------

# 6. If there is time
# look at the "useful built in functions" and experiment on how you can use them to ask questions
# about your new data structures. Also, run spin() on this file.
#
#---------------------------------------------------------------

