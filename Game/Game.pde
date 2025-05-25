int SQUARE_SIZE = 100;
PImage grass, dirt, house, cave, goblin;
Map map1;
PGraphics combineMap;
Goblin test;

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
   map1 = new Map();
   combineMap = createGraphics(width, height); // this makes all the images into one
   combineMap.beginDraw(); // so that our game doesnt lage
   map1.mapDraw(combineMap, grass, dirt, house, cave);
   combineMap.endDraw();
   test = new Goblin(map1, goblin);
   
}

void draw(){
  image(combineMap, 0, 0);
  test.move();
  mouseCheck();
}

void mouseCheck(){
  int x = constrain(mouseX, 0, 700);
  int y = constrain(mouseY, 0, 900);
  map1.grid[y/Block.blockSize][x/Block.blockSize].buildable();
}
