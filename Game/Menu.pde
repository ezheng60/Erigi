class Menu{
  private Button start, rules;
  private color border = color(176,207,255);
  private color textColor = color(0, 0, 0);
  private color backgroundOff = color(216,225,232);
  private color backgroundOn = color(152,186,213);
  private String text = "Play";
  private String head = "Chiikawa's Tower Defense Game";
  PImage chiikawa = loadImage("chiikawa.png");
  PImage background = loadImage("menuBG.PNG");

  public Menu(){
    start = new Button(new PVector(75, 300), new PVector(300, 100), 75, 5, border,backgroundOff, backgroundOn, textColor, text);
    rules = new Button(new PVector(75, 450), new PVector(300, 100), 75, 5, border,backgroundOff, backgroundOn, textColor, "Rules");
    // PVector position, PVector size, textSize, int borderSize, color border, color backgroundOff, color backgroundOn, textColor, String text
  }
  
  public void menuDraw(){
    background(background);
    fill(color(249,248,242), 125);
    rect(50, 25, 900, 200, 25);
    noFill();
    textSize(75);
    fill(color(0,0,0));
    textAlign(LEFT);
    text(head, 75, 50, 825, 200);
    image(chiikawa, 450, 125, 500, 500);
    fill(color(249,248,242), 125);
    rect(50, 250, 350, 350, 25);
    noFill();
    rules.drawButton();
    rules.isOn();
    start.drawButton(); 
    start.isOn();
  }
  
  public boolean nextStart(){
    if (start.clicked()){
      return true; 
    }
    return false;
  }
  
  public boolean nextRules(){
    if (rules.clicked()){
      return true; 
    }
    return false;
  }
}
