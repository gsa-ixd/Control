/*
This sketch illustrates simple triggering logic using keypresses
*/


char lastKey; // keys are char data which means they are a single character eg. 'a' (note single quotes)


void setup() {
  size(400, 400); // Not a visual experience! Look in the Console for output
}

void draw() { // loops endlessly 60 times a second
  if (keyPressed) { // is a key pressed?
    if (key != lastKey) { // PART 1 OF TRIGGER CODE: has the last key been pushed already? If not pushed then go in side this next code block    
      // (next line is an example of a typical trigger example eg a video)
      println("YOU PUSHED: "+key+" SO TRIGGER VIDEO "+key+" TO START PLAYING!");
      lastKey = key; // VERY IMPORTANT!! This is where the programme remembers what key was last pushed
    }
  }
}

void keyReleased() {
  lastKey = '|'; // when user releases a key make the lastKey a key which is very inlikely to be hit eg '|'
}
