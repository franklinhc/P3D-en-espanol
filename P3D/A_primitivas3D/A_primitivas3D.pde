/*
 demostración de las primitivas en P3D
 ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | diciembre 2022
 www.skizata.com
 */


void setup() {
  size(600, 600, P3D);
}

void draw() {
  background(64);
  lights();

  // el cubo
  pushMatrix();
  fill(255);
  translate(130, height/2, 0);
  rotateY(1.25);
  rotateX(-0.4);
  noStroke();
  box(100);
  popMatrix();

  // esfera en wire frames
  pushMatrix();
  translate(500, height*0.35, -200);
  noFill();
  stroke(128);
  strokeWeight(0.5);
  sphere(150);
  popMatrix();

 
  // piramide en wire frames
  pushMatrix();
  translate(width/2, height/2, 0);
  stroke(200);
  noFill();
  strokeWeight(1);
  
  // triángulo de adelante
  beginShape();
  vertex(-100, 100, 100);
  vertex( 100, 100, 100);
  vertex(   0, -100, 0);
  endShape(CLOSE);
  
  // triángulo de la derecha
  beginShape();
  vertex( 100, 100, -100);
  vertex( 100, 100, 100);
  vertex(   0, -100, 0);
  endShape(CLOSE);
  
  // triángulo a la izquierda
  beginShape();
  vertex( -100, 100, -100);
  vertex(-100, 100, 100);
  vertex(    0, -100, 0);
  endShape(CLOSE);
  
  // triángulo de atrás
  beginShape();
  vertex(-100, 100, -100);
  vertex(100, 100, -100);
  vertex(  0, -100, 0);
  endShape(CLOSE);
  
  // piso opaco
  fill (0);
  beginShape();
  vertex(-100, 100, 100); // izquierda adelante
  vertex(-100, 100, -100); // izquierda atrás
  vertex(100, 100, -100); // derecho atrás
  vertex(100, 100, 100); // derecho adelante
  endShape(CLOSE); 
  
  dibujeEjesCoordenados();
  popMatrix();
  
  // esfera roja
  pushMatrix();
  translate(width/2, height/2, 0);
  translate(-100, -100, -100);
  fill (255,0,0);
  noStroke();
  sphere(100);
  popMatrix();
  
} // end draw




void dibujeEjesCoordenados() {
  // ejes blancos
  int largoDeEjes = 300;
  // eje X rojo
  stroke(255, 0, 0);
  line(0, 0, 0, largoDeEjes, 0, 0);
  stroke(255, 0, 0, 128);
  line(-largoDeEjes, 0, 0, 0, 0, 0);

  // eje Y verde
  stroke(0, 255, 0);
  line(0, 0, 0, 0, largoDeEjes, 0);
  stroke(0, 255, 0, 128);
  line(0, -largoDeEjes, 0, 0, 0, 0);

  // eje Z azul
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, largoDeEjes);
  stroke(0, 0, 255, 128);
  line(0, 0, -largoDeEjes, 0, 0, 0);
}
