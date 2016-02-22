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

# identifies VALUES
print("VALUES FOUND:::: \n");
$program =~s/".*?"|\d+|\b(false|true)\b/V/g;
print $program;
print "\n\n";

# identifies arithmetic operators
print("ARITHMETIC OPERATORS FOUND:::: \n");
$program =~s/[\+\-\/\*]/AOP/g;
print $program;
print "\n\n";

# identifies declaration words
print("TYPE DECLARATIONS FOUND:::: \n");
$program =~s/\b(String|int|boolean)\b/TYPE/g;
print $program;
print "\n\n";

# identifies print statements
print("PRINT STATEMENT FOUND:::: \n");
$program =~s/System\.out\.print(ln)?/PRINT/g;
print $program;
print "\n\n";

# identifies variable names
print("VARIABLE NAME (IDENTIFIER) FOUND:::: \n");
$program =~s/[a-z][a-zA-Z0-9_]*/I/g;
print $program;
print "\n\n";

# identifies declared variables
print("VARIABLE DECLARIATION FOUND:::: \n");
$program =~s/\bTYPE I\b/I/g;
print $program;
print "\n\n";

# identifies terms
print("TERMS FOUND:::: \n");
$program =~s/[IV] AOP/T AOP/g;
print $program;
print "\n\n";

# identifies terms
print("TERMS FOUND:::: \n");
$program =~s/\bV\b/T/g;
print $program;
print "\n\n";

# identifies arithmetic expression
print("ARITHMETIC EXPRESSION FOUND:::: \n");
$program =~s/\bT( AOP T)?\b/AE/g;
print $program;
print "\n\n";

# identifies arithmetic expression
print("ARITHMETIC EXPRESSION FOUND:::: \n");
$program =~s/I = AE/S/g;
print $program;
print "\n\n";
