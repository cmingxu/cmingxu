import java.text.*;

public class DecimalFormatDemo {
    static public void customFormat(String pattern, double value) {
        DecimalFormat myFormatter = new DecimalFormat(pattern);
        String output = myFormatter.format(value);
        System.out.println(value + " " + pattern + " " + output);
    }

    static public void main(String args[]){
        customFormat("###,###.###",12345.33333);
        customFormat("###.##",32424454.1222);
    }
}


