class Currency{
  private int money; // should this be a pvector
  
  public Currency(int money){
    this.money = money;
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
  
}
