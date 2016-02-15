
#Due: February 5th at the beginning of class

#Karina

# Each of the sentences below are followed by a set of related instructions.  
# After each instruction, add your code that does what's being asked, as well as
# a print statement that shows your work. Don't forget to print new lines as well,
# or your output will be a mess!
#
# For example:
$s0="This is a test";
print $s0."\n";

#1) Write a regular expression that replaces the 's' characters with 'z's
$s0=~s/s/z/g;
print $s0."\n";

#2) Write a regular expression and if statement that checks if T is the first letter
if ($s0=~/^T/){
  print "It starts with 'T'!\n";
}

#3) collect all the words and put them in an array, then put the first word in a variable and print it
@array=($s0=~m/([A-Za-z]+ )/g);
print @array;
print "\n";
$firstword=$array[0];
print "The first word is: $firstword\n";

#4 split the sentence into an array of individual words called @words and use a foreach loop to print it
#  a foreach loop in Perl looks like this:
#     foreach $var (@arrah){
#        (your code here)
#     }
@words = split(" ",$s0);
foreach $word (@words){
    print $word."\n";
}

# =~/a.*b/ #looks for strings that start with a followed by any letter any number of times and ends with b (abcbeb ends at abcbeb)
# =~/a.*?b/ #looks for strings that start with a followed by any letter any number of times OR 0 times and ends with b (abcbeb ends at ab)

print"\n\n***************** Mary *****************\n\n";

#######################################################


$s1="Mary was born on September 17, 1986";

#1) Write a regular expression and if statement that checks if the name "Mary" is in the sentence.
if ($s1=~/Mary/){
    print "1) I found Mary!\n";
}

#2) Write a regular expression to replace "Mary" with "Margeret"
$s1=~s/Mary/Margeret/g;
print "2) ".$s1."\n";

#3) Write a regular expression and if statement that checks if the sentence contains a 4 digit number.
if ($s1=~/[0-9]{4}/){
    print("3) There is a 4 digit number in the statement.\n");
}

#4) Write a regular expression to extract that number into a variable $byear and print it in the sentence "The person was born in $byear."
@byear=($s1=~m/([0-9]{4})/g);
print "4) "."The person was born in ";
print @byear;
print ".\n";


print"\n\n***************** Dog ******************\n\n";

$s2="The dog, named Dog, was doggedly trying to dodge the fog.";

#1) Write a regular expression to match the word "dog", but not the name "Dog";
while($s2=~/\bdog\b/g){
    print("1) Found \"dog\".\n");
}

#2) Save the output from this match into an array and make sure it is not matching anything else (i.e. print the array).
@dog=($s2=~m/\bdog\b/g);
print("2) These are the contents of the array: ");
print @dog;
print("\n");

#3) Write a regular expression to match "dog" and "Dog" using a flag (see the cheat sheet).
while($s2=~/\bdog\b/ig){
    print("3) I found either \"dog\" or \"Dog\".\n");
}

#4) Write a regular expression to match "dog" or "fog";
while($s2=~/\b[df]og\b/g){
    print("4) I found either \"dog\" or \”fog\".\n");
}


print"\n\n*************** Numbers ****************\n\n";

$s3="18785 is the 5 digit number I want not 43744, 34553, or 11111";
#1) Write a regular expression to extract the first number (try to do it without using the exact string).
@dig=($s3=~m/\d{5}/g);
print "1) The first number is ".$dig[0]."\n";

#2) Write a regular expression to extract all numbers, store them in an array, then print the array.
print "2) All the numbers are:\t";
foreach $dig (@dig){
    (print $dig."\t")
}
print "\n";


print"\n\n************** Whitespace **************\n\n";

$s4="    There is preceding white space in this sentence, and whitespace at the end        ";
#1) Write a regular expression to remove the preceding whitespace.
print "Before: ".$s4."\n";
$s4=~s/\s{2,}//g;
print "After: ".$s4."\n";


print"\n\n**************** Zelda *****************\n\n";

$s5="junk data penguin begin tennis for 2 end begin Zelda and Link end begin Oculus Rift end no cheating by using positional text flags";
#1) Write a regular expression to print everything from the first "begin" to the last "end".
print "1) ";
print($s5=~/begin.*end/g);
print"\n";

#2) Write a regular expression to print only the text from the first "begin" to the first "end"
print "2) ";
@between=($s5=~/begin.*?end/g);
print $between[0];
print"\n";

#3) Write a regular expression to extract all of the text between "begin"s and "end"s into an array.
print "3) ";
@between=($s5=~/begin.*?end/g);
foreach $between (@between){
    (print $between."\t")
}
print"\n";


print"\n\n***************** Date *****************\n\n";

$s6="The date 5/17/1982 is trickier to get";
#1) Write a regular expression to extract the date.
print "1) ";
print($s6=~m/\d\/\d{2}\/\d{4}/g);
print "\n";

#2) capture the date in a variable $fdate
print "2) \$fdate: ";
@fdate=($s6=~m/\d\/\d{2}\/\d{4}/g);
$fdate=$fdate[0];
print($fdate."\n");

#3) split the date and store it in $month, $day, $year
@fdate=split("/",$fdate);
$month=@fdate[0];
$day=@fdate[1];
$year=@fdate[2];
print "3) \$month: ".$month."\t\$day: ".$day."\t\$year: ".$year."\n";

#4) convert the date to computer date format year-month-day where month and day always have 2 digits
#   save the result in $compdate
# hint: you can concatenate a string and a number and get back a string
$compdate=$year."-".$month."-".$day;
print "4) ".$compdate."\n";

#5) print the new date
print "5) ".$compdate."\n";


print"\n\n**************** Extra *****************\n\n";

#extra credit:
$s8="These are some dates: 1/23/2011, 2/1/2006, 12/31/2007, 9/15/1993, 04/23/1797.";
# 1) collect the dates in an array
print "2) \$dates: ";
@dates=($s8=~m/\d+\/\d+\/\d{4}/g);
print @dates;
print "\n";

# 2) use the code above to convert them to computer dates (i.e, yyyy-mm-dd format)
@unordered;
foreach $date (@dates){
    @newdate = split("/",$date);
    $month=@newdate[0];
    $day=@newdate[1];
    $year=@newdate[2];
    print "2) \$month: ".$month."\t\$day: ".$day."\t\$year: ".$year."\n";
    push @unordered, $year."-".$month."-".$day;
}

# 3) print the dates in chronological order
# http://www.perlmonks.org/bare/?node=sort
print "3) ";
@ordered = sort { $a <=> $b } @unordered;
foreach $o (@ordered){
    (print $o."\t")
}
print "\n";

print"\n\n***************** End ******************\n\n";