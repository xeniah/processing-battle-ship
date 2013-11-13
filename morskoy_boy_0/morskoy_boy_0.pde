
int x = 0;
int y = 100;
int speed = 1;
Target target;
Ship ship;
Torpedo [] torpedoes = new Torpedo[10];
int currentTorpedo = 0;

// Setup does not change
void setup() {
  size(600,200);
  smooth();
  target = new Target();
  ship = new Ship();
}

void draw() {
  background(255);
  checkKeys();
  ship.drawShip(); 
  for(int i = 0; i < 10; i++)
  {
    if(torpedoes[i] != null)
    {
        torpedoes[i].drawTorpedo();
    }
  }
  
  display();
}


// A function to display the scene
void display() {
  
  // draw the 'target'
  ellipseMode(CENTER);
  stroke(0);
  noFill();
  int tx = target.centerX;
  ellipse(tx,100,35,35);
  line(tx-5, y, tx+5, y);
  line(tx, y-5, tx, y+5);
}

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
