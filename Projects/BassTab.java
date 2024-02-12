import java.util.Scanner;

//THIS IS STILL A WORK IN PROGRESS

public class BassTab{
    static Scanner scanner = new Scanner(System.in);
    public static void main (String [] args){
        System.out.println("\nWelcome to the Bass Tab maker tool.");
        System.out.println("Instructions can be found on my github page (select 'Code'): http://bit.ly/BassTabInstructions\n");
        String[] tuning = new String[4];
        for (int i=0;i<4;i++) {
            System.out.println("Enter the tuning for string " + (i+1) + ":");
            tuning[i] = scanner.nextLine();
        }
        System.out.println("\nNext, type in how many dashes you'll need per measure:");
        int mlength = scanner.nextInt();
        int[] mcount = new int[mlength-1];
        System.out.printf("\nType note for Measure %d, Dash %d (or type 'skip'):\n", mcount[1], mcount[2]);
    }
}
