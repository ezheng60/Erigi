class Button{
  private boolean on;
  private PVector position, size;
  private int borderSize;
  private color border, backgroundOff, backgroundOn; // COLORS
  private String text;
  
  public Button(PVector position, PVector size, int borderSize, color border, color backgroundOff, color backgroundOn, String text){
    this.on = false;
    this.borderSize = borderSize;
    this.position = position;
    this.size = size;
    this.border = border;
    this.backgroundOff = backgroundOff;
    this.backgroundOn = backgroundOn;
    this.text = text;
  }
  
  public void isOn(){
    println(on);
    if (mouseX > position.x && mouseX < size.x+position.x && mouseY > position.y && mouseY < size.y+position.y){
      on = true;
      return;
    }
    on = false;
  }
  
  public void drawButton(){
    noStroke();
    fill(border);
    rect(position.x-borderSize, position.y-borderSize, size.x+borderSize*2, size.y+borderSize*2);
    noFill();
    if (on){
      fill(backgroundOn);
    }
    else{
      fill(backgroundOff); 
    }
    rect(position.x, position.y, size.x, size.y);
    noFill();
    fill(color(0,0,0));
    textAlign(CENTER, CENTER);
    text(text, position.x, position.y, size.x, size.y);
    noFill();
  }
  
  
  
  
}
