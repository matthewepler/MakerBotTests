import controlP5.*;
import processing.opengl.*;

// Marius Watz's "modelbuilder" library
import unlekker.util.*;
import unlekker.modelbuilder.*;
import ec.util.*;

UVertexList vl1, vl2, vl3;
UGeometry geo; // the shape to be printed
UNav3D nav;

float[] verts;
int numPoints = 36;
int spacing = 10;
int y1 = 50;
int y2 = 100;

Scrollbar height1;
Scrollbar height2;
PFont f;

void setup(){
 size(900,600,OPENGL); 
 verts = new float[numPoints];
  for(int i=0; i<numPoints; i++){
   float r = random(150, 250);
   verts[i] = r;
  }
 
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
 
 textSize(18);
 text("Control Bottom Height with 'u' & 'j'", 50, 100);
 text("Control Top Height with 'i' & 'k'", 50, 150);
 text("Save STL by pressing 's'",50, 200);
}

void keyPressed(){
 if(key == 'u'){
  y1 += 5;
  build();
 } 
 
  if(key == 'j'){
  y1 -= 5;
  build();
 } 
 
 if(key == 'i'){
  y2 += 5;
  build();
 } 
 
  if(key == 'k'){
  y2 -= 5;
  build();
 } 
 
  if(key == 's'){
   stlSave(); 
  }
}

void stlSave() {
  geo.writeSTL(this, 
    IO.getIncrementalFilename(
      this.getClass().getSimpleName()+
      "-####.stl",sketchPath));
}


