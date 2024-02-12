package JPLueck_Homework;
//A and B are two integers read from input, both in the range from 1 to 100, with A < B. Your program should print the numbers from B down to A, one number per line.

//For example, if A = 3 and B = 7, then your program would print: 
// 7 
// 6 
// 5 
// 4 
// 3

import java.util.Scanner;

public class JP_BackwardsBA{
  static Scanner scanner = new Scanner(System.in);
  
  public static void main(String[] args){
    int A = scanner.nextInt();
    int B = scanner.nextInt();
    for (int i=A;i>=B;i--)
    {
        System.out.println(i);
    }
  }
}