class muro{
  float x;
  float y;
  float w;
  float h;
  Body b;
  
  muro(float x_,float y_, float w_, float h_, float a){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    
    PolygonShape sd = new PolygonShape();
    float anchoAjustado = box2d.scalarPixelsToWorld(w/2);
    float altoAjustado = box2d.scalarPixelsToWorld(h/2);
    
    sd.setAsBox(anchoAjustado,altoAjustado);
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.angle = a;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);
    
    b.createFixture(sd,1);
  }
  void display() {
    noFill();
    stroke(0);
    strokeWeight(1);
    rectMode(CENTER);
    float a = b.getAngle();
    pushMatrix();
    translate(x,y);
    rotate(-a);
    rect(0,0,w,h);
    popMatrix();
  }
}
