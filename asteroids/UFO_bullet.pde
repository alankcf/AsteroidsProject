class UFO_Bullet extends GameObject {
  
  int timer;
  PVector direction;
  
  UFO_Bullet(float x, float y, float a, float b) {
    timer = 30;
    lives = 1;
    //a = myShip.location.x - location.x;
    //b = myShip.location.y - location.y;
    location = new PVector(x, y);
    direction = new PVector (a, b);
    velocity = new PVector(a,b); // = new PVector(direction.x, direction.y);
    velocity.setMag(10); // mag = magnitude
    //velocity.add(Ship.velocity);
    size = 10;
  }
    
  void show() {
    stroke(red);
    fill(red);
    rect(location.x, location.y, size, size);
    //ellipse(location.x, location.y, size, size);
  }
  
  void act() {
    super.act();
    
    //make disapear
    timer--;
    
    if (timer <= 0) {
      lives = 0;
    }
   
  }
}
