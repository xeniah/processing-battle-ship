class Target
{
  //position
  int centerX = 100;
  int centerY = height/3; 
  int speed = 2;
  
  String dirState = "right";

  void moveRight()
  {
    dirState = "right";
    centerX += speed;
  }

  void moveLeft()
  {
    dirState = "left";
    centerX -= speed;
  }
  
  void drawTarget()
  {
      ellipseMode(CENTER);
      stroke(0);
      strokeWeight(2);
      noFill();
      ellipse(centerX, centerY, 40,40);
      strokeWeight(1);
//      line(centerX-5, centerY, centerX+5, centerY);
      line(centerX, centerY+8, centerX, centerY+15);
      line(centerX, centerY-8, centerX, centerY-15);
      line(centerX+8, centerY, centerX+15, centerY);
      line(centerX-8, centerY, centerX-15, centerY);
      
//      line(centerX, centerY-5, centerX, centerY+5);
  }
 
  void checkState()
  {
    if (dirState == "right"){
      moveRight();
    } 
    else if (dirState == "left"){
      moveLeft();
    } 
  }

}


