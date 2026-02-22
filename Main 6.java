import java.util.Scanner;

public class Main {

    public static boolean wins(char a, char b){
        if(a == 'R' && b == 'G') return true;
        if(a == 'G' && b == 'B') return true;
        if(a == 'B' && b == 'R') return true;
        return false;
    }

    public static void main(String[] args){
        Scanner input = new Scanner(System.in);

        String N = input.nextLine();
        String M = input.nextLine();

        int i = 0, j = 0;
        int ngoc = 0;
        int minh = 0;

        while(i < N.length() && j < M.length()){
            char c1 = N.charAt(i);
            char c2 = M.charAt(j);

            if(c1 == c2){
                ngoc++;
                minh++;
                i++;
                j++;
            }
            else if(wins(c1, c2)){
                ngoc++;
                j++;        // Minh loses candy
            }
            else{
                minh++;
                i++;        // Ngoc loses candy
            }
        }

        // Remaining candies
        if(i < N.length()){
            ngoc += N.length() - i;
        }
        if(j < M.length()){
            minh += M.length() - j;
        }

        System.out.println(ngoc);
        System.out.println(minh);
    }
}