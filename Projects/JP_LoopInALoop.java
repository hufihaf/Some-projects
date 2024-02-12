package JPLueck_Homework;
//N is an input number in the range from 1 to 30. Use for loops to print out a triangle N tall by N wide of Xs on the screen. 
//For example, if N = 4, then your program would print:
// X 
// XX 
// XXX 
// XXXX 

// DR CHASTAIN - Hello, this is JP Lueck.
//               When I was working with C in my senior year of highschool, I did a problem which had a similar task to this one,
//               but I had to make a pyramid, not a right triangle. I went to my archive and pulled the code from that problem,
//               and translated it to Java!
//               
//               I figured, that because it shows knowledge of internal loops, it would be OK with you to use.
//               Please let me know if you'd rather me complete your original problem.

import java.util.Scanner;

public class JP_LoopInALoop{
  static Scanner scanner = new Scanner(System.in);
  
  public static void main(String[] args){
    int N = scanner.nextInt();
    {
        for (int i=0;i<N;i++)
        {
            for (int j=0;j<N;j++)
            {
                if (i+j < N-1)
                {
                    System.out.print(" ");
                }
                else if (i+j >= N-1)
                {
                    System.out.print("X");
                }
            }
            System.out.print("  ");

            for (int k = N+1; k < 2*N+1; k++)
            {
                if (k > N+N-i-1)
                {
                    System.out.print("X");
                }
            }
                System.out.print("\n");
        }
    }
  }
}