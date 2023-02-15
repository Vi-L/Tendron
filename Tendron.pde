Cluster c;
public void setup()
{
  size(500, 500);  
  background(0, 100, 0);
  c = new Cluster(50, 250, 250, color(0, 255, 0)); // initial number of segments in the tendril and starting (x,y) coordinate
}

public void draw()
{
  background(0, 100, 0);
  //c.showPetals();
  c.show();
}
public void mousePressed()
{
  if (mouseButton == RIGHT) {
    c = new Cluster(50, 250, 250, color(0, 255, 0));
  }
}
