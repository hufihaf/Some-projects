package JPLueck_Homework;
//N is read from the input, and will be an integer in the range 1 to a 1000. 
//You should use a for loop to print out the powers of 2 from 20 up to and including 2N.
//For example, if N = 3, then your program would print: 
// 1  
// 2  
// 4  
// 8
//Powers of 2 get big, quickly, and I want you to print out the power of 2 exactly, not rounded.
//For example, 250 = 1125899906842624, and 2100 = 1267650600228229401496703205376. Your program should not print, for example, 
//1.2676506002282294e+30 (scientific notation) for that latter power. This is why I encourage you to read about the BigInteger class.

import java.util.Scanner;
import java.math.BigInteger;

public class JP_BigInteger{
  static Scanner scanner = new Scanner(System.in);
  
  public static void main(String[] args){
    int N = scanner.nextInt();
    for (int i=0;i<=N;i++)
    {
        BigInteger result = BigInteger.valueOf(2).pow(i);
        System.out.printf("%d\n", result);
    }
  }
}