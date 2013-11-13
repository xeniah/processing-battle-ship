class Torpedo
{
  int centerX = width/2;
  int centerY = height;
  boolean amShooting = false;
  
  void move()
  {
    centerY -= 1;
  }
  
  void drawTorpedo()
  {
    if(amShooting)
    {
        stroke(50);
        fill(66);
        ellipse(centerX,centerY,10,20);
        move();
    }
  }
  
  void shoot()
  {
    amShooting = true;
  }
}
