class Stars {//deklarerar klassen stars.
  float x, y, w, speed;//hämtar de tre variabler som skall bestämma stjärnoras position och storlek, samt hur snabbt de skall röra sig nedåt.
  color c;//Hämtar färgvariabeln c.
  Stars(float tempw) {//Konstruktor för Stars-klassen, den har en parameter tempw, som hämtas ur huvudokumentet.
    w=tempw;//Bestämmer att storlek skall hämtas från dess anrop i void setup().
    x=random(0, width);//Bestämmer att en stjärnas x koordinat kan vart mellan 0 och widht.
    y=random(5, height); //Bestämmer att en stjärnas y koordinat vara vilket y värde som helst mellan 5 och 700.
    speed = 2;//Värdet av speed sätts till 2.
    c = color(random(230,255),random(200,255),random(200,255));//bestämmer färgen som lagras i kollorvariabeln C. Denna är delvis slumpmässig
  }
  void display() {//skapar funktionen display.

    stroke(c);//bestämmer att punkterna som ritas upp (stjärnorna) skall vara vita.
    strokeWeight(w); //Bestämmer punkternas strokWeight. Eftersom point() funktionen används blir detta stjärnoras storlek.
    point(x, y);//Ritar ut stjärnorna med point().
  }
  void update(){//Update funktionen styr stjärnornas rörelser
    y += speed; //Uppdaterar och beräknar objektets position i y-led.
    if(y>height){//Om värdet av y för en stjärna är högre än värdet av height.
      x=random(0, width);//ställ då om stjärnans position till ettm slumpmässigt x mellan 0 och width.
    y=random(-5, 0);//Och ett slumpmässigt y-värde mellan -5 och 0.
    w = random(0.5,3);//Ge stjärnan en ett random strokeWeight.
    c = color(random(230,255),random(200,255),random(200,255));//Slumpa om stjärnans färg.
    }  
}
}