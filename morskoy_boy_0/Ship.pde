class Ship
{
  
 int centerX = 0;
 int centerY = height/3;
 int shipLength = 50;
 int shipHeight = 15;
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
   rect(centerX-(shipLength/2),centerY+shipHeight/2,centerX+shipLength/2,centerY-shipHeight/2);
   //ellipse(centerX,100,100,20);
   move();
 } 
}
