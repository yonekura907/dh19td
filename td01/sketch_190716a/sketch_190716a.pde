float np = 300;
float startcol;

float cx, cy;
float sx, sy;

void setup() {
  size(1280, 720);
  background(0);
  noFill();
  noiseSeed(100);
  startcol = random(255);
}


void draw() {
  beginShape();
  for(int i = 0; i < np; i++) {
    float angle = map(i, 0, np, 0, TWO_PI);
    cx = frameCount * 2 - 300;
    cy = height / 2 + 50 * sin(frameCount / 50);
    float xx = 100 * cos(angle + cx / 20);
    float yy = 100 * sin(angle + cx / 20);
    PVector v = new PVector(xx, yy);
    xx = (xx + cx) / 150;
    yy = (yy + cy) / 150;
    v.mult(2 + 1.5 * noise(xx, yy));
    vertex(cx + v.x, cy + v.y);
    if(i == 0) {
      sx = cx + v.x;
      sy = cy + v.y;
    }
  }
  
  colorMode(HSB);
  float hue = frameCount % 360;
  if(hue < 0) {
    hue += 255;
  }
  
  stroke(hue, 255, 255, 150);
  noFill();
  strokeWeight(1);
  vertex(sx, sy);
  
  endShape();
  
  if(frameCount > width + 500) {
    noLoop();
  }
  saveFrame("frames/######.tif");
}
