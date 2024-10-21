class Level {
  int currentLevel;
  int levelThreshold;    // Score needed to go to the next level

  Level() {
    currentLevel = 1;
    levelThreshold = 2;      // Initial threshold for level up
  }
  void updateLevel(int currentScore) {       // Update the level based on the score
    if (currentScore == 0) {         // Check if the score has been reset to zero
      currentLevel = 1;              // Reset level
      levelThreshold = 2;            // Reset threshold
    } else if (currentScore >= levelThreshold) {
      currentLevel++;              // Increase level
      levelThreshold *= 2;               // Double the threshold for the next level
    }
  }
  void display() { 
    fill(0);
    textSize(20);
    text("Level: " + currentLevel, width - 200, 30);
  }
}
