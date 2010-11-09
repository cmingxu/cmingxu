import java.util.Map;

public class EnvMap {
    public static void main(String args[]){
        Map<String,String> env = System.getenv();
        for(String envname : env.keySet()) {
            System.out.format("%s=%s%n",envname,env.get(envname));
        }
    }
}
