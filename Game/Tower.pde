abstract class Tower{
  private int cost, damage, range, level, speed, totalcd; //totalcd is like atkspeed
  private int cd = 0; // cd is like timer on attacks
  private Block cell;
  private ArrayList<Enemy> listE;
  
  public Tower(ArrayList<Enemy> listE, Block cell, int cost, int damage, int range, int level, int speed, int totalcd){
    this.listE = listE;
    this.cell = cell;
    this.cost = cost;
    this.damage = damage;
    this.range = range;
    this.level = level;
    this.speed = speed;
    this.totalcd = totalcd;
  }
  
  public ArrayList<Enemy> getlistE(){
    return listE; 
  }
  public int getLevel(){
    return level; 
  }
  public Block getCell(){
    return cell; 
  }
  public int getDamage(){
    return damage; 
  }
  public void setDamage(int damage){
    this.damage = damage;
  }
  public int getSpeed(){
    return speed; 
  }
  public void setSpeed(int spd){
    this.speed = spd;
  }
  public int getRange(){
    return range; 
  }
  public void setRange(int range){
    this.range = range; 
  }
  public int getcd(){
    return cd;  
  }
  public void setcd(int cd){
    this.cd = cd;
  }
  public int gettcd(){
    return totalcd; 
  }
  public void settcd(int cd){
    this.totalcd = cd;
  }
  
  public void build(PImage sprite){  // OK SO THIS TAKES A SPRITE SO IN THE SUBCLASS YOU PUT THE SPRITE THERE AND DO SUPER.MOVE AND USE THE SPRITE AS AN INPUT
    image(sprite, cell.getx(), cell.gety(), Block.blockSize, Block.blockSize);
    cell.setOccupied(true);
  }
    
  public boolean inRange(Enemy enemy){
    if (PVector.dist(new PVector(cell.getx(), cell.gety()), enemy.sPtEnemy()) < range){
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
  
  public void poopCheck()
  {
  }
  
  public void buff()
  {
  }
  
  public void buff(Tower tower)
  {
  }
  
  public void removeBuff()
  {
  }
  
  public int getCost()
  {
    return cost;
  }
  
  public void upgrade()
  {
    this.damage = (int)(1.5 * damage);
    this.range = (int)(1.5 * range);
    this.totalcd = (int)(1.2 * totalcd);
    this.level += 1;
  }
  
  public PImage getSprite(){
    return null;
  }
}
