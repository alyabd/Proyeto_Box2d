class pelota{
  float ancho;
  float alto;
  Body b;
  
  pelota(float x_,float y_){
 
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x_,y_));    
    b = box2d.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(6);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    //fd.density = 30;
    fd.friction = 0.01;
    fd.restitution = 0.5;
    
    b.createFixture(fd);
    
  }
  
  boolean limites(){
    Vec2 posicion = box2d.getBodyPixelCoord(b);
    if(posicion.y>height+max(10,10)){
      borrar();
      return false;
    }
    
    else{
      return true;
    }
  }
  
  /*boolean sinmovimiento(){
    Vec2 velocidad = b.getLinearVelocity();
    if (velocidad.x == 0 && velocidad.y == 0){
      borrar();
      return false;
    }
    
    else{
      return true;
    }
  }*/
   
  void fuerza(){
    b.setLinearVelocity(new Vec2 ((x1-x2)*.2,(y2-y1)*.2));
  }
  
  void vel(){
    Vec2 velocidad = b.getLinearVelocity();
    Vec2 punto = box2d.getBodyPixelCoord(b);
    if (velocidad.x == 0 && velocidad.y == 0){
      println("A verrrrrr...");      
      if(punto.x >= 211 && punto.x <= 458){
      puntos=puntos+5;
      }
      if(punto.x >= 459 && punto.x <= 586){
      puntos=puntos+10;
      }
      if(punto.x >= 587 && punto.x <= 642){
      puntos=puntos+20;
      }
    }
   }
   
  void borrar(){
    box2d.destroyBody(b);
  }
  
  
  void display(){
    Vec2 posicion = box2d.getBodyPixelCoord(b);
    //float angulo = b.getAngle();
    //println("Angulo:",angulo);
    //println(b.getLinearVelocity().toString());
    pushMatrix();
    translate(posicion.x,posicion.y);
    strokeWeight(2);
    ellipse(0,0,10,10);
    popMatrix();
  }
}
