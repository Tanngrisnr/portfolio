
class Hitpoints{//kassen Hitpoints skapas

  int hp; //tillståndsvariabeln för hp, detta är värdet som kommer visas när programmet körs.
  int positionX; //Tillståndsvariabeln för klass-objektens position i x-led
  int positionY; //Tillståndsvariabeln för klass-objektens position i y-led

  //Konstruktormetoden
  Hitpoints(int posx, int posy, int initialhp) { //Konstruktorn för Hitpoints tar emot tre paramtrar från huvuddokumentet.
    positionX = posx;//positionX får värdet från parametervariabeln posx
    positionY = posy;//positiony får värdet från parametervariabeln posy
    hp=initialhp;//hp får värdet från parametervariabeln initialhp
  }

  void damage() { //Metoden damage(), minskar värdet av hp.
    hp--;//Matematik som minskar hp.
  }

  int getHP() { //int metoden getHP(), hämtar värdet av hp för att användas i huvuddokumentet.
    return hp;//return funktion so ger värdet av variabeln hp när funktionen aktiveras.
  }

  void display() {//Metoden display() ritar värdet på 
    textSize(20);//Sätter textSize till 20.
    fill(255);//Sätter textfärg till vit.
    text("Life:"+hp, positionX, positionY);//Placerar och bestämmer vad för text som skall skrivas ut.
  }
}