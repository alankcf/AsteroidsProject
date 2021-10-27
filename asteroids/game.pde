void game() {
 
  background(green);
  line(0, 0, width, height);
  line(0, height, width, 0);
  
  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom = map.get(myHero.roomX + 1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  westRoom = map.get(myHero.roomX - 1, myHero.roomY);
  
  noStroke();
  fill(black);
  if (northRoom == black) { 
    ellipse(width/2, height * 0.1, 100, 100);
  }
  if (eastRoom == black) {
    ellipse(width*0.9, height/2, 100, 100);
  }
  if (southRoom == black) {
    ellipse(width/2, height * 0.9, 100, 100);
  }
  if (westRoom == black) {
    ellipse(width*0.1, height/2, 100, 100);
  }
  fill(yellow);
  strokeWeight(10);
  stroke(black);
  rect(400, 400, 650, 650);
  
  secondButton = new Button("GAME", width/2, 35, 200, 50, blue, purple);
  secondButton.show();
  myHero.show();
  myHero.act();
  if (secondButton.clicked) mode = GAMEOVER;
  
  int j = 0;
  while (j < myObjects.size()) {
    GameObject myObj = myObjects.get(j);

    myObj.show();
    myObj.act();

    if (myObj.lives == 0) {
      myObjects.remove(j);
    //} else if (shiplives == 0) {
    //  myObjects.remove(i);
    //} else if (count == 21) {
    //  myObjects.remove(i);
    } else {
      j++;
    }
  }
  image(map, 100, 100, 100, 100);
  int i = 0;
    while (i < num) {
      myCell = new DarknessCell(x[i], y[i], brickd);
      myCell.show();
      myCell.act();
      i++;
    }
}

void drawRoom() {  
}
