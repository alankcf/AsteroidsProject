class GameObject {
  
  //common stuff
  int lives;
  PVector location;
  PVector velocity;
  int size;
  
  GameObject() {
    
  }
  
  void show() {
   
  }
  
  void act() {
  
    location.add(velocity);
    
    if (location.x <= 100) location.x = 100 + 3;
    if (location.x >= 700) location.x = 700 - 3;
    if (location.y <= 100) location.y = 100 + 3;
    if (location.y >= 700) location.y = 700 - 3;
  }
}
