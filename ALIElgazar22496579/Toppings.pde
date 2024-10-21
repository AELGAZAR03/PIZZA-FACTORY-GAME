class Topping {
  float x, y;
  boolean isAttached;      // Is this topping attached to a pizza?
  PImage img;
  float initialX, initialY;      // Store the initial position

  Topping(PImage tempImg, float tempX, float tempY) {
    img = tempImg;
    x = tempX;
    y = tempY;
    initialX = tempX;          // Set initial position
    initialY = tempY;
    isAttached = false;
  }

  void attachToPizza(Pizza p) {
    float relativeX = x - p.x;       // Calculate relative position to the pizza
    float relativeY = y - p.y;
    Topping newTopping = new Topping(this.img, relativeX, relativeY);
    newTopping.isAttached = true;
    p.addTopping(newTopping);      // Add a new topping instance to the pizza
  }
  void resetPosition() {
    x = initialX;
    y = initialY;
    isAttached = false;
  }
void update() {
    if (isAttached && (x < 0 || x > width)) {
        isAttached = false; // Make the topping disappear
        img = null; // Set the topping image to null
    } else if (!isAttached && x < 0) { // Check if the topping has reached the end of the belt
        img = null;
        
    }
}
  void display() {    
    if (!isAttached && img != null) {
      image(img, x, y, 50, 50);
    }
  }

  void displayOnPizza(float pizzaX, float pizzaY) {
    if (isAttached) {                    
      image(img, pizzaX-5, pizzaY-5, 100, 90);   // Display this topping relative to the pizza's position
    }
  }

  boolean isMouseOver() {
    return mouseX > x && mouseX < x+50  && mouseY > y && mouseY < y +50; // Assuming toppings are 50x50
  }

  boolean isMouseOverPizza(Pizza p) {       
    return !isAttached && x + 50 > p.x && x < p.x + 100 && y + 50 > p.y && y < p.y + 50;   // Overlap detection between topping and pizza
  }
}
