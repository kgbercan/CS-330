#!perl

# this is the c-level midterm code
# checks syntax for simple code

open(INPUT,"<CLevel.java") or die( "Could not open source: $!\n" );
@lines = <INPUT>;
close(INPUT);

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
$program =~s/(public |private |protected )?class [A-Z]\w*\s?\{/CLASS\n/g;
print $program;
print "\n\n";

# identifies main
print("MAIN FOUND:::: \n");
$program =~s/public static void main(\s)?\(\w*(\s)?\[\] args\)(\s)?\{/MAIN\n/g;
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

# identifies statement
print("STATEMENT FOUND:::: \n");
$program =~s/I = AE/S/g;
print $program;
print "\n\n";

# identifies terms
print("TERMS FOUND:::: \n");
$program =~s/\bI\b/T/g;
print $program;
print "\n\n";

# identifies arithmetic expressions
print("ARITHMETIC EXPRESSION FOUND:::: \n");
$program =~s/\bT\b/AE/g;
print $program;
print "\n\n";

# identifies statements
print("PRINT STATEMENTS FOUND:::: \n");
$program =~s/\bPRINT\(AE\)/S/g;
print $program;
print "\n\n";

# cleans up spaces
print("CLEANED UP:::: \n");
$program =~s/\s+/ /g;
print $program;
print "\n\n";

# identifies code blocks
print("CODE BLOCKS FOUND:::: \n");
$program =~s/(S;\s)+/CB/g;
print $program;
print "\n\n";

# main
print("MAIN FOUND:::: \n");
$program =~s/MAIN (CB)?\}/M/g;
print $program;
print "\n\n";

# class
print("CLASS FOUND:::: \n");
$program =~s/CLASS (M)?\}/C/g;
print $program;
print "\n\n";

# valid program
print("VALID PROGRAM FOUND:::: \n");
$program =~s/(IMPORT )?C/P/g;
print $program;
print "\n\n";