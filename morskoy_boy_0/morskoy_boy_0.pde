
int x = 0;
int y = 100;
int speed = 1;
Target target;
Ship ship;
Torpedo lucky;

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
  if(lucky != null)
  {
    lucky.drawTorpedo();
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

void checkKeys(){
  if (keyPressed) {
    if (keyCode == RIGHT) {
      target.moveRight();
      println("right");
    }   

    if (keyCode == LEFT) {
      target.moveLeft();
       println("left");
    }
    
    if (keyPressed && key == ' '){
   //   println("***SHOOT***");
      lucky = new Torpedo(target.centerX, target.centerY);
      lucky.shoot();
    }   
    
  } 
}
