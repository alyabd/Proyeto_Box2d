int P=1,puntos,i;
//Variables de tiempo
int inicio,tiempo,limite=10000;
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

float x1=67,y1=220,x2,y2;
PImage pantalla1,pantalla2,pantalla3,pantalla4,botonoff,botonon;

Box2DProcessing box2d;
ArrayList muros;
ArrayList <pelota> pelotas;

void setup(){
  size(711,400);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  pelotas = new ArrayList <pelota>();
  muros = new ArrayList();
  muros.add(new muro(243+154,227,490,10,0));
  muros.add(new muro(644,175,10,200,-9.42));
  pantalla1 = loadImage("Pantalla1.png");
  pantalla2 = loadImage("Pantalla Instrucciones.png");
  pantalla3 = loadImage("Pantalla2.png");
  pantalla4 = loadImage("Pantalla Final.png");
  botonoff = loadImage("Boton Off.png");
  botonon = loadImage("Boton On.png");
}

void draw(){
  background(255);
  println(pelotas.size());
  box2d.step();
  println(puntos);
  //println("Puntos: ",puntos);
  //println(mouseX,mouseY);
  
  if(P==1){
    p1(); 
  }
   
  if(P==2){
     p2();
   }
   
   if(P==3){
    p3();
    if (pelotas.size()==6){
      println("Ya Párale Morr@ >:v");
      P=4;
    }
   }
   
   if(P==4){
     p4();
   }
}

void p1(){
  image(pantalla1,0,0);
  scale(0.5);
  image(botonoff,525,400);
  if (mouseX>=310 && mouseX<=400 && mouseY>=210 && mouseY<=296){
    image(botonon,525,400);
    if(mousePressed){
      P=2;
    }
  }
}

void p2(){
  image(pantalla2,0,0);
  if(keyPressed){
    if(key==' '){
      P=3;
    }
  }
}

void p3(){
  image(pantalla3,0,0);
  box2d.step();
  strokeWeight(3);
  //println("Posición Final",x2,y2);
  ellipse(x1,y1,2,2);
  if(mousePressed){
  line(x1,y1,mouseX,mouseY);
  }
  
  for (pelota p: pelotas){
    p.display();
    p.vel();
    }
    
    //p.sinmovimiento();
    //p.limites();
  }

void p4(){
  image(pantalla4,0,0);
  if(keyPressed){
    if(key=='a'){
      //pelotas.remove(i);
      
      P=1;
    }
  }
}
  
  void mouseReleased(){
    x2=mouseX;
    y2=mouseY;
    pelota p = new pelota(x1,y1);
    pelotas.add(p);
    p.fuerza();
  
}
