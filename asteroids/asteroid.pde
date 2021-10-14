class Asteroid extends GameObject {

int t; 

  Asteroid() {
    lives = 1;
    location = new PVector (random(0, width), random(0, height));
    velocity = new PVector (0,1);
    velocity.rotate (random(0, TWO_PI));
    size = 100;
  }
  
  Asteroid (int s, float x, float y) {
    lives = 1;
    location = new PVector (x, y);
    velocity = new PVector (0, 1);
    velocity.rotate (random(0, TWO_PI));
    size = s;
  }
  
  //Asteroid(int s, float x, float y, float t) {
  //  lives = 1;
  //  location = new PVector (x, y);
  //  velocity = new PVector (0, 1);
  //  velocity.rotate (random(0, TWO_PI));
  //  size = s;
  //  t = 255;
  //}
  
  void show () {
   noFill();
   fill(grey);
   stroke(255);
   //ellipse(location.x, location.y, size, size);
   image(asteroid, location.x, location.y, size, size);
  }
  
  void act() {
    super.act();
    
    //a = int (random(50, height-50));
    //b = int (random(50, width-50));
    //if (a >= location.x - 200 && a >= location.y - 200 || a >= location.x + 200 && a >= location.y + 200) {
    //  moves = true;
    //} else {
    //  a = int (random(50, height-50));
    //  b = int (random(50, width-50));
    //}
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      
      //bullet
      if (myObj instanceof Bullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <=  size/2 + myObj.size) {
            myObj.lives = 0;
            lives = 0;
            count = count + 1;
            //print(count);
            if (count == 21) {
              mode = GAMEOVER;
            }
            if (size > 25) {
            myObjects.add(new Asteroid(size/2, location.x, location.y));
            myObjects.add(new Asteroid(size/2, location.x, location.y));
            }
            myObjects.add(new Particle(location.x, location.y));
             myObjects.add(new Particle(location.x, location.y));;
             myObjects.add(new Particle(location.x, location.y));
            myObjects.add(new Particle(location.x, location.y));
             myObjects.add(new Particle(location.x, location.y));
              myObjects.add(new Particle(location.x, location.y));
          }
        }
       if (myObj instanceof Ship) {
         if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <=  size/2 + myObj.size) {
           if (immune > 100) {
             shiplives--;
             immune = 0;           
             //myObj.lives = 0;
             lives = 0;
             if (size > 25) {
                myObjects.add(new Asteroid(size/2, location.x, location.y));
                myObjects.add(new Asteroid(size/2, location.x, location.y));
              }
             myObjects.add(new Particle(location.x, location.y));
             myObjects.add(new Particle(location.x, location.y));
             myObjects.add(new Particle(location.x, location.y));
             myObjects.add(new Particle(location.x, location.y));
             myObjects.add(new Particle(location.x, location.y));
            }
         }
       }
      i++;     
    }    
  }  
}
