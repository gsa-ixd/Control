import cc.arduino.*;
import org.firmata.*;
import processing.serial.*;

Arduino arduino;

// Generic function to set up connection to Arduino
// Expects 2 arguments: port number (int), and port speed (int)
// You will only know port number by running at lease once and using the printArray(Arduino.list()) function
// to see which port contains the Arduino. Speed is normally 57600
void setUpSerial(int _port, int _speed) {
  printArray(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[_port], _speed);
  for (int i = 0; i <= 13; i++) {
    arduino.pinMode(i, Arduino.INPUT_PULLUP); // IMPORTANT! This is why the live version wouldn't work; now INPUT_PULLUP instead of just INPUT
  }
}


// Generic function to check for all input from the Arduino
// inputs are mapped to be within expected ranges eg. 0-1023 from potentionmeters mapped into 0-1 for amplitude
// or 0-2 for rate (pitch) of sample playback. The mapped values are put into global variables which we can use to control sound playback
void getSerialInput() {
  // POT 1 CHECK
  bgVolume = map(arduino.analogRead(0), 0, 1023, 0, 1);
  // POT 2 CHECK
  effectPitch = map(arduino.analogRead(5), 0, 1023, 0, 2);
  // BUTTON CHECK
  buttonState = arduino.digitalRead(2); // NOTE!!! 2 is arbitrary. Should map to whatever digital input you are using on your Arduino
  if (buttonState == 1) { // IMPORTANT!!! This is now 1 instead of 0 in class, as we are now using the INPUT_PULLUP workaround in the setUpSerial() function
    if (buttonState != lastButtonState) { // this line and next manage problem of nasty constant trigerring
      lastButtonState = buttonState;
      soundEffect.play(effectPitch); // play the sound effect at a specific pitch!
      println("on");
    }
  } else {
    println("off");
    lastButtonState = -1; // ensures we can push the button again and again
  }
}
