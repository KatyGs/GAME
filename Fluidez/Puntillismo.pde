class Punto{  
  // body es una clase de box2d, b es la representación de mi objeto en el mundo de box2D
  Body b;
  //Atributos
  float ancho;
  float alto;
  color c;
  
  //Metodos
  //Constructor
  Punto(float x_, float y_, float ancho_, float alto_, color c_){
    this.ancho = ancho_; 
    this.alto = alto_;
    this.c = c_;
  
    //definir mi body: su tipo y posición inicial
    BodyDef bodydef = new BodyDef();
    bodydef.type = BodyType.DYNAMIC;
    //coloco mi body pasando las coordenadas de pixeles a box2D
    bodydef.position = box2d.coordPixelsToWorld(x_,y_);
    
    // crear el body, tomo la definición y la paso como parametro a
    //la función createBody de mi objeto box2d, 
    b = box2d.createBody(bodydef);
    
    // definir la forma de mi body: sus límites
    PolygonShape polygonshape = new PolygonShape();
    //paso unidades de pixeles a la escala de box2D
    float anchoEnBox2d = box2d.scalarPixelsToWorld(ancho_/2);
    float altoEnBox2d = box2d.scalarPixelsToWorld(alto_/2);
    polygonshape.setAsBox(anchoEnBox2d,altoEnBox2d);
    
    // defino su fixture: sus propiedades materiales
    FixtureDef  fixturedef = new FixtureDef();
    //paso el polygonshape como atributo de mi fixture
    fixturedef.shape = polygonshape;
    fixturedef.density = 1;
    fixturedef.friction = 0.3;
    fixturedef.restitution = 0.5;
    
    //Paso mi fixturedef como parametro a la función createFixture de mi objeto;
    b.createFixture(fixturedef);
    
    //puedo darle una velocidad inicial a mi objeto
    b.setAngularVelocity(30);
    b.setLinearVelocity(new Vec2(10,10));
  }
  
  void eliminaElBody(){
    //esta función de box2D elimina el atributo body de mi objeto de Box2D;
    box2d.destroyBody(b);
  }
  
  boolean estaEnPantalla(){
    //esta función evalúa si el objeto está dentro de los límites de la pantalla
    Vec2 posicion = box2d.getBodyPixelCoord(b);
    if(posicion.y>height+max(ancho,alto)){
      eliminaElBody();
      return false;
    }
    else{
      return true;
    }
  }
  
  void applyForce(Vec2 v) {
    b.applyForce(v, b.getWorldCenter());
  }

  void display(){
    // pregunto al body su posición actual y la cambio a coordenadas en la ventana de processing
    Vec2 posicion = box2d.getBodyPixelCoord(this.b);
    // pregunto al body si ángulo de inclinación
    float angulo = b.getAngle();
    // a partir de esa información dibujo mi geometría pasando los parametros como 
    //transformaciones dentro de la matriz de transformación 
    pushMatrix();
    translate(posicion.x,posicion.y);
    rotate(-angulo);
    fill(this.c);
    noStroke();
    ellipseMode(CENTER);
    ellipse(0,0,ancho,alto);
    popMatrix();
  }
  
  
}
