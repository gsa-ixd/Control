/*
Example by jen Sykes
Demonstrates a momentary button effect with a keyPress
Refencing the keyPress example 
https://processing.org/reference/keyPressed_.html
*/

color off = color(24, 79, 111);
color on = color(184, 145, 158);

void setup() {
  size(470, 280);
}


void draw() {
  background(off);
  noStroke();
  rectMode(CENTER);
  //this is set up to be a momentary button! 
  //it only changes colour when a key is pressed. 
  //the moment it releases it changes back

  // Draw a filled box for each digital pin that's HIGH (5 volts).
  if (keyPressed)
    fill(on);
  else
    fill(off);

  rect(width/2, height/2, 100, 100);
}
