class Ship
{
  
 int centerX = 0;
 int centerY = height/3;
 int shipLength = 100;
 int shipHeight = 50;
 int speed = int(random(4)+1);
 boolean blownUp = false;
  
 PImage shipImage = getShipImage();
  
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
      shipImage = getShipImage();
      speed = int(random(2)+1);
    }
 }

 PImage getShipImage()
 {
   int imageIndex = int(random(10));
   return loadImage("ship"+imageIndex+".png");
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
