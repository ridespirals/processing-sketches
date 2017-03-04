int k = -4;

class Orbit {
  float x;
  float y;
  float r;
  Orbit parent;
  Orbit child;
  float speed;
  float theta;
  int n;
  
  Orbit(float x_, float y_, float r_, int n_) {
    this(x_, y_, r_, n_, null);
  }
  
  Orbit(float x_, float y_, float r_, int n_, Orbit p) {
    x = x_;
    y = y_;
    r = r_;
    parent = p;
    child = null;
    theta = -PI / 2;
    n = n_;
    speed = (radians(pow(k, n - 1)) / resolution);
  }
  
  void update() {
    if (parent != null) {
      theta += speed;
      float rsum = r + parent.r;
      x = parent.x + rsum * cos(theta);
      y = parent.y + rsum * sin(theta);
    }
  }
  
  void show() {
    stroke(255, 100);
    strokeWeight(1);
    noFill();
    ellipse(x, y, r * 2, r * 2);
  }
  
  Orbit addChild() {
    float newradius = r * 0.333;
    float newx = x + r + newradius;
    float newy = y;
    child = new Orbit(newx, newy, newradius, n + 1, this);
    return child;
  }
}