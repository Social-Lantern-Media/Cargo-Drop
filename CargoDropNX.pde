//A Social Lantern Media Creation 2014
//sociallantern.weebly.com

// flight controller
ArrayList<Unit> units = new ArrayList<Unit>();
ArrayList<PVector> zones = new ArrayList<PVector>();
ArrayList<PVector> obst = new ArrayList<PVector>();
 
boolean flag= false;
boolean noarrows = false;
boolean obstacles = true;
boolean infinite = false;
boolean death = false;

PImage mapwater; 
PImage instructions; 
PImage crash; 
PImage beacon; 
PImage cash; 
 
//boats 
PImage black1;
PImage blue3;
PImage brown4; 
PImage green5; 
PImage pink6; 
PImage purple7; 
PImage red2; 
PImage yellow8;

//helicopters

PImage blackc;
PImage bluec;
PImage brownc;
PImage greenc;
PImage pinkc;
PImage purplec;
PImage redc;
PImage yellowc;
PImage bronze;
PImage silver;
PImage gold; 
 
 
 
PVector mpos = new PVector();
int gameState = 4;

int timer = 2361;  
int max = 101;
int left = max;
int life = 0;
 
int score = 0 ;
int highscore = 1 ; 

 
// init
void setup() {
   
  size(800,600);
   orientation(LANDSCAPE);
  smooth();
   
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(20);
  ellipseMode(CENTER);
  
  
  mapwater = loadImage("mapwater.png"); 
  instructions = loadImage("title-instructions.png"); 
  crash = loadImage("crash.png");  
  beacon = loadImage("beacon.png"); 
  cash = loadImage("cash.png");
  
  
blackc = loadImage("Helicopters/blackc.png"); ;
bluec = loadImage("Helicopters/bluec.png"); ;
brownc = loadImage("Helicopters/brownc.png"); ;
greenc = loadImage("Helicopters/greenc.png"); ;
pinkc = loadImage("Helicopters/pinkc.png"); ;
purplec = loadImage("Helicopters/purplec.png"); ;
redc = loadImage("Helicopters/redc.png"); ;
yellowc = loadImage("Helicopters/yellowc.png"); ;

black1 = loadImage("Boats/black1.png"); ;
red2 = loadImage("Boats/red2.png"); ;
blue3 = loadImage("Boats/blue3.png"); ;
brown4 = loadImage("Boats/brown4.png"); ; 
green5 = loadImage("Boats/green5.png"); ; 
pink6 = loadImage("Boats/pink6.png"); ; 
purple7 = loadImage("Boats/purple7.png"); ; 
yellow8 = loadImage("Boats/yellow8.png"); ;


bronze = loadImage("Medals/bronze.png");
silver = loadImage("Medals/silver.png");
gold = loadImage("Medals/gold.png"); 

  
   sss();
  background(0);
  
}
 
 
// update
void draw() {
   
   
  // mouse pos
  mpos.x = mouseX;
  mpos.y = mouseY;
   
  if (gameState == 4) {
    image(mapwater,0,0); 
     image(instructions,150,-5);  
  } 
  else if(gameState == 0) {
      image(mapwater,0,0);
      
       
    if(!infinite && units.size() == 0) gameState = 2;
     
     //site facing
    float f = 7.0;
     timer = timer -=1; 
    // zones
    rectMode(CENTER);
    for(PVector z : zones) {
      pushStyle();
     // rectMode(CENTER);
      noStroke(); 
      
      color c = color(255,0,0,0);
      if(z.z == 2) c = color(255,0,0,0);
      if(z.z == 3) c = color(255,0,0,0);
      if(z.z == 4) c = color(255,0,0,0);
      if(z.z == 5) c = color(255,0,0,0);
      if(z.z == 6) c = color(255,0,0,0);
      if(z.z == 7) c = color(255,0,0,0);
      if(z.z == 8) c = color(255,0,0,0);
       fill(c);
      
      //landing sites
      //rect(z.x,z.y,30,30);
      
      if(!noarrows) {
        if(z.z == 1) {
          image(black1,z.x,z.y); 
          rect(z.x+125,z.y+30, 70,50); 
          
        }
        if(z.z == 2) {
          image(red2,z.x,z.y);
          rect(z.x+20,z.y+40, 40,30); 
          
        }
        if(z.z == 3) {
          image(blue3,z.x,z.y);
          rect(z.x+123,z.y+40, 55,30); 
          
        }
        if(z.z == 4) {
          image(brown4,z.x,z.y);
          rect(z.x+172,z.y+35, 50,30); 
          
        }
        if(z.z == 5) {
          image(green5,z.x,z.y);
          rect(z.x+45,z.y+37, 45,30); 
          
        }
        if(z.z == 6) {
          image(pink6,z.x,z.y);
          rect(z.x+30,z.y+35, 55,30); 
          
        }
        if(z.z == 7) {
          image(purple7,z.x,z.y);
          rect(z.x+132,z.y+40, 50,50); 
         
        }
        if(z.z == 8) {
          image(yellow8,z.x,z.y);
          rect(z.x+20,z.y+35, 40,30); 
          
        }
        
        popStyle();
      }
    }
     
    // units
    for( int i = units.size()-1; i >= 0; i--) {
      Unit u = units.get(i);
      u.update();
      u.draw();
      // delete
      for(PVector z : zones) {
        if(u.pos.dist(new PVector(z.x,z.y)) < 50 && int(z.z)==u.type) {
          boolean doit = false;
          if(u.type == 1 && u.vel.y > 0.5) doit = true;
           if(u.type == 2 && u.vel.x <  0.5) doit = true;
          if(u.type == 3 && u.vel.x < 0.5) doit = true;
          if(u.type == 4 && u.vel.x < 0.5) doit = true; 
          if(u.type == 5 && u.vel.y > 0.6) doit = true; 
           if(u.type == 6 && u.vel.x < 0.5) doit = true; 
          if(u.type == 7 && u.vel.x > 0.5) doit = true; 
           if(u.type == 8 && u.vel.x <  0.5) doit = true; 
          
          
          if(noarrows) doit  = true;
          if(doit) {
            units.remove(i);
            score++;
            timer +=600;            
            image(cash, u.pos.x-30, u.pos.y-60);  
           
            
          }
        }
      }
      // collision
      for(int j = units.size()-1; j > i; j--) {
        if(i!=j) {
          Unit o = units.get(j);
          if(o.pos.dist(u.pos) < 2*o.r-30 && !o.pos.equals(u.pos) && o.init && u.init) {
            image(crash,u.pos.x-30, u.pos.y-30);
            timer -=100; 
            if(death) gameState = 1;
            units.remove(j);
            units.remove(i);
            break;
          }
        }
      }
 
    }
    for(int i = units.size()-1; i >= 0; i--) {
      Unit u = units.get(i);
      // collision obstacle
      for(int j = obst.size()-1; j >= 0; j--) {
        PVector o = obst.get(j).get();
        if(u.pos.dist(new PVector(o.x,o.y)) < (o.z/2 + u.r-30)) {
          image(crash, u.pos.x-30, u.pos.y-30); 
          units.remove(i);
          if(death) gameState = 1;
        }
      }
    }
     
    ellipseMode(CENTER);
    for(PVector o : obst) {
      pushStyle();
      fill(255);
      noStroke();
      ellipse(o.x, o.y, o.z, o.z);
      //image(mountains, o.x-o.x,o.y-o.y);
      
      
      popStyle();
    }
     
    fill(255);
    stroke(0);
    //if(!infinite) text("Score: " + str(score) + "/" + str(max), width/2, 20);
    //else text("Score: " + str(score), width/2, 20);
     
    text("Helicopters Remaining: " + str(units.size()), width/4, 30);
    text("Time Remaining: " + str(timer), 3*width/4, 30);
    text("Score: " + str(score), 2*width/4, 30);
    
    if (timer == 0 || timer < 0) {
     
      gameState = 2;
      max = 0; 
      timer = 2361; 
      float interval = 100;
      //int i = 0;
      //units.remove(i); 
        
    }
    
    
   
  }
 if(gameState == 1) {
  //  fill(255);
  //  stroke(0);
   // text("GAME OVER", width/2, 20);
   // text("Score: " + str(score), width/2, 50);
   //    text("High Score:" + highscore, width/2, 70);
   // if(score > highscore) {
    //  highscore = score;
    //}
 
    if(!mousePressed) flag = false;
    if(mousePressed && !flag) {gameState = 4; sss();}
  }
 if(gameState == 2) {
    fill(255);
    stroke(0);
    text("GAME OVER", width/2, 50);
    text("End Score: " + str(score), width/2, 70);
    
    if(score > highscore) {
      highscore = score;
    }
    
    
    if (score > 90 ) {
    image(gold,150,0); 
    text("High Score:" + highscore, width/2, 100);
    }
    if ((score < 90) && (score > 40)) {
    image(silver,150,0);
    text("High Score:" + highscore, width/2, 100); 
    }
    if (score < 40 ) {
    image(bronze,150,0); 
    text("High Score:" + highscore, width/2, 100);
    }
    
    if(!mousePressed) flag = false;
    if(mousePressed && !flag) {gameState = 4; sss();}
  }
   
   
   
}
 
 
// init
void sss() {
  score = 0;
  timer = 2361;
  
   
  
  float interval = 100;
  units = new ArrayList<Unit>();
  left = max;
 
  for(int i = 0; i < max; i++) {
    Unit u = new Unit();
    u.pos = new PVector(random(width), random(height));
    u.pos = new PVector(random(width/2), random(height/2));
    PVector d = new PVector(-1+random(4), -1+random(4));
    d.normalize();
    d.mult(width/2 + i * interval);
    u.pos.add(d);
    d.normalize();
    d.mult(-0.3);
    u.vel = d.get();
     u.type = 1;
    if(random(1) < 0.3) u.type = 2;
    if(random(1) < 0.3) u.type = 3;
    
     if(random(1) < 0.3) u.type = 4;
    if(random(1) < 0.3) u.type = 5;
    if(random(1) < 0.3) u.type = 6;
    if(random(1) < 0.3) u.type = 7;
    if(random(1) < 0.3) u.type = 8;
    
    
    units.add(u);
    interval--;
    if(interval < 50) interval = 50;
  }
   
  background(0);
   
   
  zones = new ArrayList<PVector>();
  for(int i = 0; i < 8; i++) {
    
    ///add lanes and random
    
     PVector z = new PVector((i+1)+random(100,550), (i+1)+random(100,450), i+1);
    zones.add(z);
  }
  
  ///obstacle array
     
  obst = new ArrayList<PVector>();
  if(obstacles) {
    PVector o = new PVector(-2000,-700);
    obst.add(o);
    //o = new PVector(350,150, 40);
   // obst.add(o);
   // o = new PVector(350,210, 40);
   // obst.add(o);
  //  o = new PVector(100,320, 50);
   // obst.add(o);
   // o = new PVector(200,100, 60);
   // obst.add(o);
  }
   
   
   
   
}
 
 
// unit object
class Unit {
   
