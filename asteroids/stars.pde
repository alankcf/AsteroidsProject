class Stars extends GameObject {
 

  Stars() {
    lives = 1;
    location = new PVector(random(0, width), random(0, height));
    size = int (random (1, 5));
  }

void show() {
  fill(random(234, 255));
  square(location.x, location.y, size);
  }
 // YOU HAVE TO INTIALIZE IT IN asteroids
}
