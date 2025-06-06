class Gameover{
  private Button yes, no;
  private color border = color(176,207,255);
  private color textColor = color(0, 0, 0);
  private color backgroundOff = color(216,225,232);
  private color backgroundOn = color(152,186,213);
  private String head = "GAME OVER";
  PImage chiikawa = loadImage("chiikawa.png");
  PImage background = loadImage("menuBG.PNG");

  public Gameover(){
    yes = new Button(new PVector(300, 400), new PVector(100, 50), 50, 0, 255, 255, 255, textColor, "Yes");
    no = new Button(new PVector(600, 400), new PVector(100, 50), 50, 0, border, backgroundOff, backgroundOn, textColor, "No");

    // PVector position, PVector size, textSize, int borderSize, color border, color backgroundOff, color backgroundOn, textColor, String text
  }
  
  public void overDraw(){
    image(background, 0, 0);
    noTint();
    textSize(150);
    textAlign(CENTER);
    fill(color(255, 255, 255), 200);
    text(head, 0, 40, 1000, 400);
    rect(300, 250, 400, 250);
    textSize(50);
    text("Play again?", 300, 275, 400, 300);
    yes.drawButton();
    no.drawButton();
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