  float r = 25.0;
  PVector pos = new PVector();
  PVector vel = new PVector();
  boolean dragged = false;
  boolean init = false;
  int type = 0;
  ArrayList<PVector> path = new ArrayList<PVector>();
   
  Unit() {
  }
   
  void update() {
    // start drag
    if(mousePressed && mpos.dist(pos) < r+15 && !flag) {
      flag = true;
      dragged = true;
      path = new ArrayList<PVector>();
    }
    if(path.size() > 0) {
      if(mousePressed && mpos.dist(path.get(path.size()-1)) < r+15 && !flag) {
        flag = true;
        dragged = true;
      }
    }
    // undrag
    if(!mousePressed) {
      flag = false;
      dragged = false;
    }
    // drag
    if(dragged) {
      if(path.size() > 0) {
        PVector p = path.get(path.size()-1).get();
        if(mpos.dist(p) > 4) {
          path.add(mpos.get());
        }
      } else {
        path.add(mpos.get());
      }
    }
    // move toward path
    if(path.size() >= 1) {
      vel = path.get(0).get();
      vel.sub(pos);
      vel.normalize();
      vel.mult(random(0.2,1.9));
      pos.add(vel);
      // get there
      if(pos.dist(path.get(0).get()) < r) {
        path.remove(0);
      }
    } else {
      pos.add(vel);
    }
    // bounce
    if(init) {
      if(pos.x < 0-3*r || pos.x > width + 3*r) {pos.x = constrain(pos.x, -3*r, width+3*r); vel.x *= -1;}
      if(pos.y < 0-3*r || pos.y > height + 3*r) {pos.y = constrain(pos.y, -3*r, height+3*r); vel.y *= -1;}
    }
    // in screen
    if(pos.x > 0 && pos.x < width && pos.y > 0 && pos.y < height) init = true;
     
  }
   
