PImage pizza;
class Pizza{

  float x, y;
  float velocity;
  float w; // size of pizzas
  
  Pizza(float x, float y, float velocity){
    this.x = x;
    this.y = y;
    this.velocity = velocity;
    
    w = random(30, 100);
    pizza = loadImage("pizza.png");
  }
  
  void display(){
    pushMatrix();
    translate(x, y);
    noFill();
    stroke(200, 255, 255, 180);
    image(pizza,0, 0); 

    
   ellipse(0, 0, 0, 0);
    popMatrix();
  }
  
  void update(){
    y += velocity;
  }
  
   void shotCollision(Shot shot, Pizza pizza, int pizzaIndex, int shotIndex){
    if(dist(x, y, shot.x, shot.y) < w/2 + 2){
      shots.remove(shotIndex);
//       pizzas.remove(pizzaIndex);
      score++;
    
 }
  }  
  void playerCollision(Player ship, Pizza pizza, int pizzaIndex){
    if(dist(x, y, ship.x, ship.y) < w/2 + 5){

      pizzas.remove(pizzaIndex);
//      ship.alive = false;
      score--;
    }
  }
  
}
