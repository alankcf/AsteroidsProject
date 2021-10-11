class UFO extends GameObject {
  
  //Instance Variables
  
  PVector direction;
  int shotTimer, threshold;
  int flame;
  int loc;
  
  int time;
  
  //Constructors
  UFO() {
   lives = 1;
   loc = int (random(1, 5));
   if (loc == 1) location = new PVector(-50, random(-50, height-50)); // y random
   else if (loc == 2) location = new PVector(height + 50, random(-50, height-50)); // y random
   else if (loc == 3) location = new PVector(random(-50, width-50), -50);  // x random
   else if (loc == 4) location = new PVector(random(-50, width-50), width-50);  // x random
   velocity = new PVector(2, 1);
   direction = new PVector(0, -0.1);
   shotTimer = 0;
   threshold = 60; //time between shots
   size = 70;
   //time = 500; //time between UFO
  }
  
 
  
  //Behavior Functions
  void show() { 
    
    //spaceship
    fill(0);
    stroke(red);
    //rect(location.x, location.y, size, size); 
    image(UFO, location.x, location.y, size, size);
    
  }
  
  void act() {
    super.act();
    
    shotTimer++;
    
    if (velocity.mag() > 5) {
     velocity.setMag(5); 
    }    
    
    //how the UFO moves    
    UFOpath = int (random(0, 5));
    if (UFOpath == 0) {
      location.add(velocity);          
    } else if (UFOpath == 1) {  
      location.sub(velocity);    //sub = subtract
    } else if (UFOpath == 2) {  
      direction.rotate (-radians(5));
    } else if (UFOpath == 3) {  
      direction.rotate (radians(5));
    } else if (UFOpath == 4 && shotTimer > threshold) {
      myObjects.add(new UFO_Bullet(location.x, location.y, myShip.location.x - location.x, myShip.location.y - location.y));
      shotTimer = 0;
    
    }
    
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      
      if (myObj instanceof Bullet) {
        if (dist(location.x,location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
            myObj.lives = 0;
            lives = 0;
            generate = 0;  
            //shiplives ++;
            myObjects.add(new Particle(location.x, location.y));   
            //myObjects.add (new UFO());
          }         
                          
        }
      i++;
    }
    
    //come back new
    //if (location.y < -50) {
    //  lives = 0;
    //  myObjects.add (new UFO());
    //}
    //if (location.y > height + 50) {
    //  lives = 0;
    //  myObjects.add (new UFO());
    //}
    //if (location.x < -50)         {
    //  lives = 0;
    //  myObjects.add (new UFO());
    //}
    //if (location.x > height + 50) {      
    //  lives = 0;
    //  myObjects.add (new UFO());
    //}
  }
}
