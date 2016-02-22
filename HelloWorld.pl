#!perl
# This is Karina's first program in Perl.

print "Hello, World!\n";

@ary = qw(cat hat bat sat rat mat pat gnat);

$, = "\n";

# print(@ary);

# foreach $x (@ary){
#	print $x;
#	push (@ary,$x); this creates an infinite loop
#}

$x = 4;
print("x: ".$x);
print("\n");
$y = 1;
print("y: ".$y);
print("\n");
$y  = $x;
print("changing");
print("\n");
print("y: ".$y);
print("\n");
$x = 99;
print("x: ".$x);
print("\n");
print("y: ".$y);
print("\n");


