class Tendril
{
  public final static int SEG_LENGTH = 4; //length of each segment in the tendril
  private int myNumSegments, myColor, myCenterX, myCenterY, myEndX, myEndY;
  private float anchor1X, anchor1Y, anchor2X, anchor2Y;
  private double myAngle;
  private ArrayList<Cluster> subclusters = new ArrayList<Cluster>();
  
  /**
   Class constructor
   len is how many segments in this tendril (each a fixed length, 4 is a good start)
   theta is tendril starting angle in radians 
   x, y  is the starting (x,y) coordinate
   */
  public Tendril(int len, double theta, int x, int y, int c)
  {
    myNumSegments = len;
    myAngle = theta;
    myCenterX = x;
    myCenterY = y;
    myColor = c;
    initCenterAndEnds();
  }
  private void initCenterAndEnds() {
    int startX = myCenterX;
    int startY = myCenterY;
    int endX;
    int endY;
    for (int i = 0; i < myNumSegments; i++) {
      // myAngle += Math.random()*0.4 - 0.2;
      endX = (int)(startX + Math.cos(myAngle) * SEG_LENGTH);
      endY = (int)(startY + Math.sin(myAngle) * SEG_LENGTH);
      //line(startX, startY, endX, endY);
      startX = endX;
      startY = endY;
    }
    myEndX = startX;
    myEndY = startY;
    anchor1X = myCenterX + (float)Math.random()*51-25;
    anchor1Y = myCenterY+ (float)Math.random()*51-25;
    anchor2X = myEndX+ (float)Math.random()*51-25;
    anchor2Y = myEndY+ (float)Math.random()*51-25;
    if (myNumSegments >= 3) {
      Cluster cluster = new Cluster(myNumSegments/3, startX, startY, color(myNumSegments/3 * 60 + 60, myNumSegments/3 * 10 + 30, myNumSegments/3 * 5 + 30));
      cluster.show();
      subclusters.add(cluster);
    }
  }
  public void show()
  {
    stroke(myColor);
    noFill();
    bezier(myCenterX, myCenterY, 
    anchor1X, anchor1Y,
    anchor2X, anchor2Y, 
    myEndX, myEndY);
    for(int i = 0; i < subclusters.size(); i++) {
      subclusters.get(i).show();
    }
  }
  
  //public void move() {
  //  if (dist(mouseX, mouseY, myEndX, myEndY) < 50) {
  //    int changeX, changeY;
  //    if (mouseX < myEndX) changeX = 10;
  //    else changeX = -10;
  //    if (mouseY < myEndY) changeY = 10;
  //    else changeY = -10;
      
  //    myCenterX += changeX;
  //    myEndX += changeY;
  //    for(int i = 0; i < subclusters.size(); i++) {
  //      Cluster sc = subclusters.get(i);
  //      sc.setX(sc.getX() + changeX); 
  //      sc.setY(sc.getY() + changeY); 
  //      sc.show();
  //    }
  //  }
  //}
  
  public int getEndX() {
    return myEndX;
  }
  public int getEndY() {
    return myEndY;
  }
  
  private void debugPrint() {
    System.out.println("myCenterX: " + myCenterX);
    System.out.println("myCenterY: " + myCenterY);
    System.out.println("myEndX: " + myEndX);
    System.out.println("myEndY: " + myEndY);
    System.out.println("-----------");
  }
}
