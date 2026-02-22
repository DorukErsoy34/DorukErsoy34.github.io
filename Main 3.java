import java.util.Scanner;
import java.util.Arrays;
public class Main
{
    public static void score(int[] nums, int diff){
        int total = nums[1] + nums[2] + nums[3]; 
        total *= diff;
        System.out.println(total);
    }
    public static void main(String[] args)
    {
        Scanner input = new Scanner(System.in);
        int[] nums = new int[5];
        for(int i = 0; i<5; i++){
            nums[i] = input.nextInt();
        }
        Arrays.sort(nums);
        int diff = input.nextInt();
        Main.score(nums,diff);
    }
}