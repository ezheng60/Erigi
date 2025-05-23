int[][] temp;
int SQUARE_SIZE = 100;
PImage grass, dirt, house, cave;
Map map1;
Enemy test;

void setup(){
   size(1000, 800); // 10 columns, 8 rows
   background(12);
   grass = loadImage("grass.jpg"); 
   dirt = loadImage("dirt.png");
   house = loadImage("house.PNG");
   cave = loadImage("cave.png");
   map1 = new Map();
   test = new Enemy(map1);
   
}

void draw(){
  map1.mapDraw(grass, dirt, house, cave);
  test.move();
}
