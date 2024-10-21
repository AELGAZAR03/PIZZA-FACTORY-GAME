class NewToppings {
  ArrayList<Topping> newToppingsList;     // List of new toppings

  NewToppings() {
    newToppingsList = new ArrayList<Topping>();
    
    
    newToppingsList.add(new Topping(loadImage("pepper.png"), 100, 300));
    newToppingsList.add(new Topping(loadImage("PizzaSauce.png"), 200, 300));
    newToppingsList.add(new Topping(loadImage("mushroom.png"), 300, 300));
    newToppingsList.add(new Topping(loadImage("onion.png"), 400, 300));
    newToppingsList.add(new Topping(loadImage("prawn.png"), 500, 300));
  }

  void display() {
    for (Topping t : newToppingsList) {
      t.display();
    }
  }

  void update() {
    for (Topping t : newToppingsList) {
      t.update();
    }
  }

  void checkMouseDragged() {
    for (Topping t : newToppingsList) {
      if (t.isMouseOver() && !t.isAttached) {           //mouse is over a topping and it's not attached
        t.x = mouseX - 5; 
        t.y = mouseY - 5;
      }
    }
  }

  void checkMouseReleased(ArrayList<Pizza> pizzas) {
    for (Topping t : newToppingsList) {
      for (Pizza p : pizzas) {
        if (!t.isAttached && t.isMouseOverPizza(p)) {
          t.attachToPizza(p);           // Attach to Pizza
          t.resetPosition();  // Reset the position of the topping for reuse
        }
      }
    }
  }
}
