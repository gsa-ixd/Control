import processing.serial.*;

import cc.arduino.*;

Arduino arduino;
boolean triggered=false;

void setup() {
  size(470, 280);

  // Prints out the available serial ports.
  printArray(Arduino.list());

  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this, Arduino.list()[0], 57600);

  // Set the Arduino digital pins as inputs.
  for (int i = 0; i <= 13; i++)
    arduino.pinMode(i, Arduino.INPUT_PULLUP);
}

void draw() {
  background(0);
    //use digitalRead  to control switch like actions. 
  //firstly how does it behave  with keyPress as a prototyping method?
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
