class ConveyorBelt {
  float beltSpeed;
  int beltHeight;
  int startY;

  ConveyorBelt(float speed, int height, int yPos) {
    beltSpeed = speed;
    beltHeight = height;
    startY = yPos;     // Y-position of the belt
  } 

  void update(ArrayList<Pizza> pizzas) {
    for (Pizza p : pizzas) {       // Move each pizza left by the belt's speed
      p.x -= beltSpeed;
      if (p.x < -100) {              // Check if pizza is off-screen
        p.x = width;                          // Reset pizza position
      }
    }
  }

  void display() {
    fill(100);
    noStroke();
    rect(0, startY, width, beltHeight+75);
  }
}
