ArrayList<Pizza> pizzas = new ArrayList<Pizza>();               // List to store pizzas
ArrayList<Topping> toppings = new ArrayList<Topping>();            // List to store initial toppings
NewToppings newToppings;                                    //to handle new toppings
ConveyorBelt belt;
//int toppingsReachedEndCount = 0;
Score Gamescore;
Level gameLevel;
int highScore = 0;           //to store the high score
String highScoreFile = "highscore.txt";       // File name to store the high score
boolean gameOver = false;                 //check if the game is over
void setup() {
  size(800, 600);
  Gamescore = new Score();
  gameLevel = new Level();
  belt = new ConveyorBelt(2, 50, height - 150);
  pizzas.add(new Pizza(width, height - 120));
  toppings.add(new Topping(loadImage("PizzaSauce.png"), 200, 300));
  toppings.add(new Topping(loadImage("mushroom.png"), 300, 300));
  newToppings = new NewToppings(); // Initialize the new toppings class
  highScore = loadHighScore();
}

void draw() {
  if (!gameOver) {
    background(255);
    Gamescore.display();
    gameLevel.updateLevel(Gamescore.score);   // Update level based on scor
    gameLevel.display();
    belt.update(pizzas);
    belt.display();

    for (Pizza p : pizzas) {
      p.display();
      p.update();     // Update pizza position and check for toppings
    }

    if (Gamescore.score < 2) {
      for (Topping t : toppings) {
        t.display();                //Display  toppings
      }
    } else {
      newToppings.display();
    }
  } else {
    background(0);   // Display game over message
    fill(255);
    textSize(32);
    text("Game Over ", width/2 - 100, height/2);
    textSize(10);
    text("GOOD LUCK NEXT TIME", width/2 - 80, height-260);
  }
  if (Gamescore.score > highScore) {     // Update high score if the current score is higher
    highScore = Gamescore.score;
    saveHighScore(highScore);
  }
  displayHighScore();
}
void displayHighScore() {
  textSize(15);
  text("High Score: " + highScore, 5, 20);
}

int loadHighScore() {               //load high score from a file
  String[] lines = loadStrings(highScoreFile);  // Read file
  if (lines.length > 0) {
    return int(lines[0]);       // Return high score if file is not empty
  } else {
    return 0;             // Return 0 if file is empty
  }
}

void saveHighScore(int score) {
  String[] lines = {str(score)};           // Convert score to string
  saveStrings(highScoreFile, lines);      // Save string to file
}

void mouseDragged() {
  for (Topping t : toppings) {
    if (t.isMouseOver() && !t.isAttached) {             // Check if the mouse is over a topping and it's not attached
      t.x = mouseX - 5;                      // Center the topping on the mouse
      t.y = mouseY - 5;
    }
  }
  newToppings.checkMouseDragged();
}

void mouseReleased() {
  for (Topping t : toppings) {
    for (Pizza p : pizzas) {
      if (!t.isAttached && t.isMouseOverPizza(p)) {    //topping is released over a pizza
        t.attachToPizza(p);         // attach to Pizza
        t.resetPosition();            // Reset the position of the topping for reuse
      }
    }
  }
  newToppings.checkMouseReleased(pizzas);    // Check releasing for new toppings
} 
