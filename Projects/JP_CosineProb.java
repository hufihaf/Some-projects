package JPLueck_Homework;
//Maximum Value of CosineA and B are two input integers in the range 1 to a million, with A < B. Your program should print out the largest value of the cosine of X, where X ranges over the integers from A to B inclusive, again rounded to 3 decimal places.
//For example, if A = 5 and B = 10, then your loop would consider the cosines of 5 through 10, as shown in the table below: 
// 5    0.283662185463 
// 6    0.96017028665 
// 7    0.753902254343 
// 8   -0.145500033809 
// 9   -0.911130261885 
// 10  -0.839071529076 
// Then your program would print out 0.960 (notice that it is rounded to 3 decimal places) since that is the largest cosine value. 

//Note that cos is a static method of the Math class, so you can call it with Math.cos(x)

import java.util.Scanner;

public class JP_CosineProb{
  static Scanner scanner = new Scanner(System.in);
  
  public static void main(String[] args){
    int A = scanner.nextInt();
    int B = scanner.nextInt();
    double y = Math.cos(A);
    for (int i=A;i<=B;i++)
    {
      double x = Math.cos(i);
      System.out.printf("%d  %f\n", i,x);
    }
    for (int j=A;j<=B;j++)
    {
      if (Math.cos(j) > y)
      {
        y = Math.cos(j);
      }
    }
    System.out.printf("%.3f\n", y);
  }
}