// Example 3-2: mouseX and mouseY
import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

//initialsie the array
//you can imagine an array as a box full of items. 
//you want to be able to select a specific item at any one time.

int [] contents = {10,2,500,40,60,30}; //6 items in my array


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
}

void draw() {
  // Try moving background() to setup() and see the difference!
  background(0);

  // Body
  stroke(0);

  rectMode(CENTER);

  // int posX=arduino.analogRead(1) / 16;
  float posX= map(arduino.analogRead(1), 0, 1024, 0, width);

  float greyColour= map(posX, 0, width, 0, 255);
  fill(greyColour);
  rect(posX, 100, 50, 50);

  // mouseX is a keyword that the sketch replaces with the horizontal position of the mouse.
  // mouseY is a keyword that the sketch replaces with the vertical position of the mouse.
  // rect(posX, mouseY, 50, 50);



  //think of another variable you could alter with a slider/potentiometer? 
  //float index=map(arduino.analogRead(1), 0, 1024, 0, 10);
  //fill(255);
  //text(index, width/2, height/2);

  //what if I want to select a collection of items with a slider?
  float scroll=map(arduino.analogRead(5), 0, 1024, 0, 5);
  
  printArray(contents[int(scroll)]);
  fill(255);
  text(contents[int(scroll)], width/2, height/2);
}
