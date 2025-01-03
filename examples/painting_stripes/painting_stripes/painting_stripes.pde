/*
  Painting stripes
*/

int x;
float speedX = 3.0;
int shapes = 100;
float[] y = new float[shapes];
float[] w = new float[shapes];
float[] h = new float[shapes];
color[] colors = new color[shapes];

void setup() {
  size(400, 400);
  frameRate(60);
  noStroke();
  
  // Fill the arrays with random values
  for (int i=0; i<shapes; i++) {
    y[i] = random(height);
    w[i] = random(15)+2;
    h[i] = w[i];
    colors[i] = color(random(255), random(255), random(255));
  }
}

void draw() {
 for (int i=0; i<shapes; i++) {
   fill(colors[i]);
   rect(x, y[i], w[i], h[i]);
 }
 x += speedX;
}
