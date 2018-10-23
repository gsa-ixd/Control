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
// inputs are mapped to be within expected ranges eg. 0-1023 from potentionmeters mapped into the integer range of 0-15 
// The mapped values are put into the global variable 'index' which we can use to control image selection from the array
void getSerialInput() {
  // POT 1 CHECK
  index = int(map(arduino.analogRead(0), 0, 1023, 0, 14));
}
