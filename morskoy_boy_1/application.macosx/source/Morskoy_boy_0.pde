import ddf.minim.* ;
Minim minim;

//Movie blowUpSound;
AudioPlayer au_player1;

int x = 0;
int y = 100;
int speed = 1;
boolean instructionMode = true;
boolean hasPlayed = false;
PFont f;
int level = 120;
PImage bg;

Target target;
Ship ship;
int MAX_TORPEDOES = 10;
Torpedo [] torpedoes = new Torpedo[MAX_TORPEDOES];
int currentTorpedo = 0;
int numShipsSunk = 0;


void setup() {
  size(600,300);
  background(255);
  smooth();
  target = new Target();
  ship = new Ship();
  minim = new Minim(this);
  f = loadFont("PressStart2P-48.vlw");
  textFont(f, 18);
}

AudioPlayer getSound()
{
  int soundIndex = int (random(12));
  return minim.loadFile("boom" + soundIndex + ".wav") ;
  
}

void draw() {
     background(255);
     checkKeys();
     ship.drawShip(); 
     target.drawTarget();
     drawTorpedoes();
  //   drawLerp();
     
     if(instructionMode)
     {
       instructionMode();
     }else
     {
       if(currentTorpedo > MAX_TORPEDOES-1)
       {
          instructionMode = true;
       }else
       {
         drawScore();
       } 
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

void drawTorpedoes()
{
      for(int i = 0; i < 10; i++)
      {
          if(torpedoes[i] != null)
          {
            torpedoes[i].drawTorpedo();
            Torpedo t = torpedoes[i];
  
            if(t != null && t.amShooting && isCollidingCircleRectangle(t.centerX, t.centerY, 10, ship.centerX-ship.shipLength/4, ship.centerY-ship.shipHeight/2, ship.shipLength/2, ship.shipHeight))
            {
       //   println("************************** COLLIDED *********************************");
              ship.blowUp();
              t.hit();
              numShipsSunk++;
              au_player1 = getSound();
              au_player1.play();
          //    blowUpSound.stop();
          //    blowUpSound.play();
            }  
        }
      }
}

void keyReleased() {
   if (keyCode == UP){
     if(currentTorpedo < 10 && !instructionMode)
       {
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
  case 27: // escape
    exit();
    break;
  case ' ':
    instructionMode = !instructionMode;
    hasPlayed = true;
    currentTorpedo = 0;
    numShipsSunk = 0;
    torpedoes = new Torpedo[10];
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
  rectMode(CORNERS);
  fill(0, 0, 0, 30);
  rect(0, 0, width, height);
  fill(0, 0, 0, 100);
  stroke(0, 0, 0, 70);
  strokeWeight(4);
  rect(10, 20, width-10, height-40, 10);
  
  
  fill(255, 255, 255);
  textAlign(CENTER, TOP);
  int y = 40;
  textSize(21);
  if(!hasPlayed)
  {
    text("Welcome to Sea Battle", 320, y);
  }else
  {
    text("Game Over!", 320, y);
    textSize(14);
    y += 40;
    text("Final Score: " + numShipsSunk + " enemy vessels destroyed!", 320, y);
  }
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



