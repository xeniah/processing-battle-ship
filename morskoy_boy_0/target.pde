class Target
{
  //position
  int centerX = 100;
  int centerY = 100; 
  
  String dirState = "right";

  void moveRight()
  {
    dirState = "right";
    centerX += 1;
  }

  void moveLeft()
  {
    dirState = "left";
    centerX -=1;
  }

  

  void update()
  {  
    //println(dirState);


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


