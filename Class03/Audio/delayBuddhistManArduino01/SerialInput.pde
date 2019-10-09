import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

void setupSerial(int _index, int _portNum) {
  printArray(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[_index], _portNum);
}
