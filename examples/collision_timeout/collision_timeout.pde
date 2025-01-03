/*
  Collision detection and timeout (with fading)
*/

int shapes = 200;
float[] speedX = new float[shapes];
float[] speedY = new float[shapes];
float[] x = new float[shapes];
float[] y = new float[shapes];
float[] w = new float[shapes];
float[] h = new float[shapes];
color[] colors = new color[shapes];
int timeLimit = 15;

void setup() {
  size(400, 400);
  frameRate(30);
  noStroke();
  
  // Fill the arrays with random values
  for (int i=0; i<shapes; i++) {
    x[i] = width/2;
    y[i] = height/2;
    w[i] = random(2, 12);
    h[i] = w[i];
    colors[i] = color(random(255), random(255), random(255));
    speedX[i] = random(-5, 5);
    speedY[i] = random(-2, 2);
  }
}

void draw() {
  // Fade effect
  fill(255, 40);
  rect(0, 0, width, height);
  
  // Normal effect
  //background(255);
  for (int i=0; i<shapes; i++) {
    fill(colors[i]);
    rect(x[i], y[i], w[i], h[i]);
    x[i] += speedX[i];
    y[i] += speedY[i];
    
    // Check display window edge collisions
    if (x[i] > width - w[i]) {
      x[i] = width - w[i];
      speedX[i] *= -1;
    } else if (x[i] < 0) {
      x[i] = 0;
      speedX[i] *= -1;
    } else if (y[i] > height - h[i]) {
      y[i] = height - h[i];
      speedY[i] *= -1;
    } else if (y[i] < 0) {
      y[i] = 0;
      speedY[i] *= -1;
    }
  }
  
  // Stop drawing when the time limit is reached
  if (millis() >= timeLimit * 1000) {
    noLoop();
  }
}
