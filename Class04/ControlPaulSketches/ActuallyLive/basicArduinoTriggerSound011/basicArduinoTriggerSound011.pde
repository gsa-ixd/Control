/*
This sketch interprets input from a Firmata Arduino to control sound output.
 The Arduino has 2 potentiometers (attached to analog input 0 and 1),
 and a single button attached to digital input 2.
 These can obviously be anything you want. Just ensure you change the code.
 Make your sounds either WAV, AIFF, or MP3. 
 If WAV or AIFF, then best to make mono (ie. not stereo) and 44.1khz at 16bits (known as 'CD quality')
 */

import processing.sound.*;

SoundFile backgroundSound, soundEffect; // we are using 2 sounds; a background looping sound, and a single hit short sound

float bgVolume = 0.5;
float effectPitch = 1.0;
int buttonState = 1;
int lastButtonState = -1; // this is set to something it couldn't possibly be for input so the logic works in the getSerialInput() function

void setup() {
  size(400, 400);
  background(0);
  // load up all sounds
  backgroundSound = new SoundFile(this, "recapitulationMono.wav");
  backgroundSound.loop();
  soundEffect = new SoundFile(this, "synth.wav");
  // set up the Arduino communication on specific port at specific speed
  setUpSerial(3, 57600);
}


void draw() { 
  background(0);
  getSerialInput();
  backgroundSound.amp(bgVolume);
  textSize(18);
  text("Background loop sound: "+bgVolume, 20, 50);
  text("Effect pitch: "+effectPitch, 20, 100);
}
