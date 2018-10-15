/*
Simple example to show video triggerring from keyboad input
Push a, b or c to trigger 3 different movies
Push same key to reset same video to start
Can easily be adapted for Arduino input
*/
import processing.video.*; // needs Processing video library included

Movie [] movies; // create an array of Movie objects to store our 3 movies inside

int state = 0; // initial state
int prevState = -1; // set to anything initially which is not state 

void setup() {
  size(1000, 800, P2D); // using P2D renderer here as video best played using acceleration
  movies = new Movie[3];  // declaring how many videos we want to load
  for (int i = 0; i < 3; i++) { // looping through the empty array
    movies[i] = new Movie(this, i+".mp4"); // populating each 'slot' with a movie named '0.mp4', '1.mp4', '2.mp4'
  }
  movies[state].loop(); // set 1 of the movies to loop (all others are stopped)
}


void draw() {
  // poll keyboard for input and set state accordingly
  if (keyPressed) {
    switch(key) {
      case('a'):
      setState(0);
      break;
      case('b'):
      setState(1);
      break;
      case('c'):
      setState(2);
      break;
    }
  }
  // IMPORTANT!! see if whatever movie we are playing from the array is ready to display another frame
  if (movies[state].available()) {
    movies[state].read(); // if so, read it
  }
  // display the frame from the movie to fill the canvas
  image(movies[state], 0, 0, width, height); 
}

void keyReleased(){
  prevState = -1; // handles restarting the same movie
}

void setState(int _state) {
  state = _state; // set state variable to _state argument we sent it from switch statement
  if (state != prevState) { // not same as previous?
    prevState = state; // first, set state = _state 
    println("STATE IS: "+state);
    // STOP/PAUSE ALL MOVIES IN THE ARRAY
    for (Movie m : movies) {
      m.stop(); // could also be m.pause() for a different behaviour
    }
    // set the one we have selected to loop
    movies[state].loop();
  }
}
