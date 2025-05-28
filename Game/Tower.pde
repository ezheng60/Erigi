abstract class Tower{
  private int cost, damage, range, level, cd; //cd is like atkspeed
  private Block cell;
  private ArrayList<Enemy> listE;
  
  public Tower(ArrayList<Enemy> listE, Block cell, int cost, int damage, int range, int level, int cd){
    this.listE = listE;
    this.cell = cell;
    this.cost = cost;
    this.damage = damage;
    this.range = range;
    this.level = level;
    this.cd = cd;
  }
  
  public int getcd(){
    return cd;  
  }
  
  public void setcd(int cd){
    this.cd = cd;
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
