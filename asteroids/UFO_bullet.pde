class UFO_Bullet extends GameObject {
  
  int timer;
  
  UFO_Bullet(float x, float y) {
    timer = 30;
    lives = 1;
    location = new PVector(x, y);
    velocity = new PVector(0,1); // = new PVector(direction.x, direction.y);
    velocity.setMag(10); // mag = magnitude
    //velocity.add(Ship.velocity);
    size = 10;
  }
    
  void show() {
    stroke(red);
    noFill();
    ellipse(location.x, location.y, size, size);
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
