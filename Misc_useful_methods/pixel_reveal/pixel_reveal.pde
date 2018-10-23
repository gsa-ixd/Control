
PImage img;
PImage maskedImage;
PGraphics revealSquare;
int drawnw, drawnh;

void settings() {
  img = loadImage("0.jpg"); //load in the image
  size(img.width, img.height); //size of canvas to be image dimensions. 
}
void setup() {

  background(0);

  drawnw = width - img.width; 
  drawnh = height - img.height;
  revealSquare = createGraphics(img.width, img.height); //create a graphic with same dimensions as image. 
}

void draw() {
  //background(0);
  revealSquare.beginDraw();
  // Erase graphics with black background
  revealSquare.background(0);
  int w=mouseX - drawnw; //mouse movement minus drawn width
  int h=mouseY - drawnh;
  // Draw in white
  revealSquare.fill(255);
  revealSquare.noStroke();
  // A moving rect to see a part of the image
  revealSquare.rect(w, h, 100, 100);
  revealSquare.endDraw();

  maskedImage=img.get(); //get the original image
  maskedImage.mask(revealSquare); //mask with the movable square

  // Display the result
  image(maskedImage, drawnw, drawnh);
}
