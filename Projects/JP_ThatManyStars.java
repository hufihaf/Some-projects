package JPLueck_Homework;
//N is an input number in the range from 1 to 50. Your program should print out a single line of N asterisks.

//For example, if the input is 17, then your program would print:
//*****************

//Starter code:


import java.util.Scanner;

public class JP_ThatManyStars{
  static Scanner scanner = new Scanner(System.in);
  
  public static void main(String[] args){
    int N = scanner.nextInt();
    String stars = "";
    for (int i=0;i<N;i++)
    {
        stars += "*";
    }
    System.out.print(stars);
  }
}