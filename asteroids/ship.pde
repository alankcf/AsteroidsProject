class Ship extends GameObject {
  
  //Instance Variables
  
  PVector direction;
  int shotTimer, threshold;
  int flame;
  
  //Constructors
  Ship() {
   shiplives = 3;
   lives = 1;
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
    noFill();
        
    stroke(flame);
 
    triangle(-50, -17, -50, 17, -15, 0);
    stroke(255);
    triangle(-25, -12.5, -25, 12.5, 25, 0);
    //spaceship
    
    
    
    
    
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
    if (upkey == false) velocity.setMag(velocity.mag()*0.99);
    
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      
      //bullet
      if (myObj instanceof UFO_Bullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <=  25 + myObj.size) {
            //myObj.lives = 0;
            shiplives = shiplives - 1;
            location = new PVector(width/2, height/2);
            direction = new PVector(0, -0.1);
          }
        }
      i++;     
    }
    
  
    
  }
}
