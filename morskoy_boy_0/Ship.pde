class Ship
{
  
 int centerX = 0;
 int centerY = 100;;
 int shipLength;
 int speed = 1;
 boolean blownUp = false;
  
 PImage shipImage = new PImage(); 
  
 void move()
 {
   centerX = centerX + speed;
   if ((centerX > width)) {
    centerX = -30;
    blownUp = false;
  }
 }

 void blowUp()
 {
   //fill(255,0,0);
   blownUp = true;
 }

 void drawShip()
 {
   stroke(100);
   if(blownUp)
   {
      fill(255,0,0); 
   }else
   {
     fill(100);
   }
   rectMode(CORNERS);
   rect(centerX-50,centerY+10,centerX+50,centerY-10);
   //ellipse(centerX,100,100,20);
   move();
 } 
}
