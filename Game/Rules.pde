class Rules{
  private Button back;
  private color border = color(176,207,255);
  private color textColor = color(0, 0, 0);
  private color backgroundOff = color(216,225,232);
  private color backgroundOn = color(152,186,213);
  private String text = "Go Back";
  private String head = "Rules";
  private String rules = "The objective of the game is to protect the house from monsters. Players can buy towers to kill these enemies before they reach their house. The yellow bunny is Usagi; the middle one is Chiikawa; and the one with blue ears is Hachiware. Usagi will throw food at enemies, Chiikawa will boost the speed of the attacks of other towers around him, and Hachiware will throw poop to attack enemies. Players can press keys 1, 2, or 3 and click on a grid on the map to buy towers there. They can upgrade towers by hovering on the tower and pressing 4. They can also delete towers by pressing the key 5 and clicking on that grid. Players can hover a tower and while holding ‘i’ to see the stats of that tower.";
  PImage chiikawa = loadImage("chiikawa.png");
  PImage background = loadImage("menuBG.PNG");

  public Rules(){
    back = new Button(new PVector(350, 625), new PVector(300, 100), 255, 75, 5, border,backgroundOff, backgroundOn, textColor, text);
    // PVector position, PVector size, textSize, int borderSize, color border, color backgroundOff, color backgroundOn, textColor, String text
  }
  
  public void menuDraw(){
    background(background);
    fill(color(249,248,242), 125);
    rect(50, 25, 900, 100, 25);
    noFill();
    textSize(75);
    fill(color(0,0,0));
    textAlign(CENTER);
    text(head, 75, 50, 825, 200);
    fill(color(249,248,242), 125);
    rect(50, 175, 900, 400, 25);
    textSize(25);
    fill(color(0,0,0));
    textAlign(LEFT);
    text(rules, 75, 200, 875, 375);
    noFill();
    back.drawButton(); 
    back.isOn();
  }
  
  public boolean next(){
    if (back.clicked()){
      return true; 
    }
    return false;
  }
  
}
