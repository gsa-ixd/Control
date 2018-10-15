/*
This demonstrates the use of PGraphics contexts to draw independent scenes
and combine them together using keyboard input (1-4)
It can easily be adapted to be driven by Arduino button inputs
or mapped variable inputs from potentiometers
*/

// Declare our 3 different PGraphics 'contexts'
PGraphics p1, p2, p3;
int state = 1; // this is our state variable to switch between scenes

void setup() {
  size(800, 600, P2D);
  background(0);
  p1 = createGraphics(width, height, P2D); // You can create contexts of any size
  p2 = createGraphics(width, height, P2D); // I just happen to be making them same as width and heigh of main canvas
  p3 = createGraphics(width, height, P3D); // Notice this createGraphics has a P3D renderer because it is 3D; the previous 2 are using P2D, the same as the size() function
}


void draw() {
  background(0);
  // this switch statement manages what context (PGraphics) is shown on the canvas
  // based on the value of the state variable
  switch(state) {
  case 1:
    blendMode(BLEND);
    drawP1();
    break;
  case 2:
    blendMode(BLEND);
    drawP2();
    break;
  case 3:
    blendMode(BLEND);
    drawP3();
    break;
  case 4:
    blendMode(ADD); // NOTE use of blendMode(ADD) to easily allow all sketches to become 'see through' 
    drawP1();
    drawP2();
    drawP3();
    break;
  }
}

// this event handler function sets the state variable 
// depending on which key is pressed
void keyPressed() {
  switch(key) {
  case '1':
    state = 1;
    break;
  case '2':
    state = 2;
    break;
  case '3':
    state = 3;
    break;
  case '4':
    state = 4;
    break;
  }
}

// Note in all the routines below, we start and end drawing with beginDraw() and endDraw()
// Also each routine finishes by putting the PGraphics on the canvas using the image() function

// Draw random circles
void drawP1() {
  p1.beginDraw();
  p1.noStroke();
  p1.fill(0, 0, 0, 8);
  p1.rect(0, 0, width, height);
  p1.fill(255, 0, 0);
  p1.ellipse(random(width), random(height), 100, 100);
  p1.endDraw();
  image(p1, 0, 0);
}

// Draw random coloured lines
void drawP2() {
  p2.beginDraw();
  p2.noStroke();
  p2.fill(0, 0, 0, 8);
  p2.rect(0, 0, width, height);
  p2.colorMode(HSB);
  p2.stroke(frameCount%255, 255, 255); 
  p2.strokeCap(SQUARE);
  p2.strokeWeight(5);
  p2.line(random(width), random(height), random(width), random(height));
  p2.endDraw();
  image(p2, 0, 0);
}

// Draw a wireframe cube
void drawP3() {
  p3.beginDraw();
  p3.background(0, 0);
  p3.colorMode(HSB);
  p3.noFill();
  p3.stroke(255);
  p3.strokeWeight(5);
  p3.translate(width/2, height/2, 0);
  p3.rotateX(frameCount*0.01);
  p3.rotateY(frameCount*0.02);
  p3.rotateZ(frameCount*0.005);
  p3.box(300, 300, 300);
  p3.endDraw();
  image(p3, 0, 0);
}
