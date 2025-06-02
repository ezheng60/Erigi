class Hachiware extends Tower{
  private PImage sprite;
  private ArrayList<Poop> listPoop;
  private PImage poopSprite;
  
  public Hachiware(ArrayList<Enemy> listE, Block cell, int cost, int damage, int range, int level, int speed, int totalcd, ArrayList<Poop> listP, PImage sprite, PImage poopSprite){
    super(listE, cell, cost, damage, range, level, speed, totalcd); // ArrayList<Enemy> listE, Block cell, int cost, int damage, int range, int level, int speed, int totalcd
    this.sprite = sprite;
    this.poopSprite = poopSprite;
    this.listPoop = listP;
  }
  
  public void build(){
    super.build(sprite);
  }
  
  public void attack(){
    if (this.getcd() > 0) // every frame subtract cd
    {
      this.setcd(this.getcd()-1);
    }
    else
    {
      for (int i = 0; i < getlistE().size(); i++)
      {
        if (this.inRange(getlistE().get(i)))
        {
          listPoop.add(new Poop(poopSprite, new PVector(getCell().getx() + Block.blockSize/4, getCell().gety() + Block.blockSize/4),
          getDamage(), getSpeed(), Block.blockSize/4, new PVector(listE.get(i).sPtEnemy().x + Block.blockSize / 2, listE.get(i).sPtEnemy().y + Block.blockSize / 2)));
          listPoop.add(new Poop(poopSprite, new PVector(getCell().getx() + Block.blockSize/4, getCell().gety() + Block.blockSize/4),
          getDamage(), getSpeed(), Block.blockSize/4, new PVector(listE.get(i).sPtEnemy().x + Block.blockSize, listE.get(i).sPtEnemy().y + Block.blockSize))); //DOUBLE POOP
          //PImage sprite, PVector position, int damage, int speed, int radius, int explosionSize, PVector enemyPos
          // center of tower as initial position and center of first enemy in list as enemyPos
          this.setcd(this.gettcd()); // so like totalCD = 60 would be like one second (60 fps)
          break;
        }
      }
    }
  }
  
  public void poopCheck(){
    for (int i = listPoop.size() - 1; i >= 0; i--) //start at back so it's less complicated to remove Poops
    {
      for (int e = 0; e < getlistE().size(); e++)
      {
        if (listPoop.get(i).enemyHit(getlistE().get(e).sPtEnemy()))
        {
          listPoop.remove(i);
          //add enemies taking dmg here
          getlistE().get(e).takeDamage(getDamage());
          getlistE().get(e).checkHealth();
          break;
        }
      }
    } 
  }
}
