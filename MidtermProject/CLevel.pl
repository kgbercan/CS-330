#!perl


open(INPUT,"<CLevel.java");
@lines = <INPUT>;
close(INPUT);


# multiline comment
# import statement
# single line comment
# class
# main
# 



# String: ~s/".*?"/STRING/g

$program = join('',@lines);
print $program;
print "\n\n---------------------------\n\n";

#                                 v-.-|
# q0 --/*--> q1 --\n--> q2 --.-->  q3  --*/-->
#             |----------.----------^

# takes out single line comments
print("SINGLE LINE COMMENTS REMOVED:::: \n");
$program =~s/(\/\/){1,}.*\n//g;
print $program;
print "\n\n";

# puts entire program on one line
print("LINE BREAKS REMOVED:::: \n");
$program =~s/\n//g;
print $program;
print "\n\n";

# takes out multiline comments
print("MULTILINE COMMENTS REMOVED:::: \n");
$program =~s/\/\*.*?(\*\/)+?//g;
print $program;
print "\n\n";

# identifies import statements
print("IMPORT STATEMENTS FOUND:::: \n");
$program =~s/import\s*[a-z][\w.\*]*;/IMPORT\n/g;
print $program;
print "\n\n";

# identifies class declarations
print("CLASSES FOUND:::: \n");
$program =~s/class [A-Z]\w*\{/CLASS\n/g;
print $program;
print "\n\n";

# identifies main
print("MAIN FOUND:::: \n");
$program =~s/public static void main \(\w* \[\] args\)\{/MAIN\n/g;
print $program;
print "\n\n";

# identifies string literals
print("STRINGS FOUND:::: \n");
$program =~s/".*?"/STRINGLITERAL/g;
print $program;
print "\n\n";


