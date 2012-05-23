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

void setup(){
 size(600,600,OPENGL);
 verts = new float[numPoints];
 build();
 nav = new UNav3D(this);
 nav.set(width/2, height/2, 0);
}

void draw(){
 background(0);
 fill(255);
 lights();
 
 nav.doTransforms(); // 
 geo.draw(this);     
}
