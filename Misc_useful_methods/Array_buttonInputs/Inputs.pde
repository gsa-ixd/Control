int [] buttonPins= {3,4,5,6,7} ;
int numPins=5;
int [] buttonStates= new int[5];
boolean triggered=false;
int state=0;


void setupSerial(int _port, int _speed) { 
  // Prints out the available serial ports.
  printArray(Arduino.list());

  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this, Arduino.list()[_port], _speed);

  // Set the Arduino digital pins as inputs.
  for (int i = 0; i <= 13; i++)
    arduino.pinMode(i, Arduino.INPUT_PULLUP);
}

void readInputs(){
  
for(int i =0; i<numPins;i++){
  buttonStates[i]=arduino.digitalRead(buttonPins[i]); //read from all pins in buttonPin array

if(buttonStates[i]==1){ //has a button been triggered. 
triggered=true; //might not need this but here incase want to add latchinhg logic 
state=1;
println("on");
}
else{
triggered=false;
state=0;
println("off");
}

}
}
