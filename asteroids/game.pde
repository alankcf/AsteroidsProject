void game () {
  
  textSize(25);
  fill(yellow);
  text("Lives:" + shiplives, 130, 100);
  
  if (shiplives == 0) {
    mode = GAMEOVER;
  }
  generate++;
  //println(generate);
    if (generate == 500) {
      myObjects.add (new UFO());
      generate = 0;
    } 
   
  
   //teleport bar
   rectMode(CORNER);
   fill(darkyellow);
   stroke(darkyellow);
   rect(100, 670, 200, 50);
   fill(darkblue);
   stroke(darkyellow);
   rect(100, 670, teleport, 50);   
   
    if (teleport < 200) {
     teleport = teleport + 1; //0.1;
   } else {
   teleport = 200;
   fill(green);
   textSize(20);
   text("Teleport READY", 200, 700);
}
}

void gameClicks() {
  //mode = GAMEOVER;
}
