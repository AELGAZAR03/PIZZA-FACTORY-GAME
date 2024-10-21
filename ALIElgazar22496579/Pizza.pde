class Pizza {
  float x, y;
  PImage img;
  ArrayList<Topping> toppings;             // List of toppings on this pizza

  Pizza(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    img = loadImage("pizza.png");
    toppings = new ArrayList<Topping>();     // Initialize the toppings list
  }

  void addTopping(Topping t) {
    toppings.add(t);            // Add a topping to the pizza
  }

  void display() {
    image(img, x, y, 90, 80);        
    for (Topping t : toppings) {    // Display all toppings on this pizza
      if (t.isAttached) {
        image(t.img, x-5, y-5, 100, 90);     // Adjust based on the size of the toppings
      }
    }
  }
  boolean hasToppings() {
    return !toppings.isEmpty();
  }
  void update() {
    if (x < -90) {   // Check if pizza is out of the screen
      if (this.hasToppings()) {
        Gamescore.increment();                // Increment score for topped pizza
        for (Topping t : toppings) {
          t.resetPosition();            // Reset the topping's position
        }
      } else {
        gameOver = true;        // End the game if pizza has no toppings
      }
      x = width;
      toppings.clear(); // Clear toppings
    }
  }
}
