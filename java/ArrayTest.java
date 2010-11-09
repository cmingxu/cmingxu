import java.util.*;

public class ArrayTest {
    static Random rand = new Random();
    public static void main(String args[]){
        int a[] = new int[rand.nextInt(20)];
        for(int c : a){
            System.out.println(c);
        }
    }
}


