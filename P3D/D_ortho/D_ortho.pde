/*
 sktech mostrando el uso de axonometrías en lugar de perspectivas
 ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | diciembre 2022
 www.skizata.com
 */

boolean enAxonometria = true;

void setup() {
  size(400, 400, P3D);
}

void draw() {
  background(64);
  lights();
  
  if (enAxonometria) {
    ortho();
  } else {
    float fov = PI/3.0;
    float cameraZ = (height/2.0) / tan(PI/6);
    perspective(fov, float(width)/float(height), cameraZ/2.0, cameraZ*2.0);
  }
  
  // para dibujar el cubo
  stroke(255);
  noFill();
  translate(width/2, height/2, 0);
  rotateX(-PI/6);
  rotateY(PI/3);
  box(160);
  
  // para el texto de las instrucciones
  camera();
  fill (255);
  text("use 'o' para axonometría y 'p' para perspectiva", 20, height-20 );
}


// zona de eventos
void keyPressed() {
  if (key == 'o') {
    enAxonometria = true;
  }
  if (key == 'p') {
    enAxonometria = false;
  }
}
