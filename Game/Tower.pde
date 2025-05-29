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
  public Block getCell(){
    return cell; 
  }
  public int getDamage(){
    return damage; 
  }
  public int getSpeed(){
    return speed; 
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
    if (PVector.dist(new PVector(cell.getx(), cell.gety()), enemy.sPtEnemy()) < 150){
      return true;
    }
    return false;
  } // REMEMEBER THAT POSITIONS ARE THE TOP LEFT CORNER NOT THE CENTER
  
  /*
  public int getFirst(){ // COME BACK TO THIS LATER WHEN COLLISION IS FIXED
    int max = 0;
    int index = 0;
    for (int i = 0; i < listE.size(); i++){
      if (listE.get(i).getDistance() > max ){
        index = i;
        max = listE.get(i).getDistance();
      }
    }
    return index;
  }
  */
  
  public void attack()
  {
  }
  
  public void foodCheck()
  {
  }
  
  public void poopCheck()
  {
  }
  
}
