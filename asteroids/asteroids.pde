//Alan Fung
//Asteroids Project
//October 2021

//Stuff to Do
// 1. Does teleport work?
// 2. Why velocity faster only after a win, but not a loss?
// 3. Make more visually pleasing

boolean upkey, downkey, leftkey, rightkey, spacekey, enterkey;
Ship myShip;
//UFO myUFO;
ArrayList<GameObject> myObjects;

//colors
color pink = #EAA7FF;
color green = #A7FFB7;
color white = #FFFFFF;
color brown = #896120;
color red = #F70000;
color orange = #FA8303;
color blue = #03ADFA;
color yellow = #E8BB3F;
color black = #030303;
color darkyellow = #FFAC12;
color darkblue = #272D4D;
color purple = #6E06B9;
color darkred = #F25D5D;
color grey = #48423F;

//mode variables
int mode; 
final int INTRO = 0;
final int GAME = 1;
final int GAMEOVER = 2;

//gif
PImage [] gif;
int numberOfFrames;
int f;

//UFO pic
PImage UFO;

//font
PFont font;

//UFO random path
int UFOpath;

//ship lives
int shiplives;

//immunity
int immune;

//counting of asteroids destroyed
int count;

//generate UFO timer
int generate;

//teleport
float teleport;

void setup() {
  size(800,800);
  imageMode(CENTER);
  rectMode(CENTER);
  myShip = new Ship();
  //myUFO = new UFO();
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myShip);
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new UFO());
  
  //mode
  mode = INTRO; 
  
  //UFO image
  UFO = loadImage("alienship.png");
  
  //gif
  numberOfFrames = 40;
  gif = new PImage [numberOfFrames];
  
  int i = 0;
  while (i < numberOfFrames) {
    if (i < 10) {
      gif[i] = loadImage("frame_00"+i+"_delay-0.03s.gif");
     } else if (i < 40) {
       gif[i] = loadImage("frame_0"+i+"_delay-0.03s.gif");
     }
    i++;
    }
 
 //font
  font = createFont("NotoSansMono-Light.ttf", 2);
  
  //UFO generator timer
  generate = 0;
  
  //teleport timer
  teleport = 0;
}

void draw() {
  background(0);
  //myShip.show();
  //myShip.act();
  
  int i = 0;
  while (i < myObjects.size() && mode == GAME) {
    GameObject myObj = myObjects.get(i);
    
    myObj.show();
    myObj.act();
    
    if (myObj.lives == 0) {
      myObjects.remove(i); 
    } else if (shiplives == 0) {
      myObjects.remove(i);
    } else if (count == 21) {
      myObjects.remove(i);
    } else {
      i++;
    }    
  }
  
   //modes
   if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Error: mode = " + mode);
  }
  
  if (mode != INTRO && mode != GAMEOVER) {
    mode = GAME;
  }
}

void keyPressed() {
  if (keyCode == UP)    upkey    = true;
  if (keyCode == DOWN)  downkey  = true;
  if (keyCode == LEFT)  leftkey  = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == ENTER) enterkey = true;
  if (key == ' ')       spacekey = true;
  
}

void keyReleased() {
  if (keyCode == UP)    upkey    = false;
  if (keyCode == DOWN)  downkey  = false;
  if (keyCode == LEFT)  leftkey  = false;
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == ENTER) enterkey = false;
  if (key == ' ')       spacekey = false;  
}
  
