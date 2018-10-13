import processing.serial.*;

import cc.arduino.*;

Arduino arduino;
int lastButtonState=0;
boolean triggered=false;
int count=0;

void setup() {
  size(470, 280);

  // Prints out the available serial ports.
  printArray(Arduino.list());

  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this, Arduino.list()[1], 57600);

  // Set the Arduino digital pins as inputs.
  for (int i = 0; i <= 13; i++)
    arduino.pinMode(i, Arduino.INPUT_PULLUP); //force the pins to be UP/HIGH/ON code workaround so no resistor needed in circuit
}


void draw() {
  background(0);
  rectMode(CENTER);
  rect(width/2, height/2, 100, 100);

  int buttonState=arduino.digitalRead(2);
  //is the button pressed??
  if (buttonState==0) { //needs to be LOW/OFF/0 if using input_pullup
    if (buttonState!=lastButtonState) {//if it has changed.
      lastButtonState=buttonState; //reconfirm our buttonState. without this line behaviour will be glitchy!!!!
      if (!triggered) {
        triggered=true;
        println("ON");
      } else {
        triggered=false;
        println("OFF");
      }//don't fogrget extra curly bracket to close triggered condition
    }
  } else {
    lastButtonState=buttonState; //update lastButtonState to be buttonState
  }



  //this is where we add behavioural changes to our outputs.
  if (triggered) {
    fill(0, 255, 0);
    count++;
  }

  if (!triggered) {
    fill(255, 0, 0);
  }
  
  textSize(32);
  text(nf(count),50,50);
  
  float opacity=map(count,0,1000,255,0);
  fill(opacity);
  ellipse(350,height/2,100,100);
  
  if(count>1000){ //if count is greater than 1000
  count=0; //reset count 
  }
}
