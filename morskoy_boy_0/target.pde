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
      noFill();
      ellipse(centerX, centerY, 35,35);
      line(centerX-5, centerY, centerX+5, centerY);
      line(centerX, centerY-5, centerX, centerY+5);
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


