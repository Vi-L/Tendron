public class Cluster
{
    public final static int NUM_STEMS = 10; //number of tendrils per cluster
    private ArrayList<Tendril> tendrils;
    int myX, myY, myC, myLen;
    public Cluster(int len, int x, int y, int c)
    {
        myLen = len;
        myX = x;
        myY = y;
        myC = c;
        initTendrils();
    }
    private void initTendrils() {
      tendrils = new ArrayList<Tendril>();
      for (int i = 0; i < NUM_STEMS; i++) {
          Tendril tendril = new Tendril(myLen, Math.PI * 2 / NUM_STEMS * i + (Math.random()*Math.PI/8 - Math.PI/16), myX, myY, myC);
          tendrils.add(tendril);
        }
    }
    public void show() {
      for (int i = 0; i < NUM_STEMS; i++) {
        tendrils.get(i).show();
        // tendrils.get(i).move();
      }
    }
    public void showPetals() {
      stroke(200, 200, 0);
      fill(200, 200, 0);
      for (int i = 0; i < tendrils.size(); i++) {
        ellipse(tendrils.get(i).getEndX(), tendrils.get(i).getEndY(), 100, 100);
      }
    }
    
    public int getX() {
      return myX;
    }
    public int getY() {
      return myY;
    }
    public void setX(int x) {
      myX = x;
    }
    public void setY(int y) {
      myY = y;
    }
}
