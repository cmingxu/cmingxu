public class MountainBicycle extends Bicycle{
    public int seatHeight;

    public MountainBicycle(int startGear,int startSpeed,int startCadence,int startHeight) {
        super(startCadence,startSpeed,startGear);
        seatHeight = startHeight;
    }

    public void setHeight(int newvalue){
        seatHeight = newvalue;
    }
}
