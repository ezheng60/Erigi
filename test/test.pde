static final int rows = 8;
static final int cols = 8;
int xPos;
int yPos;
int SQUARE_SIZE;
int[][] grid = new int[rows][cols];
boolean[][] passed = new boolean[rows][cols];
PImage grass;
int speed = 1;
int dX;
int dY;

void setup() {
  size(500, 420);
  SQUARE_SIZE  = min(height/rows, width/cols);
  // This is just a SAMPLE grid (2D array): columns map to X, rows map to Y
  // This grid must be of dimensions: int[width/SQUARE_SIZE][height/SQUARE_SIZE]
  grass = loadImage("grass.jpg");
  for (int row = 0; row < grid.length; row++)
  {
    for (int col = 0; col < grid[0].length; col++)
    {
      grid[row][col] = color(200);
    }
  }
  // Assign random 1 or 0 values to each position of your grid
  grid = new int[][] { {0, 0, 0, 0, 0, -1, 0, 0},
                       {0, 0, 0, 1, 1, 1, 0, 0},
                       {0, 0, 0, 1, 0, 0, 0, 0},
                       {0, 0, 1, 1, 0, 1, 1, -2},
                       {0, 0, 1, 0, 0, 1, 0, 0},
                       {0, 0, 1, 0, 0, 1, 0, 0},
                       {0, 0, 1, 1, 1, 1, 0, 0},
                       {0, 0, 0, 0, 0, 0, 0, 0},};
  for (int r = 0; r < rows; r++)
  {
    for (int c = 0; c < cols; c++)
    {
      passed[r][c] = false;
      if ((grid[r][c] == 0) && (random(100) < 15))
      {
        grid[r][c] = 4;
      }
      if (grid[r][c] == -1)
      {
        xPos = c;
        yPos = r;
      }
      passed[yPos][xPos] = true;
    }
  }
  dX = xPos * SQUARE_SIZE + (SQUARE_SIZE/2);
  dY = yPos * SQUARE_SIZE + (SQUARE_SIZE/2);
}


void draw() {
  // First, test drawGrid()
  drawGrid();
  
  int destX = xPos * SQUARE_SIZE + (SQUARE_SIZE/2);
  int destY = yPos * SQUARE_SIZE + (SQUARE_SIZE/2);
  
  if (dX < destX)
  {
    if (dX + speed > destX)
    {
      dX = destX;
    }
    else
    {
      dX += speed;
    }
  }
  else if (dX > destX)
  {
    if (dX - speed < destX)
    {
      dX = destX;
    }
    else
    {
      dX -= speed;
    }
  }
  
  if (dY < destY)
  {
    if (dY + speed > destY)
    {
      dY = destY;
    }
    else
    {
      dY += speed;
    }
  }
  else if (dY > destY)
  {
    if (dY - speed < destY)
    {
      dY = destY;
    }
    else
    {
      dY -= speed;
    }
  }
  
  fill(0);
  circle(dX, dY, SQUARE_SIZE/2);
  if ((dX == destX) && (dY == destY))
  {
    move();
  }
}

void drawGrid() {
  for (int r = 0; r < rows; r++)
  {
    for (int c = 0; c < cols; c++)
    {
      noStroke();
      if (grid[r][c] == -1)
      {
        fill(205, 204, 175);
      }
      if (grid[r][c] == 0) //GRASS
      {
        fill(202, 229, 184);
      }
      if (grid[r][c] == 1)
      {
        fill(175, 140, 80);
      }
      if (grid[r][c] == -2)
      {
        fill(204, 153, 102);
      }
      square(SQUARE_SIZE*c, SQUARE_SIZE*r, SQUARE_SIZE);
      
      //texture
      if (grid[r][c] == 4)
      {
        image(grass, SQUARE_SIZE*c, SQUARE_SIZE*r, SQUARE_SIZE, SQUARE_SIZE);
      }
    }
  }
}
  
void move() {
  int[][] dir = {{0, 1}, {0, -1}, {1, 0}, {-1, 0}};
  for (int i = 0; i < dir.length; i++)
  {
    int newX = xPos + dir[i][0];
    int newY = yPos + dir[i][1];
    if (newX >= 0 && newX < cols && newY >= 0 && newY < rows)
    {
      if ((passed[newY][newX] == false) && ((grid[newY][newX] == 1) || (grid[newY][newX] == -1)))
      {
        passed[newY][newX] = true;
        xPos = newX;
        yPos = newY;
        break;
      }
      if (grid[newY][newX] == -2)
      {
        print("end");
        exit();
      }
    }
  }
}
