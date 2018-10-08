//importar las librerías
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList<Suelo> s;
ArrayList <Punto> puntos;
Attractor a;
Burbuja bubble;

PImage pop;
PFont inst;

int tecnica;

void setup(){
  size(600,650);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-60);
  
  inst = createFont("Raleway-Regular-20.vlw",18);
  
  a = new Attractor(2,width/2,height/2);
  bubble = new Burbuja();
  puntos = new ArrayList<Punto>();
  s = new ArrayList<Suelo>();
  s.add(new Suelo(139,height-2,280,2));
  s.add(new Suelo(400,height-2,500,2));
  
  pop = loadImage("MMpopart.png");
  
  //Dibuja la imagen de inicio como puntillismo
    for (int i = 0; i <pop.width; i+=18){
      for (int j = 0; j <pop.height; j+=18){
        //almaceno el color del pixel i,j
        int c = pop.get(i,j);    
        fill(c);
        puntos.add(new Punto(i,j,18,18,c));
      }
    }
  
}

void draw(){
  
  switch(tecnica){
    case 0:
      background(255);
      primerg();
    break;
    case 1:
     background(255);
     Atrae();
    break;
    case 2:
     background(255);
     bubble.display();
    break;
    case 3:
     dropping();
    break;
   } 
  
  
  
  //mi objeto principal
   for(Punto p: puntos){
     p.display();
     //pongo la condición aquí ya que quiero que la fuerza de atracción se aplique 
     //a estos cuerpos en concreto
     if(key == 'a' || key == 'A'){
           for (int i = 0; i < width ; i++) {
            // Look, this is just like what we had before!
            Vec2 force = a.attract(p);
            p.applyForce(force);
           }
        }
        
   }
     
   //Empezando a aplicar la fisica en la imagen, 1ro la gravedad
   if (key == 'g' || key == 'G'){
     //Llamo esta función de box2d dentro de está condición 
     //para que la gravedad no se aplique desde un principio
       box2d.step();
       //aparece el limite para la caída de los puntos
       for (Suelo floor: s) {
          floor.display();
      }
   }
    
    
}
