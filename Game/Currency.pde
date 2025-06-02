class Currency{
  private int money; 
  private PImage bill;
  
  public Currency(int money, PImage bill){
    this.money = money;
    this.bill = bill;
  }
  
  public int getMoney(){
    return money;
  }
  
  public void setMoney(int money){
    this.money = money;
  }
  
  public void addMoney(int add){
    this.money += add;
  }
  
  public void removeMoney(int remove){
    this.money -= remove;
  }
  
  public void drawMoney()
  {
    fill(0);
    textSize(Block.blockSize / 4);
    text(getMoney(), width - 1.40 * Block.blockSize, Block.blockSize/4 + (3*Block.blockSize/4));
    image(bill, width - 2.25 * Block.blockSize, Block.blockSize/4 + Block.blockSize/2, 2*Block.blockSize/3, Block.blockSize/2);
  }
  
}
