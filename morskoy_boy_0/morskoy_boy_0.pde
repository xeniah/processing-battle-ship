
int x = 0;
int y = 100;
int speed = 1;
Target t;
Ship ship;
Torpedo lucky;

// Setup does not change
void setup() {
  size(200,200);
  smooth();
  t = new Target();
  ship = new Ship();
  lucky = new Torpedo();
}

void draw() {
  background(255);
  checkKeys();
  ship.drawShip(); 
  lucky.drawTorpedo();
  display();
}


// A function to display the scene
void display() {
  
  // draw the 'target'
  ellipseMode(CENTER);
  stroke(0);
  noFill();
  int tx = t.centerX;
  ellipse(tx,100,35,35);
  line(tx-5, y, tx+5, y);
  line(tx, y-5, tx, y+5);
}

void checkKeys(){
  if (keyPressed) {
    if (keyCode == RIGHT) {
      t.moveRight();
      println("right");
    }   

    if (keyCode == LEFT) {
      t.moveLeft();
       println("left");
    }
    
    if (key == ' '){
      println("***SHOOT***");
      lucky.shoot();
    }   
    
  } 
}
