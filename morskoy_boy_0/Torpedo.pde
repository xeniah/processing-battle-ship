class Torpedo
{
  int centerX = width/2;
  int centerY = height;
  int destinationX;
  int destinationY;
  boolean amShooting = false;
  
  Torpedo(int destX, int destY)
  {
    destinationX = destX;
    destinationY = destY;
  }
  
  void move()
  {
    centerX = (int)lerp(centerX, destinationX, 0.02);
    centerY = (int)lerp(centerY, destinationY, 0.02);
    
  }
  
  void drawTorpedo()
  {
 //   println("amShooting: " + amShooting);
//    if(centerY < 101 )
//    {
//      amShooting = false;
//      println("TORPEDO DISAPPEAR! NOT DRAWN, centerY: " + centerY);
//    }
    
    if(amShooting)
    {
   //    println("TORPEDO DRAWN");
        stroke(50);
        fill(66);
        ellipse(centerX,centerY,10,20);
        move();
    }
  }
  
  void shoot()
  {
    amShooting = true;
    int centerX = width/2;
    int centerY = height;
    println("centerX: " + centerX + " centerY: " + centerY);
  }
}
