PImage grass, dirt, house, cave, usagi, goblin, chiikawa, food;
Map map1;
Waves wave;
PGraphics combineMap;
ArrayList<Tower> listT = new ArrayList<Tower>();
ArrayList<Enemy> listE = new ArrayList<Enemy>();

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
  }
  for (Enemy enemy: listE){
    if (enemy instanceof Goblin){
      ((Goblin)enemy).move();
    }
  }
  for (Tower part: listT){
    for (Enemy enemy: listE){
      if (part.inRange(enemy)){
        println(part.inRange(enemy));
      }
    }
  }
}

void mouseCheck(){
  int x = constrain(mouseX, 0, 900)/Block.blockSize;
  int y = constrain(mouseY, 0, 700)/Block.blockSize;
  if (map1.grid[y][x].buildable() && mousePressed){
<<<<<<< HEAD
    Tower temp = new Usagi(listE, map1.grid[y][x], 10, 10, 10, 10, 1000, usagi, food); // listE, cell, cost, damage, range, level, cd, sprite, food sprite
=======
    Tower temp = new Usagi(listE, map1.grid[y][x], 10, 10, 10, 100, 10, usagi, food, 40); //cost, damage, attackSpeed, range, level;
>>>>>>> 533fd239090ab711a99009d0c25317168f5ca437
    listT.add(temp);
    println("HI");
  }
}
