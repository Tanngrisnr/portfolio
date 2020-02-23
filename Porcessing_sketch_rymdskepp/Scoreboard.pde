class Scoreboard {

//Här är klassens variabler. De kallas ibland för TILLSTÅNDSVARIABLER

  int score;//tillståndsvariabeln för hp, detta är värdet som kommer visas när programmet körs.
  int positionX;//Tillståndsvariabeln för klass-objektens position i x-led
  int positionY;//Tillståndsvariabeln för klass-objektens position i y-led
  
  //Konstruktormetoden
  Scoreboard(int posx, int posy, int initialscore) { //Konstruktorn för Scoreboard tar emot tre paramtrar från huvuddokumentet.
    //Här sätter vi värden på klassens tillståndsvariabler
    positionX = posx;//positionX får värdet från parametervariabeln posx
    positionY = posy;//positiony får värdet från parametervariabeln posy
    score=initialscore;//score får värdet från parametervariabeln initialscore.
  }
  void increaseScore() { //När metoden increaseScore körs ökar värdet av variabeln score.
    score++;//Matematik som ökar värdet av variabeln score.
  }
  
  void decreaseScore() {//När metoden decreaseScore kärs minskar värdet av variabeln score.
    score--;//Matematik som minskar värdet av variabeln score.
  }
  
  void display() {//Metoden display() ritar värdet på 
    textSize(20);//Sätter textSize till 20.
    fill(255);//Sätter textfärg till vit.
    text("Score:"+score, positionX, positionY);//Placerar och bestämmer vad för text som skall skrivas ut.
  }

}