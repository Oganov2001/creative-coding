/*
  Acceleration with gravity
*/

float speedX, speedY;
float x, y, w, h;
// Acceleration force
float gravity;

void setup() {
  size(400, 400);
  x = width/2;
  w = 20;
  h = w;
  fill(0);
  speedX = 4;
  // Set acceleration force.
  gravity = .5;
}

void draw() {
  fill(255, 60);
  rect(0, 0, width, height);
  
  fill(0);
  rect(x, y, w, h);
  x += speedX;
  speedY += gravity;
  y += speedY;
  
  //Check display window edge collisions
  if (x > width - w) {
    x = width - w;
    speedX *= -1;
  } else if (x < 0) {
    x = 0;
    speedX *= -1;
  } else if (y > height - h) {
    y = height - h;
    speedY *= -1;
  } else if (y < 0) {
    y = 0;
    speedY *= -1;
  } 
}
