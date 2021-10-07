class UFO extends GameObject {
  
  //Instance Variables
  
  PVector direction;
  int shotTimer, threshold;
  int flame;
  
  //Constructors
  UFO() {
   lives = 1;
   location = new PVector(random(50, width-50), random(50, height-50));
   velocity = new PVector(0, 1);
   direction = new PVector(0, -0.1);
   shotTimer = 0;
   threshold = 50; //time between shots
   size = 50;
  }
  
  //Behavior Functions
  void show() { 
    
    //spaceship
    fill(0);
    stroke(red);
    rect(myUFO.location.x, myUFO.location.y, size, size);    
  }
  
  void act() {
    super.act();
    
    shotTimer++;
    
    if (velocity.mag() > 5) {
     velocity.setMag(5); 
    }
    
    //how the UFO moves
    UFOpath = int (random(0, 3));
    if (UFOpath == 0) {
      myUFO.location.add(myUFO.velocity);    
    } else if (UFOpath == 1) {  
      myUFO.location.add(myUFO.velocity);    //sub = subtract
    //} else if (UFOpath == 2) {  
    //  myUFO.location.rotate (-radians(5));
    //} else if (UFOpath == 3) {  
    //  myUFO.location.rotate (radians(5));
    } else if (UFOpath == 2 && shotTimer > threshold) {
      myObjects.add(new UFO_Bullet());
      shotTimer = 0;
    }
    
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      
      if (myObj instanceof Bullet) {
        if (dist(myUFO.location.x, myUFO.location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
            myObj.lives = 0;
            lives = 0;
          }
        }
      i++;
    }
    
    //come back
    if (myUFO.location.y < -50)         myUFO.location.y = height + 50;
    if (myUFO.location.y > height + 50) myUFO.location.y = -50;
    if (myUFO.location.x < -50)         myUFO.location.x = width + 50;
    if (myUFO.location.x > height + 50) myUFO.location.x = -50;
  }
}
