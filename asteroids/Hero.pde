class Hero extends GameObject {

  PVector direction;
  float speed;
  int roomX, roomY;

  Hero() {
    lives = 1;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    speed = 5;
    roomX = 1;
    roomY = 1;
  }

  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    fill(purple);
    circle(0, 0, 50);
    popMatrix();
    fill(pink);
  }

  void act() {
    super.act();
    
    if (upkey == false) velocity.setMag(velocity.mag() *0);
    
    //if (location.y >= 100) {
      if (upkey) velocity.y = -3;
    //} else location.y = 100;
   // if (location.y <= 700) {
      if (downkey) velocity.y = 3;
   // } else location.y = 700;
   // if (location.x >=100) {
      if (leftkey) velocity.x = -3;
    //} else location.x = 100;
    //if (location.x <= 700) {
      if (rightkey) velocity.x = 3;
    //} else location.x = 700;
      
      if (velocity.mag() > 3) {
      velocity.setMag(3);
    }
    //north exit
    if (northRoom == black && location.y == 100 + 3 && location.x > width/2-50 && location.x <= width/2 + 50) {
      roomY--;
      location = new PVector (width/2, 700 - 3-10);
    }
    //east exit
    if (eastRoom == black && location.x == 700 - 3 && location.y > height/2-50 && location.y <= height/2 + 50) {
      roomX++;
     location = new PVector (width*0.1+30, height/2);
    }
    //west exit
    if (westRoom == black && location.x == 100 + 3 && location.y > height/2-50 && location.y <= height/2 + 50) {
      roomX--;
      location = new PVector (700 - 3, height/2);
    }
    //south exit
    if (southRoom == black && location.y == 700 - 3 && location.x > height/2-50 && location.x <= height/2 + 50) {
      roomY++;
      location = new PVector (width/2, height*0.1+50);
    }
  }
}
