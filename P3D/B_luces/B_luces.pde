/*
 demostración de los tipos de luces en P3D
 ph.d. franklin hernández-castro | tec costa rica | HfG gmuend | diciembre 2022
 www.skizata.com
 */

int caso=0;
String tipoDeLuzActual = "ninguna";


void setup() {
  size(600, 600, P3D);
  textSize(16);
}


void draw() {
  background(0);
  translate(width/2, height/2, 0);

  switch(caso) {
  case 0:
    break;

  case 1:
    lights();
    break;

  case 2:
    ambientLight(200, 255, 200);
    break;

  case 3:
    directionalLight(255, 255, 100, 1, 1, 0.5);
    break;

  case 4:
    spotLight(255, 0, 0, 100, -200, 200, -0.5, 1, -1, PI, 1);
    break;

  case 5:
    lights();
    spotLight(255, 0, 0, 100, -200, 200, -0.5, 1, -1, PI, 1);
    break;
  } // fin del switch

  // la esfera
  pushMatrix();
  noStroke();
  fill(255, 0, 0);
  translate(-width/4, 0, 0);
  sphere(75);
  popMatrix();

  // el cubo
  pushMatrix();
  noStroke();
  fill(255);
  translate(width/4, 0, 0);
  rotateX(-0.25);
  rotateY(0.55);
  box(100);
  popMatrix();
}




void keyPressed() {
  if (key == '0') { //
    caso=0;
    tipoDeLuzActual = "ninguna";
  }

  if (key == '1') { //
    caso=1;
    tipoDeLuzActual = "lights";
  }

  if (key == '2') { //
    caso=2;
    tipoDeLuzActual = "ambientLight";
  }

  if (key == '3') { //
    caso=3;
    tipoDeLuzActual = "directionalLight";
  }

  if (key == '4') { //
    caso=4;
    tipoDeLuzActual = "spotLight";
  }
  
  if (key == '5') { //
    caso=5;
    tipoDeLuzActual = "lights + spotLight";
  }
  
  println ("tipo de luz ahora:  " + tipoDeLuzActual);
} // fin del keyPressed()
