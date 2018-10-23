

void setup() {

  size(500, 500);
}
//changes intensity of green square depending on how close it is to red square

void draw() {
  background(0);
  noStroke();
  float size=150;
  float posX=width/2;
  float posY =height/2;
  float d = dist(posX, posY, mouseX, mouseY); //dist between position of 
 
  //if dist is closer then change fill of moving rectangle
  float col = map(d, 1.0, 250, 0, 255); //map into colour range

  rectMode(CENTER);
  fill(255, 0, 0);
  rect(posX, posY, size, size);//draw in center of screen

  fill(0, col, 0);//movable green square
  rect(mouseX, mouseY, size, size);
  println(d); //see distance away from red square
}
