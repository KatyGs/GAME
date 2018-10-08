class Burbuja{

  Burbuja(){
  
  }
  
  void display(){
    background(255);
    dibuja();
    inst();
  }
  
  void inst(){
      for(int i = 42; i < 50; i ++){
           if(second() == i){
               textFont(inst);
               fill(255,195,67);
               textSize(20);
               textAlign(CENTER,CENTER);
               text("Haz click", width/2,45);
           }
         }
         
      if (mousePressed){
          tecnica = 3;
      }   
  }
  
  void dibuja(){
    pushMatrix();
    translate(mouseX,mouseY);
    beginShape();
    strokeWeight(4);
    stroke(160,255,222);
    fill(190,252,255,93);
    ellipseMode(CENTER);
    ellipse(mouseX, mouseY,300,300);
    endShape(CLOSE);
    popMatrix();
  }

}
