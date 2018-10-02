/*
Example by jen Sykes
Built from the arduino inputs Example in Processing
Reads one digital input and animates a rectangle with it. 
Demonstrates how to use code logic to create a latching button effect.
Boolean code method refeneced from Paul Maguire's latching code 2017
*/
import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

color off = color(24, 79, 111);
color on = color(184, 145, 158);
String s = "button pressed";
boolean buttonLit=false;
int lastButtonState =0;

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

  int buttonState= arduino.digitalRead(5); //buttonState is the message received via the Arduino button
  background(64);


  if (buttonState == 1) { //if buttonState is 'high' or '1'
    if (buttonState!=lastButtonState) { //has it changed since the last time?
    lastButtonState = buttonState; // REMEMEBER IT HAS BEEN PUSHED !!!! forget this line and it will not behave 
      if (!buttonLit) {

        buttonLit=true; //make buttonLit to be true
        println("on");
      } else {
        println("off");
        buttonLit=false; //otherwise make it false(turn it off)
      }
    }
  } else {

    lastButtonState=buttonState; //update the buttonState on the next loop through draw. 
    //without this update and the subsequent check at the beginning of the loop it will still behave like a moemntary button
    //unable to sustain its action.
  }


//visualise the triggered action
//latch / unlatch   
if (buttonLit) {
  s="pressed";
  fill(255, 0, 0, 255);//full opacity
} 

if (!buttonLit) {
  fill(255, 0, 0, 128); //half opacity
  s="not pressed";
}

ellipse(width/2, height/2, 200, 200);
textSize(32);
text(s, width/2-60, 100);
}
