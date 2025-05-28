class Hachiware extends Tower{
  private PImage sprite;
  private ArrayList<Poop> listPoop;
  private PImage PoopSprite;

  private int cd;
  private int totalCD;
  
  public Hachiware(ArrayList<Enemy> listE, Block cell, int cost, int damage, int attackSpeed, int range, int level, PImage sprite, PImage PoopSprite, int totalCD){
    super(listE, cell, cost, damage, attackSpeed, range, level);
    this.sprite = sprite;
    this.PoopSprite = PoopSprite;
    this.listPoop = new ArrayList<Poop>();
    this.totalCD = totalCD;
    cd = 0;
  }
  
  public void build(){
    super.build(sprite);
  }
  
  public void attack(){
    if (cd > 0)
    {
      cd--;
    }
    else
    {
      for (int i = 0; i < super.listE.size(); i++)
      {
        if (this.inRange(super.listE.get(i)))
        {
          listPoop.add(new Poop(PoopSprite, new PVector(super.cell.getx() + Block.blockSize / 2, super.cell.gety() + Block.blockSize / 2), super.damage, Block.blockSize / 4, new PVector(listE.get(i).sPtEnemy().x + Block.blockSize / 2, listE.get(i).sPtEnemy().y + Block.blockSize / 2)));
          // center of tower as initial position and center of first enemy in list as enemyPos
          cd = totalCD;
          break;
        }
        this.setcd(this.getcd()+1000);
      }
    }
  }
  
  public void poopCheck(){
    for (int i = listPoop.size() - 1; i >= 0; i--) //start at back so it's less complicated to remove Poops
    {
      listPoop.get(i).move();
      for (int e = 0; e < super.listE.size(); e++)
      {
        if (listPoop.get(i).enemyHit(super.listE.get(e).sPtEnemy()))
        {
          listPoop.remove(i);
          //add enemies taking dmg here
          listE.get(e).takeDamage(super.damage);
          listE.get(e).checkHealth();
          break;
        }
        if ((listPoop.get(i).position.x + 2 * listPoop.get(i).radius > width) || (listPoop.get(i).position.y + 2 * listPoop.get(i).radius > height) || (listPoop.get(i).position.x < 0) || (listPoop.get(i).position.y < 0))
        {
          //if Poop goes outside screen, remove from Pooplist
          listPoop.remove(i);
          break;
        }
      }
    } 
  }
}
