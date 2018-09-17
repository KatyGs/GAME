class End{
  PFont fuente, ganador;

  End(){
    ganador= createFont("JUNGE.ttf",22);
  }
  
  void Final(){
    crown();
    win();
    
    if (Heroe == 1){
      crown();
      win();
      fill(255);
      textFont(ganador);
      textAlign(CENTER,CENTER);
      text("Press BACKSPACE to return",width/2,500);
      text("PLAYER #1",width/2,500);
    }
    else if (Heroe == 2){
      crown();
      win();
      fill(255);
      textFont(ganador);
      textAlign(CENTER,CENTER);
      text("Press BACKSPACE to return",width/2,500);
      text("PLAYER #2",width/2,500);
    }
    
    if (key == BACKSPACE){
            screen = 0;
            Player1selec = false;
            Player2selec = false;
            P1lifepoints= 100;
            P2lifepoints= 100;
            hp1 = P1lifepoints;
            hp2 = P2lifepoints;
            turno = 0;
          }
  }
  
  void crown(){
  background(44,53,53);
  stroke(249,166,2);
  noFill();
  triangle(292,99,310.83,177,242.26,177);
  triangle(242.26,177,250.66,163.81,207.31,125.07);
  triangle(341.79,177,334.11,165.91,375.07,125.07);
  strokeWeight(2);
  ellipse(186,106,14.6,14.6);
  ellipse(397,105,14.6,14.6);
  strokeWeight(1);
  fill(53,61,61);
  triangle(292,99.7,310.83,177,341.79,177);
  triangle(250.66,163.81,207.31,125.07,257.6,152.91);
  triangle(334.11,165.91,323.37,148.94,375.07,125.07);
  strokeWeight(2);
  ellipse(292,67.82,14.6,14.6);
  }
  
  void win(){
    fuente= createFont("Aubrey.ttf",72);
    textFont(fuente);
    fill(255);
    textSize(67);
    textAlign(CENTER, CENTER);
    text("WINNER!", width/2,400);
  }

}
