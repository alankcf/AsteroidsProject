class UFO extends GameObject {
  
  //Instance Variables
  
  PVector direction;
  int shotTimer, threshold;
  int flame;
  
  //Constructors
  UFO() {
   lives = 1;
   location = new PVector(random(0, width), random(0, height));
   velocity = new PVector(0,1);
   direction = new PVector(0, TWO_PI);
   //shotTimer = 0;
   threshold = 20; //time between shots
   
  }
  
  //Behavior Functions
  void show() { 
    //pushMatrix();
    //translate(location.x, location.y);
    //rotate(direction.heading());
    
    
    //spaceship
    fill(0);
    stroke(red);
    rect(location.x, location.y, 50, 50);
    
    
    
    //popMatrix();
  }
  
  void act() {
    
    //spaceship velocity
    //location.add(velocity);
    
    super.act();
    
    //shotTimer++;
    
    if (velocity.mag() > 5) {
     velocity.setMag(5); 
    }
    UFOpath = int (random(0, 10));
    if (UFOpath == 0) {
      velocity.add(direction);    
    } else if (UFOpath == 1) {  velocity.sub(direction); //sub = subtract
    } else if (UFOpath == 2) {  direction.rotate (-radians(5));
    } else if (UFOpath == 3) { direction.rotate (radians(5));
    }
    if (UFOpath > 3) {
      //myObjects.add(new Bullet());
      //shotTimer = 0;
    }
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      
      if (myObj instanceof Bullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <=  size/2 + myObj.size) {
            myObj.lives = 0;
            lives = 0;
           
            //if size = something:  stop new astroids
          }
        }
      i++;
    }
  }
}
