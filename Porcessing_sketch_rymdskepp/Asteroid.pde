class Asteroid extends FCircle {//Skapar klassen Asteroid

  Asteroid(float xpos, float ypos, float dia) {//Konstruktor för Asteroid som tar emot 3 parametrar. positionen i x och y, samt diametern för cirklarna.
    super(dia); //Bestämmer cirkelns diameter.
    this.setFill(245,118,20);//Bestämmer cirklarnas fyllnadsfärg.
    this.setStroke(255); //Bestämmer cirklens konturfärg.
    this.setPosition(xpos, ypos); //Bestämmer cirklarnas position med ypos och xpos variablerna.
    this.setStaticBody(true); //Sätter cirklarna som statiska objekt. 
}
}