abstract class Tower{
  private int cost, damage, attackSpeed, range, level;
  private Block cell;
  private ArrayList<Enemy> listE;
  
  public Tower(ArrayList<Enemy> listE, Block cell, int cost, int damage, int attackSpeed, int range, int level){
    this.listE = listE;
    this.cell = cell;
    this.cost = cost;
    this.damage = damage;
    this.attackSpeed = attackSpeed;
    this.range = range;
    this.level = level;
  }
  
  public void build(PImage sprite){  // OK SO THIS TAKES A SPRITE SO IN THE SUBCLASS YOU PUT THE SPRITE THERE AND DO SUPER.MOVE AND USE THE SPRITE AS AN INPUT
    image(sprite, cell.getx(), cell.gety());
    cell.setOccupied(true);
  }
    
  public boolean inRange(Enemy enemy){
    if (PVector.dist(new PVector(cell.getx(), cell.gety()), enemy.sPtEnemy()) < 150){
      return true;
    }
    return false;
  } // REMEMEBER THAT POSITIONS ARE THE TOP LEFT CORNER NOT THE CENTER
  
  
  public void attack()
  {
  }
  
  public void foodCheck()
  {
  }
  
}
