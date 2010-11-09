public class Test {
    public static void main(String args[]){
        int a = 10;
        System.out.println("This is a " + a);

        float f = 1.111f;
        System.out.println("This is a " + f);

        String number = "10iddd";

        System.out.println(number);
        try{
        System.out.println(Integer.parseInt(number));
        }catch(Exception e){
            System.out.println("Exception caught");
        }
        System.out.format("this is an test %d",10);
    }
}
