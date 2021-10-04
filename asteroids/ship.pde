class Ship {
  
  //Instance Variables
  int lives;
  PVector location;
  PVector velocity;
  PVector direction;
  
  //Constructors
  Ship() {
   lives = 3;
   location = new PVector(width/2, height/2);
   velocity = new PVector(0,0);
   direction = new PVector(0, -0.1);
  }
  
  //Behavior Functions
  void show() { 
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    
    //spaceship
    noFill();
    stroke(255);
    triangle(-25, -12.5, -25, 12.5, 25, 0);
    
    popMatrix();
  }
  
  void act() {
    
    //spaceship velocity
    location.add(velocity);
    
    if (upkey)     velocity.add(direction);
    if (downkey)   velocity.sub(direction); //sub = subtract
    if (leftkey)   direction.rotate(-radians(5));
    if (rightkey)  direction.rotate(radians(5));
    if (spacekey)  myBullets.add(new Bullet());
    
    //come back
    if (location.y < -50)         location.y = height + 50;
    if (location.y > height + 50) location.y = -50;
    if (location.x < -50)         location.x = width + 50;
    if (location.x > height + 50) location.x = -50;
  }
}
