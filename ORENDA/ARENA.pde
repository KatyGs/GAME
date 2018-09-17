class Arena{
  
  Arena(){
  }
  
  void display(){
      frameRate(2);
      fondo(); 
      Player1.elegir();
      Player2.elegir();
      Batalla();
      //barras de vida
      rect(70,34,hp1,21);
      rect(490,34,hp2,21);
  }
  
  void fondo (){
   background(56);
   fill(204,46,21);
   stroke(130,188,188);
   strokeWeight(3);
   ellipse(213.5,118.5,38,38);
   fill(102,55,29);
   stroke(255);
   strokeWeight(1);
   beginShape();
   vertex(252.5,218.5);
   vertex(310.17,124.5);
   vertex(350.12,185.29);
   vertex(327.54,225.23);
   vertex(322.33,216.55);
   vertex(313.64,230.44);
   vertex(292.8,213.07);
   vertex(278.15,227.84);
   vertex(267.5,214.5);
   endShape(CLOSE);
   fill(119,65,42);
   beginShape();
   vertex(358.8,169.66);
   vertex(374.43,193.97);
   vertex(353.59,223.49);
   vertex(336.9,233.69);
   vertex(327.54,225.23);
   endShape(CLOSE);
   fill(137,72,52);
   beginShape();
   vertex(292.8,213.07);
   vertex(313.5,228.5);
   vertex(296.28,251.28);
   vertex(277.5,227.5);
   endShape(CLOSE);
   fill(132,88,70);
   beginShape();
   vertex(322.33,216.55);
   vertex(336.22,233.91);
   vertex(322.33,242.6);
   vertex(310.17,272.12);
   vertex(295.91,251.28);
   endShape(CLOSE);
   triangle(235.49,204.39,252.5,218.5,228.54,225.23);
   noStroke();
   fill(42);
   beginShape();
   vertex(87,272);
   vertex(132,330);
   vertex(189,315);
   vertex(239,323);
   vertex(296,313);
   vertex(362,316);
   vertex(411,306);
   vertex(456,325);
   vertex(489,331);
   vertex(529,272);
   endShape(CLOSE);
   stroke(45,133,160);
   fill(191,211,216);
   triangle(87,272,133.02,207.86,150.39,272);
   triangle(311.04,272,221.5,272,267.5,214.5);
   triangle(311.04,272,322.33,242.6,384.85,272);
   triangle(384.85,272,384.85,239.12,419.59,235.65);
   triangle(419.59,235.65,438.5,272,456.06,242.6);
   triangle(456.06,242.6,419.59,235.65,436.95,220.02);
   triangle(456.06,242.6,436.95,220.02,478.63,180.08);
   triangle(456.06,242.6,438.5,272,482.11,272);
   triangle(456.06,242.6,482.11,272,522.05,246.07);
   triangle(482.11,272,522.05,246.07,529,272);
   triangle(374.43,193.97,403.95,223.49,384.85,239.12);
   fill(172,198,204);
   triangle(133.02,207.86,150.39,272,199.02,232.18);
   triangle(150.39,272,199.02,232.18,221.5,272);
   triangle(353.59,223.49,384.85,239.12,384.85,272);
   triangle(384.85,239.12,403.95,223.49,419.59,235.65);
   triangle(478.63,180.08,456.06,242.6,490.79,226.97);
   triangle(456.06,242.6,490.79,226.97,522.05,246.07);
   fill(206.218,221);
   triangle(133.02,207.86,188.6,166.18,199.02,232.18);
   triangle(322.33,242.6,353.59,223.49,384.85,272);
   triangle(384.85,272,419.59,235.65,438.5,272);
   triangle(449.11,148.81,436.95,220.02,478.63,180.08);
   fill(247,224,213);
   triangle(188.6,166.18,199.02,232.18,228.54,225.23);
   triangle(199.02,232.18,228.54,225.23,221.5,272);
   triangle(374.43,193.97,353.59,223.49,384.85,239.12);
   triangle(403.95,223.49,436.95,220.02,419.59,235.65);
   fill(234,207,197);
   triangle(267.5,214.5,228.54,225.23,221.5,270.5);
   triangle(449.11,148.81,436.95,220.02,403.95,223.49);
  }

    void Batalla(){
      frameRate(2);
        switch (turno){
          case 1:
          keyPressed(); 
          if (key == 'a'|| key == 'A'){
              P1lifepoints -= Player2.poder;
              hp2 = P2lifepoints;
              turno = 1;
          }
          break;
          
          case 2:
              keyPressed();
              if(key == 's' || key == 'S'){
                  P2lifepoints -= Player1.poder;
                  hp1 = P1lifepoints;
                  turno = 1;
              }
          break;
          
          case 3:
              keyPressed();
              if (key == 'k' || key == 'K'){
                P1lifepoints += Player1.HP;
                hp1 =P1lifepoints;
                turno = 2;
              }
          break;
          
          case 4:
              keyPressed();
              if ( key == 'l' || key == 'L'){
                 P2lifepoints += Player2.HP;
                 hp2 = P2lifepoints ;
                 turno = 2;
              }
          break;
        }
        
        
       if (P1lifepoints <= 0){
          screen = 3;
          Heroe = 2;
       }
       
       if (P2lifepoints <= 0){
           screen = 3;
           Heroe = 1;
       }
       
       if (hp1 <= 0 || hp2 <= 0){
           screen =3;
       }
       
    }

}
