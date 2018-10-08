//Pasos, instrucciones, metodos...
    void primerg(){
         textFont(inst);
         fill(151,110,178);
         textSize(20);
         textAlign(CENTER,CENTER);
         text("Press 'G'", width/2,height-35);
        if(key == 'g' || key == 'G'){
          tecnica = 1;
        }
    }
    
    //Este método sirve para saber cuando quiero que ocurra la atracción 
    //hacia un punto fijo
     void Atrae(){
       //uso second para un mejor rendimiento a la hora de correr el código
        for(int i = 42; i < 50; i ++){
           if(second() == i){
               textFont(inst);
               fill(255,167,169);
               textSize(20);
               textAlign(CENTER,CENTER);
               text("Press 'A'", width/2,45);
           }
         }
         
         if (second() == 59){
               textFont(inst);
               fill(255,167,169);
               textSize(20);
               textAlign(CENTER,CENTER);
               text("Press 'B'", width/2,45);
         }
         
         box2d.step();
         //punto de atracción
         a.display(); 
         
         if (key == 'b' || key == 'B'){
           for (int i = puntos.size()-1; i >= 0; i--) {
              Punto b = puntos.get(i);
              if (b.estaEnPantalla()) {
                puntos.remove(i);
              }
            }
           tecnica = 2;
         }
     }
     
     
     void dropping(){
       background(255);
       box2d.step(); 
         if (mousePressed) {
            Punto p = new Punto(mouseX,mouseY,10,10,98);
            puntos.add(p);
            textFont(inst);
            fill(255,195,67);
            textSize(20);
            textAlign(CENTER,CENTER);
            text("press A", width/2,45);
          }
     }
