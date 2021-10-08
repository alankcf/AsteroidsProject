class Fire extends GameObject {
  
  int t; //transparancy
  PVector nudge;
  
  Fire() {
    lives = 1;
    size = int (random(5, 10)); //try random
    t = int(random(200, 255)); //255 = solid
    location = myShip.location.copy();
    nudge = myShip.direction.copy();
    nudge.rotate (PI);
    nudge.setMag(30);
    location.add(nudge);
    velocity = myShip.direction.copy();
    velocity.rotate(PI+random(-0.3, 0.3)); //180 degrees
    velocity.setMag(5); //random number?
  }
  
  //override
  void show () {
    noStroke();
    fill(orange, t);
    square(location.x, location.y, size);
  }
  
  void act () {
    super.act();
    t = t - 10;
    if (t <= 0) lives = 0;
  }
}
