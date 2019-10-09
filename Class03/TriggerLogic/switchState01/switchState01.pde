/*
Super simple state changer
Push a, b or c to set state.
This can be used to trigger different media
*/

int state = 0; // initial state
int prevState = -1; // set initial prevState to something it can't possibly be so it will work first time

void setup() {
  size(400, 100);
  background(0);
}


void draw() {
  // fade whatever is on the canvas
  noStroke();
  fill(0, 8);
  rect(0, 0, width, height);
  // get key input
  if (keyPressed) {
    // the switch statement is a nicer and more concise version of
    // an list of if stataments such as:
    // if (key == 'a'){
    // do something
    // }else if (key == 'b'){
    // do something else... etc
    // check: https://processing.org/reference/switch.html
    switch(key) { // you can check integers and chars with switch
      case('a'):
      setState(1); // pass to our gneneric function
      break; // NOTE!!! every case() usually has break as last line
      case('b'):
      setState(2); // pass to our gneneric function
      break;
      case('c'):
      setState(3); // pass to our gneneric function
      break;
    }
  }
}
void keyReleased() {
  prevState = -1; // this just ensure we can push same key again and trigger
}

// this function is our generic state setter
// we pass the state we want to it in brackets
// setState(2);
void setState(int _state) {
  state = _state; // IMPORTANT! set state variable to be the value we pass to the function
  if (state != prevState) { // different to last state?
    prevState = state; // if so remember this state as prevState
    // ... and do whatever we want ONCE ie. trigger something like a video or sound
    fill(255); 
    textSize(50);
    textAlign(LEFT, CENTER);
    text("STATE IS: "+state, 20, height/2);
  }
}
