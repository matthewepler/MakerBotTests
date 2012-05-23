import controlP5.*;
import processing.opengl.*;

// Marius Watz's "modelbuilder" library
import unlekker.util.*;
import unlekker.modelbuilder.*;
import ec.util.*;

ControlP5 controlP5;

UVertexList vl1, vl2, vl3;
UGeometry geo; // the shape to be printed
UNav3D nav;
float[] verts;
int numPoints = 36;
int spacing = 10;
int y1 = 50;
int y2 = 100;

void setup(){
 size(900,600,OPENGL);
 
 // sliders //
 controlP5 = new ControlP5(this);
 controlP5.addSlider("y1", // name, must match variable name
    10,100, // min and max values
    y1, // the default value
    20,20, // X,Y position of slider
    80,13) // width and height of slider
    .setId(0); // set controller ID
    
  controlP5.addSlider("y2", // name, must match variable name
    10,100, // min and max values
    y2, // the default value
    20,35, // X,Y position of slider
    80,13) // width and height of slider
    .setId(1); // set controller ID

   // add "bang" button to save STL
   controlP5.addBang("stlSave",
     20,100,13,13).
     setId(103);      
     
 verts = new float[numPoints];
 build();
 nav = new UNav3D(this);
 nav.set(width/2+100, height/2, 0);
}

void draw(){
 background(0);
 fill(255);
 lights();
 pushMatrix();
 nav.doTransforms(); 
 geo.draw(this);  
 popMatrix();
 //controlP5.draw();

}

void keyPressed(){
 if(key == 'u'){
  y1++;
  build();
 } 
 
  if(key == 'j'){
  y1--;
  build();
 } 
<<<<<<< HEAD
<<<<<<< HEAD
}

public void controlEvent(ControlEvent theEvent) {
  println("got a control event from controller with id "+theEvent.controller().id());
  switch(theEvent.controller().id()) {
    case(0): // y1
    y1 = (int)(theEvent.controller().value());
    break;
    case(1):  // y2
    y2 = (int)(theEvent.controller().value());
    break;  
  }
=======
>>>>>>> parent of 626bcf5... fixed random added geowrite everything working
=======
>>>>>>> parent of 626bcf5... fixed random added geowrite everything working
}

