/*
 sktech mostrando el movimiento de la cámara
 ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | diciembre 2022
 www.skizata.com
 */

void setup() {
  size(800, 360, P3D);
  // para que la cámara empeize en el centro de la ventana
  mouseX = width/2;
  mouseY = height/2;
}


void draw() {
  background(0);
  // posicionamiento de la camara de acuerdo al movimiento del mouse
  camera(mouseX, mouseY, (height/2) / tan(PI/6),    width/2, height/2, 0,     0, 1, 0);
  
  // dibujando una caja para ver el movimientos
  translate(width/2, height/2, -100);
  stroke(255);
  strokeWeight(1);
  noFill();
  box(100);
  dibujeEjesCoordenados();
  
  // dibujando el círculo que sigue al mouse
  camera(); // apagando la visión 3D para dibujar de aquí en adelante en 2D
  fill(255);
  noStroke();
  ellipse(mouseX, mouseY, 5, 5);
}


// función para dibujar los ejes coordenados en sus respectivos colores estándar
void dibujeEjesCoordenados() {
  int largoDeEjes = 300; // que tan largo se quiere que se dibujen los ejes
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
