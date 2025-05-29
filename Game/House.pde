public class House{
  private int HP, maxHP;
  private boolean alive;
  private PVector coords;
  private int greenColor;

  public House(int maxHP, PVector coords){
    this.HP = maxHP;
    this.maxHP = maxHP;
    this.coords = coords;
    alive = true;
    greenColor = 174;
  }
  
  public PVector getCoords(){
    return coords; 
  }
  
  public void takeDamage(int damage){
    if (alive){
      HP -= damage;
    }
  }
  
  public void checkHealth(){
    if (HP <= 0)
    {
      alive = false;
    }
  }
    
  public boolean getAlive(){
    return alive;
  }
  
  public void healthBar()
  {
    noStroke();
    int currGreen = greenColor - (int) (150 * ((float) (maxHP - HP)/maxHP));
    println(greenColor);
    fill(123, currGreen, 28);
    rect(width - 2.25 * Block.blockSize, Block.blockSize/4, 2 * Block.blockSize * ((float) HP/maxHP), Block.blockSize/2);
    stroke(0);
    noFill();
    rect(width - 2.25 * Block.blockSize, Block.blockSize/4, 2 * Block.blockSize, Block.blockSize/2);
  }
}
