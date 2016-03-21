#!perl

# this is the c-level midterm code
# checks syntax for simple code

open(INPUT,"<ALevel.java") or die( "Could not open source: $!\n" );
@lines = <INPUT>;
close(INPUT);

# String: ~s/".*?"/STRING/g

$program = join('',@lines);
print $program;
print "\n\n---------------------------\n\n";

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
$program =~s/import\s*[a-z][\w.\*]*;/\\IMPORT\\\n/g;
print $program;
print "\n\n";

# identifies class declarations
print("CLASSES FOUND:::: \n");
$program =~s/(public |private |protected )?class [A-Z]\w*\s?\{/\\CLASS\\\n/g;
print $program;
print "\n\n";

# identifies main
print("MAIN FOUND:::: \n");
$program =~s/public static void main(\s)?\(\w*\s?\[\] args\)\s?\{/\\MAIN\\\n/g;
print $program;
print "\n\n";

# access variables
print("ACCESS MODIFIERS FOUND:::: \n");
$program =~s/public|private|protected/\\ACCESS\\/g;
print $program;
print "\n\n";

# identifies VALUES
print("VALUES FOUND:::: \n");
$program =~s/".*?"|\d+|\b(false|true)\b/\\V\\/g;
print $program;
print "\n\n";

# identifies arithmetic shortcuts
print("++ and -- FOUND:::: \n");
$program =~s/\+\+|--/= \\I\\ \\AOP\\ \\V\\/g;
print $program;
print "\n\n";

# identifies arithmetic shortcuts
print("+= and -= FOUND:::: \n");
$program =~s/[\+\-]=/= \\I\\ \\AOP\\/g;
print $program;
print "\n\n";

# identifies arithmetic operators
print("ARITHMETIC OPERATORS FOUND:::: \n");
$program =~s/[\+\-\/\*]/\\AOP\\/g;
print $program;
print "\n\n";

# identifies conditional operators
print("CONDITIONAL OPERATORS:::: \n");
$program =~s/[<>!][=]|[<>]|==/\\COP\\/g;
print $program;
print "\n\n";

# identifies declaration words
print("TYPE DECLARATIONS FOUND:::: \n");
$program =~s/\b(String|int|boolean|double|void)\b/\\TYPE\\/g;
print $program;
print "\n\n";

# identifies print statements
print("PRINT STATEMENT FOUND:::: \n");
$program =~s/System\.out\.print(ln)?/\\PRINT\\/g;
print $program;
print "\n\n";

# identifies while loops
print("WHILE LOOP FOUND:::: \n");
$program =~s/\bwhile\b/\\WHILE\\/g;
print $program;
print "\n\n";
print("DO WHILE FOUND:::: \n");
$program =~s/\bdo\b/\\DO\\/g;
print $program;
print "\n\n";

# identifies for loops
print("FOR LOOP FOUND:::: \n");
$program =~s/\bfor\b/\\FOR\\/g;
print $program;
print "\n\n";

# identifies if/else
print("CONDITIONALS FOUND:::: \n");
$program =~s/\b(else if|if|else)\b/\\COND\\/g;
print $program;
print "\n\n";

# identifies an object
print("OBJECTS FOUND:::: \n-----------------\n");
$program =~s/ [A-Z][a-zA-Z\d]* / \\OBJ\\ /g;
print $program;
print "\n\n";

# object constructor
print("CONSTRUCTORS FOUND:::: \n-----------------\n");
$program =~s/new [A-Z][a-zA-Z\d]*\(.*?\)/\\CONSTRUCTOR\\/g;
print $program;
print "\n\n";

# methods
print("METHODS FOUND:::: \n-----------------\n");
$program =~s/[a-z][a-zA-Z]*\(\)/\\METH\\/g;
print $program;
print "\n\n";

# methods
print("METHODS FOUND:::: \n-----------------\n");
$program =~s/[A-Z][a-zA-Z\d]*\(.*?\)/\\CONSTRUCTOR\\/g;
print $program;
print "\n\n";

# clean up
print("CLEANED UP:::: \n-----------------\n");
$program =~s/\\//g;
print $program;
print "\n\n";

# identifies variable names
print("VARIABLE NAME (IDENTIFIER) FOUND:::: \n");
$program =~s/\b[a-z][a-zA-Z0-9_]*/I/g;
print $program;
print "\n\n";

# identifies declared variables
print("VARIABLE DECLARIATION FOUND:::: \n");
$program =~s/\bTYPE I\b/I/g;
$program =~s/\I\.METH/I/g;
$program =~s/\OBJ I/I/g;
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

# identifies terms
print("TERMS FOUND:::: \n");
$program =~s/T AOP I/T AOP T/g;
print $program;
print "\n\n";

# identifies terms
print("TERMS FOUND:::: \n");
$program =~s/I = (I|CONSTRUCTOR)/I = T/g;
print $program;
print "\n\n";

# identifies conditional statements
print("CONDITIONAL STATEMENT FOUND:::: \n");
$program =~s/I COP T/CS/g;
print $program;
print "\n\n";

# identifies arithmetic expression
print("ARITHMETIC EXPRESSION FOUND:::: \n");
$program =~s/\bT( AOP T)*\b/AE/g;
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

# identifies statements
print("STATEMENTS FOUND:::: \n");
$program =~s/AE/S/g;
print $program;
print "\n\n";

# identifies attributes
print("ATTRIBUTES FOUND:::: \n");
$program =~s/CLASS((\s)+S;)+(\s)+ACCESS CONSTRUCTOR/CLASS ATTR ACCESS CONSTRUCTOR/g;
print $program;
print "\n\n";

# valid while loops
print("VALID WHILE LOOPS FOUND:::: \n");
$program =~s/WHILE(\s)?\(CS\)(;)?/W/g;
print $program;
print "\n\n";

# valid if statements
print("VALID IF STATEMENTS FOUND:::: \n");
$program =~s/COND(\s)?\(CS\)/COND/g;
print $program;
print "\n\n";

# valid for and for each loops
print("VALID FOR AND FOR EACH STATEMENTS FOUND:::: \n");
$program =~s/FOR\s?\(((AE \: AE)|(S; CS; S))\)/F/g;
print $program;
print "\n\n";



# cleans up spaces
print("CLEANED UP:::: \n");
$program =~s/\s+/ /g;
print $program;
print "\n\n";

# identifies code blocks
print("CODE BLOCKS FOUND:::: \n");
$program =~s/(\bS; )+/CB /g;
print $program;
print "\n\n";

# program control
print("PROGRAM CONTROL BLOCKS FOUND:::: \n");
$program =~s/(W{ CB })|(COND{ CB } )+|(F{ CB })|DO { CB } W/CTRL /g;
print $program;
print "\n\n";

# cleans up spaces
print("CLEANED UP:::: \n");
$program =~s/\s+/ /g;
print $program;
print "\n\n";

# groups code blocks
print("GROUPED CONSECUTIVE CODE BLOCKS:::: \n");
$program =~s/(CB |CTRL )+/CB /g;
print $program;
print "\n\n";

# object classes
print("VALID OBJECT CLASS FOUND:::: \n");
$program =~s/CLASS ATTR ACCESS CONSTRUCTOR{ CB } ACCESS TYPE METH{ CB }/CLASS/g;
print $program;
print "\n\n";

# main
print("MAIN FOUND:::: \n");
$program =~s/MAIN ((CB )|(CTRL ))*}/M/g;
print $program;
print "\n\n";

# classes
print("CLASSES FOUND:::: \n");
$program =~s/CLASS( M)?}/C /g;
print $program;
print "\n\n";

# valid program
print("VALID PROGRAM FOUND:::: \n");
$program =~s/(IMPORT )*(C )+/P/g;
print $program;
print "\n\n"; 