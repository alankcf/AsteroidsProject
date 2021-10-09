void gameover () {
  background(orange);  
  
  if (shiplives == 0) {
    textSize(100);
    text("GAMEOVER", width/2, height/3);
  }
  
  if (count == 21) {
    
    background(orange);
    fill(black);
    textSize(100);
    text("YOU WON", width/2, height/3);
    //shiplives = 0;
    //myObjects.add(new Asteroid());
    //myObjects.add(new Asteroid());
    //myObjects.add(new Asteroid());
  }  
}

void gameoverClicks () {
  mode = INTRO;
  shiplives = 3;
  if (count == 21) {
    count = 0;
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myShip.location = new PVector(width/2, height/2);
    myShip.direction = new PVector(0, -0.1);
  }
  
  
}
