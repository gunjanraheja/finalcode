PImage plant;
class Plant{

  float x, y;
  float velocity;
  float w; // size of plants
  
  Plant(float x, float y, float velocity){
    this.x = x;
    this.y = y;
    this.velocity = velocity;
    
    w = random(30, 100);
    plant = loadImage("plant.png");
    
  }
  
  void display(){
    pushMatrix();
    translate(x, y);
    noFill();
    stroke(200, 255, 255, 180);
    image(plant,0, 0); 

    
   ellipse(0, 0, 0, 0);
    popMatrix();
  }
  
  void update(){
    y += velocity;
  }
  
   void shotCollision(Shot shot, Plant plant, int plantIndex, int shotIndex){
    if(dist(x, y, shot.x, shot.y) < w/2 + 2){
      shots.remove(shotIndex);
 plants.remove(plantIndex);
      score++;
    
 }
  }  
  void playerCollision(Player ship, Plant plant, int plantIndex){
    if(dist(x, y, ship.x, ship.y) < w/2 + 5){

      plants.remove(plantIndex);
//      ship.alive = false;
      score++;
    }
  }
  
}
