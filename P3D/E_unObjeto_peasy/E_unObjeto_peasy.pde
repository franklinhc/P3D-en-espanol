/*
 sktech mostrando la carga de un modelo 3D de formato .obj
 además del uso básico de la biblioteca PeasyCam para manejar la cámara
 ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | diciembre 2022
 www.skizata.com
 */


import peasy.PeasyCam;

PeasyCam camara;
PShape runabout;
float anguloDeRotacionY; // angulo de rotación en eje Y
  
void setup() {
  size(600, 600, P3D);
  camara = new PeasyCam(this, 500); //inicialización de la cámara a 500px en '+z'
  
  // carga del modelo 3D
  // el archivo .obj debe estar acompañado de su correspondiente archivo .mtl
  // para que sea despelgado con los 'materiales' del caso
  runabout = loadShape("runabout2.obj"); 
}

void draw() {
  background(0);
  lights();
  rotateZ(PI);
  rotateY(anguloDeRotacionY);
  scale(0.5);
  shape(runabout);
  
  anguloDeRotacionY += 0.01; 
  
  // para el texto de las instrucciones
  camara.beginHUD(); // anulación de la PseayCam para poner instrucciones de frente
  fill (200);
  textSize(14);
  text("use el mmouse para cambiar la perspectiva", 20, height-30 );
  text("doble click para volver la cámara a su posición original", 20, height-12 );
  camara.endHUD(); // fin de la anulación de la PseayCam
}
