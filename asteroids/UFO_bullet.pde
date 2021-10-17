class UFO_Bullet extends GameObject {

  int timer;
  PVector direction;

  UFO_Bullet(float x, float y, float a, float b) {
    timer = 30;
    lives = 1;
    location = new PVector(x, y);
    direction = new PVector (a, b);
    velocity = new PVector(a, b); 
    velocity.setMag(10); // mag = magnitude
    size = 10;
  }

  void show() {
    stroke(red);
    fill(red);
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
