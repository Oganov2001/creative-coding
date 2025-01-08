/*
  Simple Motion Physics II
*/
int shapes = 200;
float[]w = new float[shapes];
float[]h = new float[shapes];
float[]x = new float[shapes];
float[]y = new float[shapes];
float[]xSpeed = new float[shapes];
float[]ySpeed = new float[shapes];
float[]gravity = new float[shapes];
float[]damping = new float[shapes];
float[]friction = new float[shapes];
// Control the rate in which rects are spawned
float shapeCount;
float birthRate = .25;
// Control the width of spray when rects are spawned
float sprayWidth = 5;

void setup() {
   size(400, 400);
   noStroke();
   // Initialize the arrays with random values
   for (int i=0; i<shapes; i++) {
     x[i] = width/2.0;
     w[i] = random(2,17);
     h[i] = w[i];
     xSpeed[i] = random(-sprayWidth, sprayWidth);
     gravity[i] = .1;
     damping[i] = random(.7, .98);
     friction[i] = random(.64, .95);
   }
}

void draw() {
  // Fade background.
  fill(255, 100);
  rect(0, 0, width, height);
  fill(0);
  
  // shapeCount spawns rects over time
  for (int i=0; i<shapeCount; i++) {
    rect(x[i], y[i], w[i], h[i]);
    x[i] += xSpeed[i];
    ySpeed[i] += gravity[i];
    y[i] += ySpeed[i];
    
    // Collision detection
    if (y[i] >= height-h[i]) {
      y[i] = height-h[i];
      // Bounce
      ySpeed[i] *= -1.0;
      // Slow down vertical motion on ground collision
      ySpeed[i] *= damping[i];
      // Slow down lateral motion on ground collision
      xSpeed[i] *= friction[i];
    }
    if (x[i] >= width-w[i]) {
      x[i] = width-w[i];
      xSpeed[i] *= -1.0;
    }
    if (x[i] <= 0) {
      x[i] = 0;
      xSpeed[i] *= -1.0;
    }
  }
  
  if (shapeCount < shapes) {
    shapeCount += birthRate;
  }
}
