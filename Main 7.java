import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int M = input.nextInt();
        int MAX = 4000000;
        int[] xs = new int[MAX];
        int[] ys = new int[MAX];
        int size = 0;
        int x = 0;
        int y = 0;
        xs[size] = 0;
        ys[size] = 0;
        size++;
        int count = 0;
        for(int i = 0; i < M; i++) {
            String move = input.next();
            char dir = move.charAt(0);
            int steps = Integer.parseInt(move.substring(1));
            for(int s = 0; s < steps; s++) {
                if(dir == 'N') y++;
                else if(dir == 'S') y--;
                else if(dir == 'E') x++;
                else if(dir == 'W') x--;
                boolean visited = false;
                for(int k = 0; k < size; k++) {
                    if(xs[k] == x && ys[k] == y) {
                        visited = true;
                        break;
                    }
                }
                if(visited) {
                    count++;
                } else {
                    xs[size] = x;
                    ys[size] = y;
                    size++;
                }
            }
        }
        System.out.println(count);
    }
}