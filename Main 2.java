import java.util.Scanner;
public class Main
{
    public static void tickets(int B, int N, int A){
        int available = N - A;
        if(B<=available){
            available-=B;
            System.out.println("Y "+ available);
        }else{
            System.out.println("N");
        }
    }
    public static void main(String[] args)
    {
        Scanner input = new Scanner(System.in);
        int B = input.nextInt();
        int N = input.nextInt();
        int A = input.nextInt();
        Main.tickets(B,N,A);
    }
}