import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

color off = color(24, 79, 111);
color on = color(184, 145, 158);
String s = "button pressed";
boolean buttonLit=false;
int lastButtonState =0;

int [] contents = {10, 2, 500, 40, 60, 30}; //6 items in my array
String [] words={"hello", "goodbye", "dog", "cat", "sunny", "snowy"};
int count=0;

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

      //count up
      count+=1; //try moving this to different parts of the code and see how the behaviour changes. 

      if (!buttonLit) { //if it isn't already triggered. 

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
  //what if we want to utilise this button press for a more complex action? 
  //lets go back to our contents box array and try select an item with a button press. 

  //latch / unlatch   
  if (buttonLit) {

    s="pressed";
    println("on");
    fill(255, 0, 0, 255);//full opacity
  } 

  if (!buttonLit) {
    fill(255, 0, 0, 128); //half opacity
    s="not pressed";
    println("off");
  }

  //reset  count if above array length
  if (count>5) {
    //alternate way of writing it 
    //if(count==words.length())
    println("in here");
    count=0;
  }
  
  
  println(count);
  ellipse(width/2, height/2, 200, 200);
  textSize(32);
  text(s, width/2-60, 100);
  fill(255);
  text(words[count], width/2, height-100);
}
