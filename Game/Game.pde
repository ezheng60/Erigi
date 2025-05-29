PImage grass, dirt, house, cave, usagi, goblin, chiikawa, hachiware, food, poop;
Map map1;
Waves wave;
PGraphics combineMap;
ArrayList<Tower> listT = new ArrayList<Tower>();
ArrayList<Enemy> listE = new ArrayList<Enemy>();
ArrayList<Food> listF = new ArrayList<Food>();
ArrayList<Poop> listP = new ArrayList<Poop>();

void setup(){
   size(1000, 800); // 10 columns, 8 rows
   background(12);
   frameRate(60);
   grass = loadImage("grass.jpg"); 
   dirt = loadImage("dirt.png");
   house = loadImage("house.PNG");
   cave = loadImage("cave.png");
   goblin = loadImage("goblin.PNG");
   goblin.resize(100, 100);
   usagi = loadImage("usagi.png");
   usagi.resize(100, 100);
   food = loadImage("food.png");
   poop = loadImage("poop.PNG");
   hachiware = loadImage("hachiware.png");
   map1 = new Map();
   combineMap = createGraphics(width, height); // this makes all the images into one
   combineMap.beginDraw(); // so that our game doesnt lage
   map1.mapDraw(combineMap, grass, dirt, house, cave);
   combineMap.endDraw();
   wave = new Waves(listE, map1, goblin);
}

void draw(){
  image(combineMap, 0, 0);
  mouseCheck();
  wave.update(); // WAVE SYSTEM
  for (Tower part: listT){
    if (part instanceof Usagi){
      part.build(usagi);
      part.attack();
      part.foodCheck();
    }
    if (part instanceof Hachiware){
      part.build(hachiware);
      part.attack();
      part.poopCheck();
    }
  }
  for (int i = listE.size() - 1; i >= 0; i--){
    if (listE.get(i) instanceof Goblin){
      ((Goblin)listE.get(i)).move();
      if (listE.get(i).getAlive() == false)
      {
        listE.remove(listE.get(i));
      }
    }
  }
  for (Food food: listF){ // moved projectile movement here because it kept calling move for each additional tower placed
     food.move();  //making it so that the proejctile moved faster if tehre wer emore towers
  }
  for (Poop poop: listP){
     poop.move(); 
  }
}

void mouseCheck(){
  int x = constrain(mouseX, 0, 900)/Block.blockSize;
  int y = constrain(mouseY, 0, 700)/Block.blockSize;
  if (map1.grid[y][x].buildable() && mousePressed){
    if (keyPressed)
    {
      if (key == '1')
      {
        Tower temp = new Usagi(listE, map1.grid[y][x], 10, 10, 10, 100, 2, 60, listF, usagi, food); //listE, cell, cost, damage, range, level, speed, totalcd
        listT.add(temp);
      }
      
      if (key == '2')
      {
        Tower temp = new Hachiware(listE, map1.grid[y][x], 10, 10, 10, 100, 10, 60, listP, hachiware, poop); //listE, cell, cost, damage, range, level, speed, totalcd
        listT.add(temp);
      }
      
    }
    println("HI");
  }

}
