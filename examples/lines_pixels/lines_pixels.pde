/*
  Creating lines with pixels.
*/

size(500, 300);
background(255);

// used by diagonal lines
float slope = float(height)/float(width);

PImage img = createImage(width, height, RGB);
color c = color(255, 255, 255);

// Horizontal line
for (int i=0; i<width; i++) {
  img.set(i, height/2, c);
}
//Vertical line
for (int i=0; i<height; i++) {
  img.set(width/2, i, c);
}
//Diagonal line (top left - bottom right)
for (float i=0; i<width; i++) {
  img.set(int(i), int(i*slope), c);
}
//Diagonal line (bottom left - top right)
for (float i=0; i<width; i++) {
  img.set(int(i), int(height-i*slope), c);
}

image(img, 0, 0);
