class Torpedo
{
  float centerX = width/2;
  float centerY = height;
  float destinationX;
  float destinationY;
  boolean amShooting = false;
  
  Torpedo(int destX, int destY)
  {
    destinationX = destX;
    destinationY = destY;
  }
  
  void move()
  {
    float distance1 = dist(width/2, height, destinationX, destinationY);
    float distance2 = dist(centerX, centerY, destinationX, destinationY);
    //println("Distance: " + (distance1 - distance2)/10.0);
    float speedConst = 15.0;
    float amt = (distance1 - distance2)/(float)(height*speedConst)+0.001;
    centerX = lerp(centerX, destinationX, amt) ;
    centerY = lerp(centerY, destinationY, amt); 
  }
  
  void drawTorpedo()
  {
    if(centerY < height/3 + 1 )
    {
      amShooting = false;
    }
    
    if(amShooting)
    {
   //    println("TORPEDO DRAWN");
        stroke(50);
        fill(66);
        ellipse(centerX,centerY,10.0,10.0);
        move();
    }
  }
  
  void shoot()
  {
    amShooting = true;
    centerX = width/2;
    centerY = height;
    //println("centerX: " + centerX + " centerY: " + centerY);
  }
}
