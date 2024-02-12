package JPLueck_Homework;
//N is an input number. Your program should use a for loop to add the square roots of the numbers from 1 to N. 
//Your answer should be printed to exactly three decimal places of accuracy. 
//To do this, you can use the format string %.3f, as in the example shown below.

//double x = 1.23456789; 
//System.out.printf("%.3f\n", x); 
//1.235

import java.util.Scanner;

public class JP_AccumulatingASum {
    static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args){
        int N = scanner.nextInt();
        double x = 0.0;
        for (int i=1;i<=N;i++)
        {
            x += Math.sqrt(i);
        }
        System.out.printf("%.3f\n", x);
    }
}