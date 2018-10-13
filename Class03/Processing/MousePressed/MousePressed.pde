void setup(){
size(500,500);

}

void draw(){
background(0);

rectMode(CENTER);
rect(width/2, height/2, 100,100);

if(mousePressed){ //use mousePress function as a button
fill(255,0,0); //if pressed make red
//see how when used in the draw loop it is momentary
//only red for as long as I press the mouse. 
}
else{
fill(255); //otherwise white 
}
}
