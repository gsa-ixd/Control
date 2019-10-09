import processing.serial.*;

import cc.arduino.*;

Arduino arduino;
PImage img01, img02;

void setup() {
  size(470, 280);

  // Prints out the available serial ports.
  printArray(Arduino.list());

  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this, Arduino.list()[3], 57600);

  // Set the Arduino digital pins as inputs.
  for (int i = 0; i <= 13; i++)
    arduino.pinMode(i, Arduino.INPUT_PULLUP);


//load your images
  img01=loadImage("0.jpg");
  img02=loadImage("1.jpg");
}

void draw() {
  background(0);
  fill(255);
  //use analogRead to control the size of an ellipse. 
  //could we use map to make the scale of the ellipse clearer?
  ellipse(width/2, height/2, arduino.analogRead(0) / 16, arduino.analogRead(0) / 16);

  //see the information from the slider/dial
  fill(255);
  textSize(24);
  text(nf(arduino.analogRead(0)), 10, 50); //print the slider value to the screen

  //can we convert a mouse action to a dial interaction?
  float fade=map(mouseX, 0, width, 0, 255); 
  tint(255, 255); //full opacity 
  image(img01, 0, 0);
  tint(255, fade);
  image(img02, 0, 0);
}
