class Bullet {
  int lives;
  PVector location;
  PVector velocity;
  
  Bullet() {
    lives = 1;
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(10); // mag = magnitude
  }
  
  void show() {
    stroke(255);
    noFill();
    ellipse(location.x, location.y, 10, 10);
  }
  
  void act() {
    location.add(velocity);
    
    if (location.y < -50)         location.y = height + 50;
    if (location.y > height + 50) location.y = -50;
    if (location.x < -50)         location.x = width + 50;
    if (location.x > height + 50) location.x = -50;
  }
}
