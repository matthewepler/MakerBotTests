// // instance of the controlP5 library
//
//void initGUI() {
//  nav=new UNav3D(this);
//  nav.trans.set(width/2+100, height/2, 0);
//  
////  fnt=createFont("Arial",18);
//  
//  controlP5 = new ControlP5(this);;//  controlP5.addSlider("y1", // name, must match variable name
//    10,100, // min and max values
//    y1, // the default value
//    20,20, // X,Y position of slider
//    80,13) // width and height of slider
//    .setId(0); // set controller ID
//    
//  controlP5.addSlider("y2", // name, must match variable name
//    10,100, // min and max values
//    y2, // the default value
//    20,35, // X,Y position of slider
//    80,13) // width and height of slider
//    .setId(1); // set controller ID
//
//
//   // add "bang" button to save STL
//   controlP5.addBang("stlSave",
//     20,100,13,13).
//     setId(103);      
//}
//
//void stlSave() {
//  geo.writeSTL(this, 
//    IO.getIncrementalFilename(
//      this.getClass().getSimpleName()+
//      "-####.stl",sketchPath));
//}
//
//// catch events so we can trigger a rebuild of model
//void controlEvent(ControlEvent theEvent) {
//  controlP5.Controller c=theEvent.controller();
//  int cid=c.id();
////  println("\n"+theEvent.isController()+" "+
////    c.id()+" "+c.label()+" "+c.value()+" type == "+theEvent.type());
//
//  //if(cid<100) doRebuild=true;
//}
