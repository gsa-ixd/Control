import processing.serial.*;

import cc.arduino.*;

Arduino arduino;
boolean  triggered=false;
int buttonState = 1;
int lastButtonState = -1; // this is set to something it couldn't possibly be for input so the logic works in the getSerialInput() function

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
    arduino.pinMode(i, Arduino.INPUT_PULLUP);//remember PULL_UP
}

void draw() {
  background(0);

  //use digitalRead  to control switch like actions. 
  //firstly how does it behave  with keyPress as a prototyping method?
  rectMode(CENTER);
  //how might we approach this if its a physical button?

  // BUTTON CHECK
  buttonState = arduino.digitalRead(2); // NOTE!!! 2 is arbitrary. Should map to whatever digital input you are using on your Arduino
  if (buttonState == 1) { // IMPORTANT!!! This is now 1 instead of 0 in class, as we are now using the INPUT_PULLUP workaround in the setUpSerial() function
    if (buttonState != lastButtonState) { // this line and next manage problem of nasty constant trigerring
      lastButtonState = buttonState;
      fill(255, 0, 0);
      println("on");
    }
  } else {
    fill(255);
    println("off");
    lastButtonState = -1; // ensures we can push the button again and again
  }
  println("buttonState: ", buttonState);

  rect(width/2, height/2, 100, 100);
}

/*
void keyPressed() {
 
 triggered=!triggered;//flip flop
 }
 */
