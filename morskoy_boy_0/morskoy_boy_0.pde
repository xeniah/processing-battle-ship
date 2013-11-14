import processing.video.*;

Movie blowUpSound;
int x = 0;
int y = 100;
int speed = 1;
boolean instructionMode = true;
PFont f;
int level = 120;

Target target;
Ship ship;
Torpedo [] torpedoes = new Torpedo[10];
int currentTorpedo = 0;
int numShipsSunk = 0;


void setup() {
  size(600,200);
  smooth();
  target = new Target();
  ship = new Ship();
  blowUpSound = new Movie (this, "expl_aargh.wav");
  
  f = loadFont("PressStart2P-48.vlw");
  textFont(f, 18);
}

void draw() {
      background(255);
      checkKeys();
      ship.drawShip(); 
      target.drawTarget();
      for(int i = 0; i < 10; i++)
      {
          if(torpedoes[i] != null)
          {
            torpedoes[i].drawTorpedo();
            Torpedo t = torpedoes[i];
  
            if(t != null && t.amShooting && isCollidingCircleRectangle(t.centerX, t.centerY, 10, ship.centerX-ship.shipLength/2, ship.centerY-ship.shipHeight/2, ship.shipLength, ship.shipHeight))
            {
       //   println("************************** COLLIDED *********************************");
              ship.blowUp();
              numShipsSunk++;
              blowUpSound.stop();
              blowUpSound.play();
       //   ship = new Ship();
            }  
        }
      }
     drawLerp();
     
     if(instructionMode)
     {
       instructionMode();
     }else
     {
       drawScore();
     }
  

}

void drawLerp()
{
    int x1 = width/2;
    int y1 = height;
    int x2 = target.centerX;
    int y2 = target.centerY;
   
    stroke(0, 0, 255);
    for (int i = 0; i <= 10; i++) {
        float x = lerp(x1, x2, i/10.0);
        float y = lerp(y1, y2, i/10.0);
        point(x, y);
    }
}

//// A function to display the scene
//void display() {
//  
//  // draw the 'target'
//  ellipseMode(CENTER);
//  stroke(0);
//  noFill();
//  int tx = target.centerX;
//  ellipse(tx,100,35,35);
//  line(tx-5, y, tx+5, y);
//  line(tx, y-5, tx, y+5);
//}

void keyReleased() {
   if (keyCode == UP){
      println("***SHOOT***");
     if(currentTorpedo < 10)
       {
          println("currentTorpedo: " + currentTorpedo);
          torpedoes[currentTorpedo] = new Torpedo(target.centerX, target.centerY);
          torpedoes[currentTorpedo].shoot();
          currentTorpedo++;
       }
    }   
}

void checkKeys(){
  if (keyPressed) {
    if (keyCode == RIGHT) {
      target.moveRight();
    }   

    if (keyCode == LEFT) {
      target.moveLeft();
    } 
  } 
}

boolean isCollidingCircleRectangle(
      float circleX, 
      float circleY, 
      float radius,
      float rectangleX,
      float rectangleY,
      float rectangleWidth,
      float rectangleHeight)
{
    float circleDistanceX = abs(circleX - rectangleX - rectangleWidth/2);
    float circleDistanceY = abs(circleY - rectangleY - rectangleHeight/2);

    if (circleDistanceX > (rectangleWidth/2 + radius)) { return false; }
    if (circleDistanceY > (rectangleHeight/2 + radius)) { return false; }

    if (circleDistanceX <= (rectangleWidth/2)) { return true; } 
    if (circleDistanceY <= (rectangleHeight/2)) { return true; }

    float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
                         pow(circleDistanceY - rectangleHeight/2, 2);

    return (cornerDistance_sq <= pow(radius,2));
}

void keyPressed(){
  switch(key){
  case 27:
    exit();
    break;
  case ' ':
    instructionMode = !instructionMode;
    break;
  default:
    break;
  } 
}

void drawScore()
{
  fill(0, 0, 0, 30);
  int topX = 490;
  int topY = 14;
  rectMode(CENTER);
  stroke(0, 0, 0, 70);
  strokeWeight(2);
  rect(topX, topY, 210, 20, 3);
 
  fill(40, 40, 40);
  textSize(9);
  text("torpedoes: " + (10-currentTorpedo) + " hits: " + numShipsSunk, 590, 20);
  
}


void instructionMode(){
  fill(0, 0, 0, 30);
  rect(0, 0, width, height );
  fill(0, 0, 0, 100);
  stroke(0, 0, 0, 70);
  strokeWeight(4);
  rect(40, 20, width-80, height-40, 10);
  
  
  fill(255, 255, 255);
  textAlign(CENTER, TOP);
  int y = 40;
  textSize(21);
 
  text("Welcome to Sea Battle", 320, y);
  y += 50;  
  textSize(11);
  text("press Space Bar to play", 320, y);
  y += 20;
  text("press <- and -> to move the target window", 320, y);
  y+= 20;
  text("press Up to shoot a torpedo", 320, y);
  fill(0, 255, 255);
  textAlign(RIGHT, BOTTOM);
  
  strokeWeight(1);
  
}



