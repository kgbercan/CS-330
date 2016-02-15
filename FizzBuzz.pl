#!perl

# This program is a loop that prints 1-100, but instead of multiples of 3, it prints "Fizz" and instead of multiples of 5, it prints "Buzz." If it's a multiple of both 3 and 5, it prints both.

for($i=1; $i<101; $i++){
    if($i%3==0){
        print("Fizz");
    }
    if($i%5==0){
        print("Buzz");
    }
    if($i%3!=0 && $i%5!=0){
        print($i);
    }
    print("\n");
}