public class StaticFun{
    public static void main(String args[]){
    
        StaticTest.i = 1;
        System.out.println(StaticTest.i);
        StaticTest.set_i(2);

        System.out.println(StaticTest.i);
        System.out.println(StaticTest.s);

    }
}


class StaticTest{

    static int i;
    static String s;

    static {
        float a = 1.0f;
        s = new String("this is static variable");
    }

    public static void set_i(int i){
        StaticTest.i = i;
    }
}
