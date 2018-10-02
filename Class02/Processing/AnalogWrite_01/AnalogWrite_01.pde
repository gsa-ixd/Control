/*
Example by jen Sykes
Built from the arduino inputs Example in Processing
Reads one analog value and animates a rectangle with it. 

*/
import processing.serial.*;

import cc.arduino.*;

Arduino arduino;


void setup() {
  size(480, 270);

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
  // Try moving background() to setup() and see the difference!
  background(255);

  // Body
  stroke(0);
  fill(175);
  rectMode(CENTER);

  int posX=arduino.analogRead(1) / 16;
  //float posX= map(arduino.analogRead(1), 0, 1024, 0, width);


  rect(posX, 100, 50, 50);

  // mouseX is a keyword that the sketch replaces with the horizontal position of the mouse.
  // mouseY is a keyword that the sketch replaces with the vertical position of the mouse.
  // rect(posX, mouseY, 50, 50);
}
