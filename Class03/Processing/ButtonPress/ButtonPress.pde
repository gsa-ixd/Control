/*
Example by jen Sykes
Built from the arduino inputs Example in Processing
Reads one digital input and animates a rectangle with it. 

*/

import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

color off = color(24, 79, 111);
color on = color(184, 145, 158);

void setup() {
  size(470, 280);

  // Prints out the available serial ports.
  printArray(Arduino.list());

  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this, Arduino.list()[3], 57600);

  // Alternatively, use the name of the serial port corresponding to your
  // Arduino (in double-quotes), as in the following line.
  //arduino = new Arduino(this, "/dev/tty.usbmodem621", 57600);

  // Set the Arduino digital pins as inputs.
  for (int i = 0; i <= 13; i++)
    arduino.pinMode(i, Arduino.INPUT);
}


void draw() {
  background(off);
  noStroke();
  rectMode(CENTER);

  //this is set up to be a momentary button! 
  //it only changes colour when pressed. 
  //the moment it releases it changes back

  // Draw a filled box for digital pin 5 that's HIGH (5 volts).

  if ((arduino.digitalRead(5) == Arduino.HIGH)) {
    fill(on);
  }
   else {
    fill(off);
  }
  rect(width/2, height/2, 100, 100);
}
