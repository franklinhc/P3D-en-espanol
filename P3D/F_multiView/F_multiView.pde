/*
 sktech mostrando una simulación de múltiples 'views' con objetos de formato .obj
 ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | diciembre 2022
 www.skizata.com
 */


PShape runabout;
PShape droneOblivion;
PShape moduloLunar;
float giroML, giroRun, giroDrone;

boolean moduloGirando = true;
boolean runaboutGirando = true;
boolean droneGirando = true;

void setup() {
  size(800, 800, P3D);
  runabout = loadShape("runabout.obj");
  droneOblivion = loadShape("droneOblivion.obj");
  moduloLunar = loadShape("moduloLunar.obj");
  giroRun = 0;
  giroDrone = 0;
  giroML = 0;
}

void draw() {
  camera(width/2, height/2, 3000,    width/2, height/2, 0,     0, 1, 0);
  background(0);
  
  // combinación entre dos luces puntuales y el modo lights de P3D
  lights();
  pointLight(100, 100, 100, 8*width, -height, width );
  pointLight(35, 35,35, -12*width, -height, width );

  // el runabout -------------------------
  pushMatrix();
  translate(1000,-800,0);
  rotateX(-0.4);
  rotateZ(PI);
  rotateY(giroRun);
  scale(1.5);
  shape(runabout);
  popMatrix();
  
  // el módulo lunar -------------------------
  pushMatrix();
  translate(-550,-800,0);
  //rotateX(-0.4);
  rotateX(-giroML/4);
  rotateZ(PI);
  rotateY(giroML);
  scale(0.15);
  shape(moduloLunar);
  popMatrix();
  
  // el drone -------------------------
  pushMatrix();
  translate(300,800,0);
  scale(0.25);
  rotateZ(PI);
  rotateY(giroDrone);
  shape(droneOblivion);
  popMatrix();
  
  if (droneGirando) giroDrone -= 0.01;
  if (runaboutGirando) giroRun += 0.01;
  if (moduloGirando) giroML += 0.01;

  // inicio de vista 2D
  camera();
  fill(200);
  text("runabout magallanes serial: " + random(100), 450, 230);
  text("nave nodriza NCC 1701",  450, 245);
  
  text("modulo lunar Eagle: " + random(100), 80, 230);
  text("nave nodriza APOLO 11 | 1968",  80, 245);
  
  text("pulse 'm' 'r' o 'd' para detener los giros",  20, 780);
}


void keyPressed() {
  if (key == 'm') { //
    moduloGirando = !moduloGirando;
  }
  if (key == 'r') { //
    runaboutGirando = !runaboutGirando;
  }
  if (key == 'd') { //
    droneGirando = !droneGirando;
  }
}
