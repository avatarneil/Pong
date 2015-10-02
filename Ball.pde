class Ball {
  int x;
  int y;
  int xSpeed;
  int ySpeed;
  int radius;
  
  // Constructor method. Initialize starting values.
  Ball() {
    x = 250;
    y = 250;
    xSpeed = (int(random(2,5)));
    ySpeed = (int(random(1,4)));
    radius = 5;
  }
  
  // Flip the speed along the x axis. This method is called when the ball should bounce.
  void bounceX() {
   xSpeed = xSpeed * -1;
  }
  // Flip the speed along the y axis. This method is called when the ball should bounce.
  void bounceY() {
   ySpeed = ySpeed * -1;
  }
  
  // Update the x and y coordinates of the ball. Bounce on the y axis if needed.
  void update() {
    x = x + xSpeed;
    y = y + ySpeed;
    if (y + radius > height || y - radius < 0) {
      bounceY();
    }
    radius = 7;
  }
  
  // Display method. This one works just fine -- don't make any changes.
  void display() {
    pushMatrix();
    translate(x, y);
    fill(37,247,196);
    ellipse(0, 0, radius*2, radius*2);
    popMatrix();
  }
  
  // Overlaps method. It takes a Paddle object as a parameter,
  //    then compares it to the ball to see if it overlaps.
  //    If they overlap, it returns true. Otherwise, it returns false.
  boolean overlaps(Paddle p) {
    if (x + radius > p.getLeftSide() && x - radius < p.getRightSide()) {
      if (y + radius > p.getTopSide() && y - radius < p.getBottomSide()) {
        return true;
      }
    }
    return false;
  }
}