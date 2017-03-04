float theta = -PI/2;
ArrayList<PVector> path;
Orbit orbit;
Orbit end;
int resolution = 60;
boolean circle_inside = false;

void setup() {
  size(600, 600);
  path = new ArrayList<PVector>();
  orbit = new Orbit(300, 300, 150, 0);
  
  Orbit next = orbit;
  for(int i = 0; i < 16; i++) {
    next = next.addChild();
  }
  end = next;
}

void draw() {
  background(51);

  // loop for resolution
  for (int i = 0; i < resolution; i++) {
    Orbit current = orbit;
    while (current != null) {
      current.update();
      current.show();
      current = current.child;
    }
    path.add(new PVector(end.x, end.y));
  }
  
  beginShape();
  for (PVector pos : path) {
    strokeWeight(2);
    stroke(1, 152, 117);
    noFill();
    vertex(pos.x, pos.y);
  }
  endShape();
}