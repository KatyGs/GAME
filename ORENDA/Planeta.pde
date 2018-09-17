class Planeta {
  // icosahedron
  PFont font;
  PFont inst;
  float x, y, z;
  float radius;
  float vertexRadius;
  boolean showFaces;
  int currentColor;
  PVector topPoint;
  PVector[] topPent = new PVector[5];
  PVector bottomPoint;
  PVector[] bottomPent = new PVector[5];
  float angle = 0;
  float triDist;
  float triHt;
  float a, b, c;
  float r;

  // constructor
  Planeta(float radius, float vertexRadius, boolean showFaces){
    this.radius = radius*3;
    this.vertexRadius = vertexRadius;
    this.showFaces = showFaces;
    init();
  }

  Planeta(float radius, float vertexRadius){
    this.radius = radius*3;
    this.vertexRadius = vertexRadius;
    this.showFaces = true;
    init();
  }

  Planeta(float radius){
    this.radius = radius*3;
    this.vertexRadius = 0;
    this.showFaces = true;
    init();
  }
  void escrito(){
    font= createFont("CINZEL.ttf",72);
    textFont(font);
    fill(225);
    textAlign(CENTER, CENTER);
    text("ORENDA", width/2, height/5);
    inst= createFont("Gafata.ttf",16);
    textFont(inst);
    fill(230);
    textAlign(CENTER, CENTER);
    text("press ENTER to start", width/2, 400);
    textSize(14);
    text("INSTRUCCIONES", 50, 460);
    text("Ataques:", 50, 480);
    text("-El Jugador1 (P1) ataca con 'a' & 's", 127, 500);
    text("-Para el jugador2 (P2) con 'k' & 'l'", 127, 520);
  }
//Recopilacion de todo lo que aparecera en pantalla
    void pantalla(){
      frameRate (40);
      background(18);
      escrito();
      pushMatrix();
      lights();
      strokeWeight(3.5);
      stroke(249,166,2);
      fill(249,166,2,150);
      translate(width/2,height/2,0);
      rotateX(r);
      rotateY(r);
      create();
      popMatrix();
      //para rotar en su propio eje
      r= r + 0.02;
      if (key  == ENTER){
        screen = 1;
      }
    } 
  
  
  // calculate geometry
  void init(){
    c = dist(cos(0)*radius, sin(0)*radius, cos(radians(72))*radius,  sin(radians(72))*radius);
    b = radius;
    a = (float)(Math.sqrt(((c*c)-(b*b))));

    triHt = (float)(Math.sqrt((c*c)-((c/2)*(c/2))));

    for (int i=0; i<topPent.length; i++){
      topPent[i] = new PVector(cos(angle)*radius, sin(angle)*radius, triHt/2.0f);
      angle+=radians(72);
    }
    topPoint = new PVector(0, 0, triHt/2.0f+a);
    angle = 72.0f/2.0f;
    for (int i=0; i<topPent.length; i++){
      bottomPent[i] = new PVector(cos(angle)*radius, sin(angle)*radius, -triHt/2.0f);
      angle+=radians(72);
    }
    bottomPoint = new PVector(0, 0, -(triHt/2.0f+a));
  }

  // draws icosahedron 
  void create(){
    // vertexes
    if(vertexRadius > 0){
      for(int i=0;i<5;i++){
        vertexSphere(topPent[i].x,topPent[i].y,topPent[i].z,vertexRadius);
        vertexSphere(bottomPent[i].x,bottomPent[i].y,bottomPent[i].z,vertexRadius);
      }
      vertexSphere(topPoint.x,topPoint.y,topPoint.z,vertexRadius);
      vertexSphere(bottomPoint.x,bottomPoint.y,bottomPoint.z,vertexRadius);
    }
    
    if(!showFaces){
      currentColor = g.fillColor;
      fill(0,0,0,0);
    }
    for (int i=0; i<topPent.length; i++){
      // icosahedron top
      beginShape();
      if (i<topPent.length-1){
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+topPoint.x, y+topPoint.y, z+topPoint.z);
        vertex(x+topPent[i+1].x, y+topPent[i+1].y, z+topPent[i+1].z);
      } 
      else {
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+topPoint.x, y+topPoint.y, z+topPoint.z);
        vertex(x+topPent[0].x, y+topPent[0].y, z+topPent[0].z);
      }
      endShape(CLOSE);

      // icosahedron bottom
      beginShape();
      if (i<bottomPent.length-1){
        vertex(x+bottomPent[i].x, y+bottomPent[i].y, z+bottomPent[i].z);
        vertex(x+bottomPoint.x, y+bottomPoint.y, z+bottomPoint.z);
        vertex(x+bottomPent[i+1].x, y+bottomPent[i+1].y, z+bottomPent[i+1].z);
      } 
      else {
        vertex(x+bottomPent[i].x, y+bottomPent[i].y, z+bottomPent[i].z);
        vertex(x+bottomPoint.x, y+bottomPoint.y, z+bottomPoint.z);
        vertex(x+bottomPent[0].x, y+bottomPent[0].y, z+bottomPent[0].z);
      }
      endShape(CLOSE);
    }

    // icosahedron body
    for (int i=0; i<topPent.length; i++){
      if (i<topPent.length-2){
        beginShape();
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+bottomPent[i+1].x, y+bottomPent[i+1].y, z+bottomPent[i+1].z);
        vertex(x+bottomPent[i+2].x, y+bottomPent[i+2].y, z+bottomPent[i+2].z);
        endShape(CLOSE);

        beginShape();
        vertex(x+bottomPent[i+2].x, y+bottomPent[i+2].y, z+bottomPent[i+2].z);
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+topPent[i+1].x, y+topPent[i+1].y, z+topPent[i+1].z);
        endShape(CLOSE);
      } 
      else if (i==topPent.length-2){
        beginShape();
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+bottomPent[i+1].x, y+bottomPent[i+1].y, z+bottomPent[i+1].z);
        vertex(x+bottomPent[0].x, y+bottomPent[0].y, z+bottomPent[0].z);
        endShape(CLOSE);

        beginShape();
        vertex(x+bottomPent[0].x, y+bottomPent[0].y, z+bottomPent[0].z);
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+topPent[i+1].x, y+topPent[i+1].y, z+topPent[i+1].z);
        endShape(CLOSE);
      }
      else if (i==topPent.length-1){
        beginShape();
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+bottomPent[0].x, y+bottomPent[0].y, z+bottomPent[0].z);
        vertex(x+bottomPent[1].x, y+bottomPent[1].y, z+bottomPent[1].z);
        endShape(CLOSE);

        beginShape();
        vertex(x+bottomPent[1].x, y+bottomPent[1].y, z+bottomPent[1].z);
        vertex(x+topPent[i].x, y+topPent[i].y, z+topPent[i].z);
        vertex(x+topPent[0].x, y+topPent[0].y, z+topPent[0].z);
        endShape(CLOSE);
      }
    }
    if(!showFaces){
      fill(currentColor);
    }

  }

  void vertexSphere(float x, float y, float z, float r) {
    pushMatrix();
    translate(x,y,z);
    sphere(r);
    popMatrix();
  }
}
