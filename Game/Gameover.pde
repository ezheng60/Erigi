class Gameover{
  private Button yes, no;
  private color border = color(255, 255, 255);
  private color textColor = color(0, 0, 0);
  private color backgroundOff = color(255, 255, 255);
  private color backgroundOn = color(255, 255, 255);
  private String head = "GAME OVER";
  PImage chiikawa = loadImage("loseChiikawa.PNG");
  PImage background = loadImage("loseBG.PNG");

  public Gameover(){
    yes = new Button(new PVector(300, 375), new PVector(100, 50), 0, 50, 0, 255, 255, 255, textColor, "Yes");
    no = new Button(new PVector(600, 375), new PVector(100, 50), 0, 50, 0, border, backgroundOff, backgroundOn, textColor, "No");

    // PVector position, PVector size, textSize, int borderSize, color border, color backgroundOff, color backgroundOn, textColor, String text
  }
  
  public void overDraw(){
    image(background, 0, 0);
    noTint();
    textSize(150);
    textAlign(CENTER);
    fill(color(255, 255, 255));
    text(head, 0, 40, 1000, 400);
    fill(color(255, 255, 255), 175);
    image(chiikawa, 10, 20);
    noTint();
    rect(300, 225, 400, 250);
    textSize(50);
    fill(0);
    text("Play again?", 300, 275, 400, 300);
    yes.drawButton();
    yes.isOn();
    no.drawButton();
    no.isOn();
  }
  
  public boolean nextYes(){
    if (yes.clicked()){
      return true; 
    }
    return false;
  }
  
  public boolean nextNo(){
    if (no.clicked()){
      return true; 
    }
    return false;
  }
   
}
