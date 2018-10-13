import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

int [] contents={10, 2, 60, 70, 120, 300}; //6 numbers in the array
String [] words={"hello", "goodbye", "yes", "no", "maybe", "finale"}; //6 words

void setup() {
  size(470, 280);

  // Prints out the available serial ports.
  printArray(Arduino.list());
  
  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this, Arduino.list()[1], 57600);
  
}

void draw(){
  
background(255);
rectMode(CENTER); //centered on screen
noStroke(); 
float col=map(arduino.analogRead(0),0,1024,0,255);
fill(col); //greyscale square

//test the movement with the mouse
//float posX=map(mouseX,0,width,0,200);
float posX=map(arduino.analogRead(0),0,1024,0,width);

rect(posX,height/2,50,50);

float input=arduino.analogRead(0);
fill(0);
textSize(24);
text(nf(input),10,50); //print the slider value to the screen
int y=80;

strokeWeight(1);
stroke(0);
float scroll=map(arduino.analogRead(0),0,1024,0,5);
for(int x=10; x<=150*scroll; x+=20){
line(x,y,x,y+20);
}

for(int i=0;i<6;i++){ //print out the contents of the array
printArray(contents[i]);
}

text(words[int(scroll)],200,50);
}
