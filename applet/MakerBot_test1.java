import processing.core.*; 

import processing.opengl.*; 
import controlP5.*; 
import processing.opengl.*; 
import unlekker.util.*; 
import unlekker.modelbuilder.*; 
import ec.util.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class MakerBot_test1 extends PApplet {

 


// Marius Watz's "modelbuilder" library




UVertexList vl1, vl2, vl3;
UGeometry geo; // the shape to be printed
UNav3D nav;

float[] verts;
int numPoints = 36;
int spacing = 10;
int y1 = 0;
int y2 = 50;
int y3 = 100;

Scrollbar height1;
Scrollbar height2;
PFont f;

public void setup(){
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

public void draw(){
 background(0);
 fill(255);
 lights();
 pushMatrix();
 nav.doTransforms(); 
 geo.draw(this);
 popMatrix();
 
 textSize(22);
 text("Control Keys", 50, 25);
 textSize(18);
 text("Bottom Height: u / j", 50, 100);
 text("Middle Height: i / k", 50, 150);
 text("Top Height: o / l", 50, 200);
 text("Save STL: s",50, 300);
}

public void keyPressed(){
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
 
 if(key == 'o'){
  y3 += 5;
  build();
 } 
 
  if(key == 'l'){
  y3 -= 5;
  build();
 } 
 
  if(key == 's'){
   stlSave(); 
  }
}

public void stlSave() {
  geo.writeSTL(this, 
    IO.getIncrementalFilename(
      this.getClass().getSimpleName()+
      "-####.stl",sketchPath));
}


class Scrollbar{
  
  int x,y;
  float sw,sh;
  float pos;
  float posMin, posMax;
  boolean rollover;
  boolean locked;
  float minVal, maxVal;
  
  Scrollbar (int xp, int yp, int w, int h, float miv, float mav) {
    x = xp;
    y = yp;
    sw = w;
    sh = h;
    minVal = miv;
    maxVal = mav;
    pos = x + sw/2 - sh/2;
    posMin = x;
    posMax = x + sw - sh;
  }
  
  public void update(int mx, int my){ 
    if(over(mx,my) == true) {
      rollover = true;
    } else {
      rollover = false;
    }
    if (locked == true) {
      pos = constrain(mx-sh/2, posMin, posMax);
    }
  }
  
  public void press(int mx, int my) {
    if (rollover == true) {
      locked = true;
    } else {
      locked = false;
    }
  }
  
  public void release() {
    locked = false;
  }
  
  public boolean over(int mx, int my) {
    if((mx > x) && (mx < x+sw) && (my > y) && (my < y+sh)){
      return true;
    } else {
      return false;
    }
  }
  
  public void display() {
    fill(255);
    rect(x,y,sw,sh);
    if ((rollover == true) || (locked == true)){
      fill(0);
    } else {
      fill(102);
    }
    rect(pos, y, sh, sh);
  }
  
  public float getPos() {
    float scalar = sw/(sw-sh);
    float ration = (pos - x) + scalar;
    float offset = minVal + (ration/sw * (maxVal-minVal));
    return offset;
  }
}

public void build(){
  vl1 = new UVertexList();
  vl2 = new UVertexList();
  vl3 = new UVertexList();
  
  for(int i=0; i<numPoints; i++){
   vl1.add(cos(radians(i*spacing))*verts[i], sin(radians(i*spacing))*verts[i],y1);
   vl2.add(cos(radians(i*spacing))*verts[i], sin(radians(i*spacing))*verts[i], y2);
   vl3.add(cos(radians(i*spacing))*verts[i]*0.75f, sin(radians(i*spacing))*verts[i]*0.75f, y3);
  }
  
  vl1.add(cos(radians(0))*verts[0], sin(radians(0))*verts[0], 0);
  vl2.add(cos(radians(0))*verts[0], sin(radians(0))*verts[0], 50);
  vl3.add(cos(radians(0))*verts[0]*0.75f, sin(radians(0))*verts[0]*0.75f, 100); 
  
  geo = new UGeometry();
  geo.quadStrip(vl1, vl2);
  geo.quadStrip(vl2, vl3);
  
  geo.triangleFan(vl1, false);
  geo.triangleFan(vl3, true);
  
  //geo.writeSTL(this, "test.stl");
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "MakerBot_test1" });
  }
}
