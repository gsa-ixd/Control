import cc.arduino.*;
import org.firmata.*;

Arduino arduino;

int previousState= -1;

void setup() {
  size(800, 800);
  setupSerial(3, 57600);
}

void draw() {
  readInputs();
  background(0);

  //could increment an index on button press? 
  switch(state) {
  case 1:
    //on action here
    //....
    println("state" +state);
    if (previousState!=state) {//stop repeated triggers. 
      previousState=state;
    }
    break;

  case 0:
    //off action here
    //....
    println("state" +state);
    if (previousState!=state) {//stop repeated triggers. 
      previousState=state;
    }
    break;
  }
}
