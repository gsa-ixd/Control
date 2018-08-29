

color off = color(24, 79, 111);
color on = color(184, 145, 158);

boolean triggered=false;


void setup() {
  size(470, 280);
}


void draw() {
  background(off);
  noStroke();
  rectMode(CENTER);


  // Draw a filled box when key is triggered
  if (triggered)
    fill(on);
  else
    fill(off);

  rect(width/2, height/2, 100, 100);
}

//keyPress and mousePress have their own functions so not called repeatedly in the draw loop
void keyPressed() {

  //this is set up to be a latching button! 
  //it changes colour when a key is pressed. 
  //it will only change back when the key is pressed again
  if (keyPressed) {
    triggered=!triggered; //state change
    //if keypressed set triggered , if pressed again set not triggered.
  }
}
