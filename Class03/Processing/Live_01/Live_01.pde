boolean triggered =false;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  rectMode(CENTER);

  if (triggered) {
    fill(255, 0, 0);
  } else {
    fill(255);
  }
  rect(width/2, height/2, 100, 100);
}

void keyPressed() {

  triggered=!triggered;//flip flop
}
