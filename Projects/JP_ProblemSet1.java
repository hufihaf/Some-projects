import java.util.Scanner;

public class ProblemSet1{
  static Scanner scanner = new Scanner(System.in);
  
  public static void main(String[] args){
    int N = scanner.nextInt();
    for(int i=1;i<=N;i++)
    {
      if (i==1 || i==N)
      {
        for(int j=0;j<N;j++)
        {
          System.out.print("*");
        }
      }
      else
      {
        for (int k=1;k<=N;k++)
        {
          if (k==1 || k==N)
          {
            System.out.print("*");
          }
          else
          {
            System.out.print(" ");
          }
        }
      }
      System.out.print("\n");
    }
  }
}