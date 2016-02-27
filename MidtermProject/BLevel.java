/*
Code to be syntax-checked for B-level Midterm project grade
*/

import java.io.*;
import java.util.Random;
//more than one import statement!

class BLevel{

    public static void main (String [] args){
        //now we are in main
        int x = 5;
        x = x + 3;
        String n = " ";
        String stringtrue = "String" + n + "test";
        System.out.println("It is true that string has 6 letters");
        boolean t = false;
        
        while(x <= 20){
          System.out.println("the number is" + x);
          x = x + 1;
        }
        
        if (x < 10){
            System.out.println("x<10");
        }
        else if(x < 15){
            System.out.println("10<x<15");
        }
        else{
            System.out.println("x>=15");
        }
        
        /*
        If there are other things that you want to test,
        here is a good place for them.
        */
        
        
        //for each
        int result = 0;
        for (int i : a){
        	//result += i;
        	result = result + i;
		}
		
		//for
		for (i = 0; i < 10; i ++){
			System.out.println(i);
		}
		
		//do while
        do {
            System.out.println("i is: " + i);
            i += 1;
        } while (i < 11);
		
		
    }

}