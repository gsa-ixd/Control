/*
This sketch interprets input from a Firmata Arduino to control sound output.
 The Arduino has 2 potentiometers (attached to analog input 0 and 1)
 These can obviously be anything you want. Just ensure you change the code.
 Make your sounds either WAV, AIFF, or MP3. 
 If WAV or AIFF, then best to make mono (ie. not stereo) and 44.1khz at 16bits (known as 'CD quality')
 */

import processing.sound.*;

SoundFile soundfile;  //our sound we will use
Delay delay; // this is the Delay we are creating to manage the processing of the sound
// Delay is 


void setup() {
  size(800, 240);
  background(255);
  //Load a soundfile
  soundfile = new SoundFile(this, "recapitulationMono.wav");
  // Play the file in a loop
  soundfile.loop();
  // create a Delay Effect
  delay = new Delay(this);
  // Set soundfile as input to the delay 
  delay.process(soundfile, 1, 1);

  //Set up serial input from Arduino
  setupSerial(3, 57600); // numbers in brackets (argument) are serial port number and speed respectively
}      


void draw() {
  background(0);
  // read serial
  float pot1 = arduino.analogRead(0); // get raw serial input from pot1 (0-1023)
  float pot2 = arduino.analogRead(1); // get raw serial input from pot2 (0-1023)
  float mPot1 = map(pot1, 0, 1023, 0.1, 1.0); // this is pot1 mapped from 0-1023 into 0.1-1.0
  float mPot2 = map(pot2, 0, 1023, 0.1, 5.0); // this is pot2 mapped from 0-1023 into 0.1-5.0
  delay.feedback(mPot1); // adjust the Delay feedback
  delay.time(mPot2); // adjust the Delay time
  // Show details
  textSize(40);
  textAlign(LEFT, CENTER);
  text("Delay Feedback: " + mPot1, 20, height/2);
  text("Delay Time: " + mPot2, 20, height/2 + 40);
}
