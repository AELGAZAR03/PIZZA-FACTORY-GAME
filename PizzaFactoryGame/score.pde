class Score {
  int score;
  Score() {
    score = 0;
  }
  void increment() {
    score++;
  }
  void reset() {
    score = 0;
  }
  void display() {
    fill(0);
    textSize(20);
    text("Score: " + score, width - 100, 30);
  }
}
