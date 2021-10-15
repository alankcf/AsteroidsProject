class Ship extends GameObject {
  
  //Instance Variables
  
  PVector direction;
  int shotTimer, threshold;
  //int a, b;
  //int flame;
  
  //Constructors
  Ship() {
   shiplives = 3;
   lives = 1;
   count = 0;
   location = new PVector(width/2, height/2);
   velocity = new PVector(0,0);
   direction = new PVector(0, -0.1);
   shotTimer = 0;
   threshold = 10; //time between shots
   immune = 0;
   a = int (random(0, width));
   b = int (random(0, height));
  }
  
  //Behavior Functions
  void show() { 
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    noFill();
        
    //stroke(flame);
 
    //triangle(-50, -17, -50, 17, -15, 0);
    if (immune >= 100) {
    stroke(white);
    } else if (immune < 100) {
      //fill(black);
      //stroke(white);
      //ellipse(location.x,location.y, 75, 75);
      stroke(yellow);
      fill(yellow);
    }
    triangle(-25, -12.5, -25, 12.5, 25, 0);
    //spaceship
    popMatrix();
    
  }
  
  void act() {
    
    //spaceship velocity
    //location.add(velocity);
    
    super.act();
    
    shotTimer++;
    immune++;
    
    if (velocity.mag() > 5) {
     velocity.setMag(5); 
    }
    
    if (upkey) {
      velocity.add(direction);
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      //flame = #FA7923;
    } 
    
    if (downkey)   velocity.sub(direction); //sub = subtract
    if (leftkey)   direction.rotate (-radians(5));
    if (rightkey)  direction.rotate (radians(5));
    if (spacekey && shotTimer > threshold) {
      myObjects.add(new Bullet());
      shotTimer = 0;
    }
    //print(teleport);
    if (enterkey && teleport >= 200) {
      
      
      int c = 0;
      while (c < myObjects.size()) {
        GameObject myObj = myObjects.get(c);
           
        if (myObj instanceof Asteroid) {
          if ((dist(a, b, myObj.location.x, myObj.location.y) < 200)) {
            moves = false;
          }  else if (dist(a, b, myObj.location.x, myObj.location.y) >= 200) {
            moves = true;   
          }
            //} else while (dist(a, b, myObj.location.x, myObj.location.y) < 200) {
            //  location = new PVector(a, b);     
            //  a = int (random(0, width));
            //  b = int (random(0, height));
            //}
            
          if (moves == true) {
            location = new PVector(a, b);
            a = int (random(0, width));
            b = int (random(0, height));
          } else if (moves == false) {
            a = int (random(0, width));
            b = int (random(0, height));
          }
          
    
      }
      //if (dist(myShip.location.x, myShip.location.y, location.x, location.y) <=  400) {
      //if (a - location.x > 200 && b - location.y > 200) {
      //if (moves == true) {
      //  location = new PVector(a, b);
      //  teleport = 0;
      //  a = int (random(50, height-50));
      //  b = int (random(50, width-50));
         c++;
         
      }
      teleport = 0;
    }
    
    //speed limit
    if (upkey == false) velocity.setMag(velocity.mag()*0.99);    
    
    int i = 0;    
    //while (immune > 20) {
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      
      //bullet
      if (myObj instanceof UFO_Bullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <=  25 + myObj.size) {
            //myObj.lives = 0;
            if (immune > 100) {
            immune = 0;
            shiplives = shiplives - 1;          
            }
          }
        }     
      i++;     
    }
    
   
    } 
  
}
