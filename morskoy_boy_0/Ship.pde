class Ship
{
  
 int centerX = 0;
 int centerY = height/3;
 int shipLength = 100;
 int shipHeight = 50;
 int speed = 1;
 boolean blownUp = false;
  
 PImage shipImage = loadImage("plane1.jpg"); 
  
 void move()
 {
   if(blownUp){
     speed = 3;
     centerX = centerX + speed;
     centerY = centerY + speed;
   }
   centerX = centerX + speed;
   if ((centerX > width)) {
      centerX = -30;
      centerY = height/3;
      blownUp = false;
      speed = 1;
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
//   rectMode(CORNERS);
//   rect(centerX-(shipLength/2),centerY+shipHeight/2,centerX+shipLength/2,centerY-shipHeight/2);
   imageMode(CORNERS);
   image(shipImage, centerX-(shipLength/2),centerY+shipHeight/2,centerX+shipLength/2,centerY-shipHeight/2);
   //ellipse(centerX,100,100,20);
   move();
 } 
}