  void draw() {
    rectMode(CENTER);
    pushStyle();
    noFill();
   // color c = color(#FCAD00);
    //if(type == 2) c = color(#4F00FC);
    //if(type == 3) c = color(#00FCA2);
    //fill(c);
   // stroke(0);
    //strokeWeight(3.0);
    if(type == 1) {
    image(blackc, pos.x, pos.y, r*2, r*2+10);
     //ellipse(pos.x, pos.y, r*2, r*2);
    }
    if(type == 2) {
    image(redc, pos.x, pos.y, r*2, r*2+10);  
    }
    if(type == 3) {
    image(bluec, pos.x, pos.y, r*2, r*2+10);  
    }
    if(type == 4) {
    image(brownc, pos.x, pos.y, r*2, r*2+10);  
    }
    if(type == 5) {
    image(greenc, pos.x, pos.y, r*2, r*2+10);  
    }
    if(type == 6) {
    image(pinkc, pos.x, pos.y, r*2, r*2+10);  
    }
    if(type == 7) {
     image(purplec, pos.x, pos.y, r*2, r*2+10); 
    }
    if(type == 8) {
     image(yellowc, pos.x, pos.y, r*2, r*2+10); 
    }
    
    popStyle();
    // path
    if(path.size() > 0) {
      pushStyle();
      noFill();
      stroke(0,100);
      strokeWeight(3.0);
      beginShape();
      vertex(pos.x+20,pos.y+10);
      for(PVector p : path) {
        vertex(p.x,p.y);
      }
      endShape();
      popStyle();
      pushStyle();
      noFill();
      stroke(0);
      //strokeWeight(1.0);
     // fill(234,38,38);
     // ellipse(path.get(path.size()-1).x,path.get(path.size()-1).y, 5,5);
     image(beacon,path.get(path.size()-1).x,path.get(path.size()-1).y);
      popStyle();
      rectMode(CENTER);
    }
  }
   
};
void mousePressed() {
  loop(); 
  
  if( gameState == 4) {
    gameState = 0; 
    
  }else if (gameState == 0) {
 
  
} else if (gameState == 1 ) {
 gameState = 0; 
}else if (gameState == 2 ) {
 gameState = 0; 
}
}
