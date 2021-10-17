class Particle extends GameObject {
  
  int t; //transparancy   
  
  Particle(float x, float y) {
    lives = 1;
    size = int (random(5, 10)); 
    t = int(random(200, 255)); //255 = solid
    location = new PVector (x, y);
    velocity = new PVector (0,0.1);
    velocity.rotate(PI+random(-2, 2)); //180 degrees
    velocity.setMag(1); 
  }
  
  //override
  void show () {
    noStroke();
    fill(#CECDCC, t);
    rect(location.x, location.y, size, size);
  }
  
  void act () {
    super.act();
    t = t - 7;   
    if (t <= 0) lives = 0;
  }
}
