
void build(){
  vl1 = new UVertexList();
  vl2 = new UVertexList();
  vl3 = new UVertexList();
  
  for(int i=0; i<numPoints; i++){
   float r = random(150, 250);
   verts[i] = r;
   vl1.add(cos(radians(i*10))*r, sin(radians(i*10))*r, 0);
   vl2.add(cos(radians(i*10))*r, sin(radians(i*10))*r, 50);
   vl3.add(cos(radians(i*10))*r*0.75, sin(radians(i*10))*r*0.75, 100);
  }
  
  vl1.add(cos(radians(verts[0]*10))*verts[0], sin(radians(verts[0]*10))*verts[0], 0);
  vl2.add(cos(radians(verts[0]*10))*verts[0], sin(radians(verts[0]*10))*verts[0], 0);
   
  
  geo = new UGeometry();
  geo.quadStrip(vl1, vl2);
  //geo.quadStrip(vl2, vl3);
  
  //geo.triangleFan(vl1, false);
  //geo.triangleFan(vl3, true);
  
  //geo.writeSTL(this, "test.stl");
}