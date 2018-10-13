boolean triggered=false;

void setup(){
size(500,500);

}

void draw(){
background(0);

rectMode(CENTER);
rect(width/2, height/2, 100,100);

if(triggered){ //use mousePress function as a button
fill(255,0,0); //if pressed make red
//see how when used in the draw loop it is momentary
//only red for as long as I press the mouse. 

}
else{
fill(255); //otherwise white 
}
}

//we can use the function mousePressed rather than the variable 
//observe the logic difference. 
void mousePressed(){

triggered=!triggered;//every time mousePressed flip the logic of triggered 
//if it was flase make it true and vise versa. It stays in its last state until you click the mouse again

//this is just like the latching logic 

}
