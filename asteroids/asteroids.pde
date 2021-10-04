boolean upkey, downkey, leftkey, rightkey, spacekey;
Ship myShip;
ArrayList<Bullet> myBullets;

//mode variables
int mode;
final int INTRO = 0;
final int GAME = 1;
final int GAMEOVER = 2;

void setup() {
  size(800,800);
  imageMode(CENTER);
  myShip = new Ship();
  myBullets = new ArrayList<Bullet>();
}

void draw() {
  background(0);
  myShip.show();
  myShip.act();
  
  int i = 0;
  while (i < myBullets.size()) {
    Bullet b = myBullets.get(i);
    b.show();
    b.act();
    i++;
  }
  
   if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: mode = " + mode);
  }
}

void keyPressed() {
  if (keyCode == UP)    upkey    = true;
  if (keyCode == DOWN)  downkey  = true;
  if (keyCode == LEFT)  leftkey  = true;
  if (keyCode == RIGHT) rightkey = true;
  if (key == ' ')       spacekey = true;
  
}

void keyReleased() {
  if (keyCode == UP)    upkey    = false;
  if (keyCode == DOWN)  downkey  = false;
  if (keyCode == LEFT)  leftkey  = false;
  if (keyCode == RIGHT) rightkey = false;
  if (key == ' ')       spacekey = false;
  
}
  
