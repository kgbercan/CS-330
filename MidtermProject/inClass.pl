#!perl


open(INPUT,"<InClass.java");
@lines = <INPUT>;
close(INPUT);
print @lines;
print "\n\n";

# String: ~s/".*?"/STRING/g

$program = join('',@lines);
print $program;

#                                 v-.-|
# q0 --/*--> q1 --\n--> q2 --.-->  q3  --*/-->
#             |----------.----------^

$program =~s/(\/\/){1,}.*\n//g;
print $program;
print "\n\n";

$program =~s/\n//g;
print $program;
print "\n\n";

$program =~s/\/\*.*?(\*\/)+?//g;
print $program;
print "\n\n";

$program =~s/import\s*[a-z][\w.\*]*;/IMPORT\n/g;
print $program;
print "\n\n";


