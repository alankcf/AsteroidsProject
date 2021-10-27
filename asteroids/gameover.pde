void gameover () {
  background(orange);  
  
  if (shiplives == 0) {
    textSize(100);
    text("GAMEOVER", width/2, height/3);
    textSize(20);
    fill(black);
    text("(you died)", width/2, height/2);
  }
  
  if (count == 21) {    
    background(orange);
    fill(black);
    textSize(100);
    text("YOU WON", width/2, height/3);
  }  
}

void gameoverClicks () {
    
    //reset
    mode = INTRO;  
    count = 0;
    shiplives = 3;
    teleport = 0;
    myShip.lives = 0;
    myObjects = new ArrayList<GameObject>();
    myShip = new Ship();
    myObjects.add(myShip);
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    //myObjects.add(new Bullet());
    myObjects.add(new Fire());
    myShip.location = new PVector(width/2, height/2);
    myShip.direction = new PVector(0, -0.1);
    myShip.velocity = new PVector(0,0); 
}
