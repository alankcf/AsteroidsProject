class UFO_Bullet extends GameObject {
  
  int timer;
  
  UFO_Bullet() {
    timer = 30;
    lives = 1;
    location = new PVector(myUFO.location.x, myUFO.location.y);
    velocity = new PVector(myUFO.direction.x, myUFO.direction.y);
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
