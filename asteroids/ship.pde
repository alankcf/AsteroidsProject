class Ship extends GameObject {
  
  //Instance Variables
  
  PVector direction;
  int shotTimer, threshold;
  int flame;
  
  //Constructors
  Ship() {
   lives = 3;
   location = new PVector(width/2, height/2);
   velocity = new PVector(0,0);
   direction = new PVector(0, -0.1);
   shotTimer = 0;
   threshold = 20; //time between shots
   flame = 255;
  }
  
  //Behavior Functions
  void show() { 
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    
    stroke(flame);
    //fill(flame);
    triangle(-50, -17, -50, 17, -15, 0);
    //spaceship
    fill(0);
    stroke(255);
    triangle(-25, -12.5, -25, 12.5, 25, 0);
    
    
    
    popMatrix();
  }
  
  void act() {
    
    //spaceship velocity
    //location.add(velocity);
    
    super.act();
    
    shotTimer++;
    
    if (velocity.mag() > 5) {
     velocity.setMag(5); 
    }
    
    if (upkey) {
      velocity.add(direction);
      flame = #FA7923;
    } else {
      flame = 0;
    }
    if (downkey)   velocity.sub(direction); //sub = subtract
    if (leftkey)   direction.rotate (-radians(5));
    if (rightkey)  direction.rotate (radians(5));
    if (spacekey && shotTimer > threshold) {
      myObjects.add(new Bullet());
      shotTimer = 0;
    }
    
  }
}
