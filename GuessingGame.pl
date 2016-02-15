#!perl

# This program is an interactive guessing game that gives a user 7 chances to guess a number b/w 0 and 10

print("\n----------------running----------------\n\n");

#
# intro and set-up
#

$num = int(rand(11));
$try = 0;
@guess;

print("You have 7 chances to guess a number between 0 and 10. The game ends if you guess correctly or if you run out of tries.\n\n");
print("What's your name? ");
$name = <STDIN>;
chomp $name;

#
# play
#

while($try < 7 && $guess[$try-1] != $num){
    print("Guess the number: ");
    $n = <STDIN>;
    chomp $n;
    push(@guess,$n);
    $try++;
}

#
# end
#

if($guess[$try-1] == $num){
    print("\nCongrats, ".$name.", that was the correct guess. It took you ".$try." guesses.\n");
    print("Your guesses were: ");
    for($i = 0; $i < $try; $i++){
        print($guess[$i]."  ");
    }
}
else{
    print("\n".$name.", you did not win. You used all ".$try." tries but didn't guess the right number: ".$num.".\n");
    print("Your guesses were: ");
    for($i = 0; $i < $try; $i++){
        print($guess[$i]."  ");
    }
}


print("\n\n----------------end----------------\n\n");