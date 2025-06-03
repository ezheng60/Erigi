class Button{
  private boolean on;
  private PVector position, size;
  private int borderSize, textSize;
  private color border, backgroundOff, backgroundOn, textColor; // COLORS
  private String text;
  
  public Button(PVector position, PVector size, int textSize, int borderSize, color border, color backgroundOff, color backgroundOn, color textColor, String text){
    this.on = false;
    this.borderSize = borderSize;
    this.position = position;
    this.size = size;
    this.textSize = textSize;
    this.border = border;
    this.backgroundOff = backgroundOff;
    this.backgroundOn = backgroundOn;
    this.textColor = textColor;
    this.text = text;
  }
  
  public void isOn(){
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
    fill(textColor);
    textAlign(CENTER, CENTER);
    textSize(textSize);
    text(text, position.x, position.y, size.x, size.y);
    noFill();
  }
  
  public boolean clicked(){
    if (on && mousePressed){
      return true; 
    }
    return false;
  }
  
  
}
