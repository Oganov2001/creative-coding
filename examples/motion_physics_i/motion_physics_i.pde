/*
  Simple Motion Physics I
*/
float speedX, speedY;
float x, y, w, h;
// Acceleration force
float gravity;
float damping, friction;

void setup() {
  size (400, 400);
  x = width/2;
  w = 20;
  h = w;
  fill(0);
  
  // Set dynamics
  speedX = 4;
  gravity = .5;
  damping = .8;
  friction = .9;
}

void draw() {
  fill(255, 60);
  rect(0, 0, width, height);
  
  fill(0);
  rect(x, y, w, h);
  x += speedX;
  speedY += gravity;
  y += speedY;
  
  // Check display window edge collisions
  if (x > width - w) {
    x = width - w;
    speedX *= -1;
  } else if (x < 0) {
    x = 0;
    speedX *= -1;
  } else if (y > height - h) {
    y = height - h;
    speedY *= -1;
    speedY *= damping;
    speedX *= friction;
  } else if (y < 0) {
    y = 0;
    speedY *= -1;
  }
}
