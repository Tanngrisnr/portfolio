class PlayerKlass extends FPoly { //Klassen PlayerKlass skapas, Denna klass ärver från fisica klassen FPoly.


  PlayerKlass(int startX, int startY, String name) { //Playerklassens konstruktor, den hämtar en parametrar för startposition, samt objektest namn.
    vertex(20, 20);//Vertex som bidrar till att rita upp trianglen/skeppet.
    vertex(-20, 20);//Vertex som bidrar till att rita upp trianglen/skeppet.
    vertex(0, -40);//Vertex som bidrar till att rita upp trianglen/skeppet.
    this.setBullet(true);//Bestämmer att objekt från PlayerKlass skall vara Bullet-objekt. setBullet är en fisica funktion från FBody (vilken FPoly ärver av) som gör objektet mer exakt i sina rörelser.
    this.setDensity(0.2);//Minskar PlayerKlass-objektest massa genom att multiplicera basvärdet med 0.5. (orginalvärdet för massan är 3.0). Detta gör objektet mer responsivt att kontrollera.
    this.setName(name); //Objektet får ett namn.
    this.setStroke(255);//Triangelns stroke, ges gråskalevärdet 255.
    this.setFill(50, 191, 56);//Triangeln gess en fyllnadsfärg
    this.setPosition(startX, startY); //Anropar funktionen setPosition ur FPoly som bestämmer objektets startposition.
  }

  void rot1(float torque) {//Metoden rot1 tar emot ett float värde när funktionen anropas
    this.addTorque(torque);//Anropar funktionen addTorque som ökar objektets vridmoment.
  }

  void rot2(float torque) {//Metoden rot2 tar emot ett float värde när funktionen anropas
    this.addTorque(torque);//Anropar funktionen addTorque som ökar objektets vridmoment.
  }

  void thrust(float pwr) {//Metoden thrust tar emot parametern pwr och agerar som skeppets "motor".
    float rotation = this.getRotation();//Hämtar objektets rotationsvärde och lägger det i en variabel
    PVector center = new PVector(this.getX(), this.getY()); //skapar en PVector som håller reda på positionen för PlayerKlass-objektet
    float force = pwr;//variabeln force får värdet från parametern pwr.
    this.setPosition(center.x, center.y);//sätter objektets position till att basera sig på PVector center, detta gör rörelsen mer följsam.
    println(this.getRotation());//Skriver ut rotationsvärdet
    this.addImpulse(force * sin(rotation), -force * cos(rotation));//en anropning av funktionen addImpulse som använder matematik för att bestämma åt vilket håll skeppet skall röra sig.
  }
}