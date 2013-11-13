class Ship
{
  
 int centerX = 0;
 int centerY = 100;;
 int shipLength;
 int speed = 1;
  
 PImage shipImage = new PImage(); 
  
 void move()
 {
   centerX = centerX + speed;
   if ((centerX > width)) {
    centerX = -30;
  }
 }

 void drawShip()
 {
   stroke(100);
   fill(175);
   ellipse(centerX,100,100,20);
 } 
}
