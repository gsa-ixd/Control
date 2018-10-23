PImage [] imgs; //set up array of images
int index=1; //variable used to increment 

void setup() {
  //fullScreen();
  size(1000, 800);

  imgs = new PImage [5];
  for (int i=0; i<imgs.length; i++) {
    imgs [i] = loadImage(i+".jpg");  // Load the images into the program
  }
}

void draw() {
  background(0);
  image(imgs[index-1], 0, 0, width, height); //draw the nth image in the array with corresponding index number. index is 1 =1st image in the array. use index-1 to make number image and index match
  if(index>5){ //if index variable is over 5 reset it to zero. Stop array out of bounds errors. 
  index=1;
  }
}

void keyPressed() {

  switch(key) { //if number keys pressed set index variable to corresponding number. 

  case '1':
  index=1;
    break;

  case '2':
  index=2;
    break;

  case '3':
  index=3;
    break;

  case '4':
  index=4;
    break;

  case '5':
  index=5;
    break;
  }
}
