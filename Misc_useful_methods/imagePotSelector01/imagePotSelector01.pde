int totalImages = 15; // total number of (appropriately-named) images in the data folder
PImage [] allImages; // declare our array variable to store all images!
int index = 0; // this variable is used to 'select' and display an image from the array

void setup() {
  size(512, 512, P2D); // Use P2D because we're drawing images
  setUpSerial(3, 57600); // our general Arduino set up
  loadAllImages(); // this function loads all (appropriately-named) images in the data folder
}

// All images in the data folder are square, but some are different in size
void loadAllImages() {
  allImages = new PImage[totalImages]; // IMPORTANT!!! tell the array variable how many elements we want to populate it with
  // Populate the array with images!
  for (int i = 0; i < allImages.length; i++) { // .length is a property of an array meaning 'how many elements does it have?'
    allImages[i] = loadImage(i+".jpg"); // all images must be in sequence and named 0.jpg, 1.jpg, 2.jpg, etc.
    allImages[i].resize(512, 512); // resize them all to same size if necessary
  }
}

void draw() {
  background(255);
  getSerialInput(); // get any Arduino input from potentiometer
  //getMouseInput();
  imageMode(CENTER);
  image(allImages[index], width/2, height/2); // draw selected image in middle of canvas
  textSize(50);
  text(index, 10, 50); // show what image we are using from the array (ie. index)
}

// for testing without Arduino
void getMouseInput(){
  index = int(map(mouseX, 0, width, 0, 15));
}
