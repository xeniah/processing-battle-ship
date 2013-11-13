
int x = 0;
int y = 100;
int speed = 1;
Target t;
Ship ship;

// Setup does not change
void setup() {
  size(200,200);
  smooth();
  t = new Target();
  ship = new Ship();
}

void draw() {
  background(255);
  checkKeys();
  ship.move();
  ship.drawShip(); 

  display();
}


// A function to display the scene
void display() {
  // draw the 'ship'
//  stroke(175);
//  fill(175);
//  ellipse(x,100,100,20);
  
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
    
    if (keyCode == UP){
      
      println("jump");
    }   
    
  } 
}
