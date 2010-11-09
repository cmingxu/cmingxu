public class OverLoadTest {
    public static void main(String args[]){
        OverLoad ol = new OverLoad();
        ol.p();
        ol.p("this is an test");
    }
}

class OverLoad{
    public void p(){
        System.out.println("this is and test");
    }

    public void p(String a){
        System.out.println("user input :" + a);
    }
}

