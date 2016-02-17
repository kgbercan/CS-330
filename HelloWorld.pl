#!perl
# This is Karina's first program in Perl.

print "Hello, World!\n";

@ary = qw(cat hat bat sat rat mat pat gnat);

$, = "\n";

print(@ary);

foreach $x (@ary){
	print $x;
#	push (@ary,$x); this creates an infinite loop
}