Planeta ico;
Characterselec selec;
Arena arena;
End end;

Characters Wolf1;
Characters Fox1;
Characters Bear1;
Characters Owl1;
Characters Deer1;
Characters Wolf2;
Characters Fox2;
Characters Bear2;
Characters Owl2;
Characters Deer2;

Characters Player1;
Characters Player2;

int choose;
int screen;
boolean Player1selec = false;
boolean Player2selec = false;
int Heroe;
int turno;
int P1lifepoints;
int P2lifepoints;
int HP = 200;
int hp1 = 200;
int hp2 = 200;

void setup(){
  size(600, 550, P3D);
  smooth(2);
  frameRate (4);
  ico = new Planeta(30,0,true);
  hint(DISABLE_DEPTH_TEST);
  selec = new Characterselec();
  Wolf1 = new Characters(10,10,1);
  Fox1 = new Characters(10,10,2);
  Bear1 = new Characters(10,10,3);
  Owl1 = new Characters(10,10,4);
  Deer1 = new Characters(10,10,5);
  Wolf2 = new Characters(10,10,6);
  Fox2 = new Characters(10,10,7);
  Bear2 = new Characters(10,10,8);
  Owl2 = new Characters(10,10,9);
  Deer2 = new Characters(10,10,10);
  arena= new Arena();
  end= new End();
  
}

void draw(){

  switch(screen){
    case 0:
      ico.pantalla();
    break;
    case 1:
     selec.pantallados();
    break;
    case 2:
      arena.display();
    break;
    case 3:
      end.Final();
     break;
   }
   
}
