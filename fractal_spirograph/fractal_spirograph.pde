float theta = -PI/2;
ArrayList<PVector> path;
Orbit orbit;
Orbit end;
int resolution = 4;

void setup() {
  size(600, 600);
  path = new ArrayList<PVector>();
  orbit = new Orbit(300, 300, 150, 0);
  
  Orbit next = orbit;
  for(int i = 0; i < 22; i++) {
    next = next.addChild();
  }
  end = next;
}

void draw() {
  background(51);

  Orbit current = orbit;
  while (current != null) {
    current.update();
    current.show();
    current = current.child;
  }
  
  //end = current;
  path.add(new PVector(end.x, end.y));
  
  beginShape();
  for (PVector pos : path) {
    stroke(255, 0, 255);
    vertex(pos.x, pos.y);
  }
  endShape();
}