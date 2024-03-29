
void build(){
  vl1 = new UVertexList();
  vl2 = new UVertexList();
  vl3 = new UVertexList();
  
  for(int i=0; i<numPoints; i++){
   vl1.add(cos(radians(i*spacing))*verts[i], sin(radians(i*spacing))*verts[i],y1);
   vl2.add(cos(radians(i*spacing))*verts[i], sin(radians(i*spacing))*verts[i], y2);
   vl3.add(cos(radians(i*spacing))*verts[i]*0.75, sin(radians(i*spacing))*verts[i]*0.75, y3);
  }
  
  vl1.add(cos(radians(0))*verts[0], sin(radians(0))*verts[0], y1);
  vl2.add(cos(radians(0))*verts[0], sin(radians(0))*verts[0], y2);
  vl3.add(cos(radians(0))*verts[0]*0.75, sin(radians(0))*verts[0]*0.75, y3); 
  
  geo = new UGeometry();
  geo.quadStrip(vl1, vl2);
  geo.quadStrip(vl2, vl3);
  
  geo.triangleFan(vl1, false);
  geo.triangleFan(vl3, true);
  
  //geo.writeSTL(this, "test.stl");
}
