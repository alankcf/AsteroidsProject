class Button {
  
  //variables
  int x, y, w, h; //could do PVector  
  String text;
  color normal, highlight;
  boolean clicked;
  
  //constuctor
  Button(String t, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    highlight = high;
    normal = norm;
    clicked = false;
  }

//behavior functions
void show() {
  strokeWeight(1);
  
  if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2) {
    fill(highlight);
  } else fill (normal);
  rect(x, y, w, h, 30);
  
  if (mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2) {
    fill(normal);
  } else fill (highlight);
  textSize(w/5);
  textAlign(CENTER);
  text(text, x, y+10);
  
  
  clicked = mouseReleased && mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2;
  //  clicked = true;
  //} else clicked = false;
  
  //if (clicked == true) {
  //  background (normal);
  //}
  }
}

void click () {
 mouseReleased = false;
 if (mousePressed) wasPressed = true;
 if (wasPressed && !mousePressed) { //we clicked the mouse but not pressing it now
    mouseReleased = true;
    wasPressed = false;
 }
}
