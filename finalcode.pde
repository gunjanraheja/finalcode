
PImage bg;

int score=0;


boolean keyLeft = false;
boolean keyRight = false;
boolean keyShoot = false;

Player player;
ArrayList <Pizza> pizzas;
ArrayList <Shot> shots;
ArrayList <Plant> plants;

void setup(){
   size(847, 607);
   frameRate(30);
   bg = loadImage("background.jpg");

   player = new Player(width, height);
     pizzas = new ArrayList<Pizza>();
   shots = new ArrayList<Shot>();
   plants = new ArrayList<Plant>();

 noCursor();
  score = 0;
  restart(); // create function


}



void draw(){
background (bg);

  String scoreText = "SCORE:" + score;
  text(scoreText, width/2, 20);

player.display();
player.update();
  //The higher the score..
  int maxPizzas = abs(score) + 50; // ..more pizzas.
  int newPizzaTiming = 50 - abs(score); //..faster they spawn
  float pizzaSpeed = random(abs(score)*0.25+5, abs(score)*0.25+5); //..faster they go!
  
    int maxPlants = score + 20; // ..more pizzas.
 int newPlantTiming = 50 - abs(score); //..faster they spawn
  float plantSpeed = random(abs(score)*0.25+1, abs(score)*0.25+5);
  
  
  
  //adding pizzas to the pizza array
  if(pizzas.size() < maxPizzas && frameCount % newPizzaTiming == 10){
    pizzas.add(new Pizza(random(width), 0, pizzaSpeed));
  }
  
   if(plants.size() < maxPlants && frameCount % newPlantTiming == 10){
    plants.add(new Plant(random(width), 0, plantSpeed));
 }

  //draw shots
  for(int i = 0; i<shots.size(); i++){
    Shot tempShot = shots.get(i);
    tempShot.update();
    tempShot.display();
    tempShot.dissipate(i);
  }
  
  
  //draw pizzas
  for(int i = 0; i < pizzas.size(); i++){
    Pizza tempAst = pizzas.get(i);
    tempAst.update();
    tempAst.display();
    
    if(tempAst.y > height+tempAst.w*0.5){
      pizzas.remove(i);
    }
    
    //shot collison
    for(int j=0; j<shots.size(); j++){
      Shot tempShot = shots.get(j);
      tempAst.shotCollision(tempShot, tempAst, i, j);
    }
    
    //player collison
    if(player.alive == true){
      tempAst.playerCollision(player, tempAst, i);
    }
    
    for(int g = 0; g < plants.size(); g++){
    Plant tempPl = plants.get(g);
    tempPl.update();
    tempPl.display();
    
    if(tempPl.y > height+tempPl.w*0.5){
      plants.remove(g);
    }
    if(player.alive == true){
      tempPl.playerCollision(player, tempPl, g);
    }
    
    }
    
   
    if(player.alive == false){

      restart();
    }
  }
  
}



   void keyPressed(){
  if(key == CODED){
    if(keyCode == LEFT){
      keyLeft = true;
    }
    if(keyCode == RIGHT){
      keyRight = true;
    }
  }
  if(key == ' '){
    keyShoot = true;
  }
}

void keyReleased(){
  if(key == CODED){
    if(keyCode == LEFT){
      keyLeft = false;
    }
    if(keyCode == RIGHT){
      keyRight = false;
    }
  }
  if(key == ' '){
    keyShoot = false;
  }
}

void restart(){
  pizzas.clear();
  score = 0;
  pizzas.add(new Pizza(random(width), 0, random(2,6)));
  pizzas.add(new Pizza(random(width), 0, random(2,6)));
  pizzas.add(new Pizza(random(width), 0, random(2,6)));
   plants.add(new Plant(random(width), 0, random(1,5)));
   plants.add(new Plant(random(width), 0, random(1,5)));
   plants.add(new Plant(random(width), 0, random(1,5)));
  player.x = width/2;
  player.y = height/1.5;
  player.velocity = new PVector(0, 0);
  player.alive = true;
}