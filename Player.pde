PImage boy, boy2,boy3,boy4,boy5 ; // *


class Player{
  
  float x,y;

 
  PVector velocity;
  float shotTimer, shotRate;
  float maxVelocity;
  boolean alive;
  
 

 

  Player(float x, float y){
    this.x = x;
    this.y = y ;
    
      alive = true;
    shotRate = 35;
    shotTimer = 0;
    maxVelocity = 10;
    boy = loadImage("boy.png");
    boy2 = loadImage("boy2.png"); // *
    boy3 = loadImage("boy3.png"); 
    boy4 = loadImage("fattie.png"); 
    boy5 = loadImage("boom.png");
        
    velocity = new PVector(0, 0);
  }
  
  void display(){

    if(alive == true){
      pushMatrix();
      translate(x, y);
      
      // *
      
      if(score <= -0 && score >= -2){
       image(boy, 0, 0);
       }else if(score <= -2 && score >= -4){
        image(boy2, 0, 0);
      }else if(score <= -4 && score >= -6){
        image(boy3, 0, 0);
         }else if(score <= -6 && score >= -8){
        image(boy4, 0, 0);
         }else if(score <= -8 && score >= -10){
        image(boy4, 0, 0);
        }else if(score <= -10 && score >= -12){
        image(boy5, 0, 0);
        
        }else if(score <= 0 && score >= 20){
           image(boy, 0, 0);
           
           image(boy, 0, 0);
        image(boy2, 0, 0);
      }else{
        image(boy, 0, 0);
      }
       
       popMatrix();
        }
  }
  
  void update(){
  
    if(alive == true){
      if(x < 0){
        x = width;
      }
      if(x > width){
        x = 0;
      }
      
      x += velocity.x; //adding spped to position
      
      if(keyLeft == true){
        velocity.x -= 0.5;
      }else if(keyRight == true){
        velocity.x += 0.5;
      }else {
        velocity.x -= 0.1 * velocity.x;
      }

        }
  }
}