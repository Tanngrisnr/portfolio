/*
Namn: Fredrik Wintzell
 
 Uppgift 3 - Skapa ett objektorienterat spel
 I uppgiften ska ni jobba med objekt och instanser, samt med ett externt bibliotek
 
 Steg 0 - Läs igenom läsanvisningarna. Ta er tid att läsa i boken, titta på videos och gå igenom tutorials. Försäkra er om att ni förstår skillnaden mellan INSTANS och KLAS. Läs också koden i det här exemplet NOGA och försök förstå varje rad
 Titta på Fisica-biblioteket: från http://www.ricardmarxer.com/fisica/. Titta också på exemplen som följer med Fisica-biblioteket 
 Steg 0.5 - Ladda ner det externa biblioteket Fisica. Provkör exemplet. OBS - ibland reagerar programmet inte på tangentbordstryckningar, prova då att klicka i fönstret. Prova också att klicka och dra i gubbem och se vad som händer
 
 
 Steg 1a - Skapa en INSTANS till av klassen PlayerKlass, och lägg till i världen (Ni ska alltså inte skapa en till Klass)
 Steg 1b - Gör så att den nya instansen styrs av tangntbordstryckningar med andra tagenter. Obs att ni behöver använda variableln "key" ist för keyCode för vanliga bokstavstangenter  
 Steg 1c - Lägg till en ny INSTANS av klassen scoreboard som är kopplad till det nya PlayerKlass-objektet
 
 Steg 2a - Lägg till en tillståndsvariabel "lives" i scoreboardklassen, och skriv ut denna variabel i display-metoden
 Steg 2b - lägg till metoder för att läsa och ändra värdet på lives-variabeln, exempelvis för att minska antalet liv
 Steg 2c - lägg till en metod "boolean isDead() {}" som håller reda på om liven har minskat till noll. Här kan ni fundera på om det vore rimligare att lives-variablen är kopplad till PLayerKlass-klassen i stället. Ändra om ni vill
 
 Steg 3a - I draw-metoden i huvudprogrammet, ändra så att liven minskar när man krockar med den andra spelaren
 Steg 3b - kolla om liven har gått ner till noll, och ta i så fall bort spelaren från spelplanen genom att använda world.remove(player1);
 
 Steg 4a - Skapa en ny klass "EnemyKlass". Börja med att skapa en ny Tab och döp den till EnemyKlass. Utgå från (kopiera) klassen PlayerKlass och ändra namn på klass och konstruktor
 Steg 4b - Ändra formen på objektet i konstruktor-metoden så att den inte ser likadan ut som PlayerKlass objekten. T.ex. genom att låta den ärva från FBox ist för från FCircle
 Steg 4c - Byt tab till PlayerKlass-klaseen - gör en ny metod nuddarEnemy() genom att kopiera metoden nuddarAnnanPlayer() ändra så att den reagerar på den nya EnemyKlass - klassen i stället
 
 Steg 5a - I huvudprogrammet, lägg till några instanser av den nya EnemyKlass-klassen. Prova att skapa många i toppen av skärmen
 Steg 5b - I draw metoden, kolla om player objektet krockar med ett enemy-objekt. Ta i så fall bort enemy-objektet med hjälp av world.remove() 
 
 Steg 6 - gör ett spel med fungerande spelmekanik. Utveckla klasserna i exemplet. Gör fler om det behövs. Experimentera med fysikmotorn, prova t.ex. att ändra gravitationen. Lägg ev. till statiska objekt för att skapa en "bana"
 
 
 Upgiften bedöms både baserat på visad förståelse i kommentarerna i koden, samt på kvaliteten hos det färdiga uttrycket (t.ex. komplexitet, gestaltning, originalitet) 
 
 OBS! När ni lämnar in uppgiften ska ni zippa ihop hela mappen som denna fil ligger i. Ni hittar mappen om ni väljer "Sketch"->"show sketch folder"
 
 OBS! Varje rad eller block av sammanhängande kod ska kommenteras!!!
 
 */

import fisica.*;//Importerar fisica biblioteket.

ArrayList<Stars> stars; //Deklarerar/hämtar en ArrayList baserad på klassen Stars, och döper den till stars.
FWorld world;//deklarerar en instans av klassen FWorld
Asteroid ast1;//Deklarerar en instans av klassen Asteroid
Asteroid ast2;//Deklarerar en instans av klassen Asteroid
Asteroid ast3;//Deklarerar en instans av klassen Asteroid
Asteroid ast4;//Deklarerar en instans av klassen Asteroid
Asteroid ast5;//Deklarerar en instans av klassen Asteroid
Asteroid ast6;//Deklarerar en instans av klassen Asteroid
PlayerKlass player1;//deklarerar en instans av klassen PlayerKlass
Scoreboard score1;//deklarerar en instans av klassen Scoreboard
Hitpoints hp1;//deklarerar en instans av klassen Hitpoints
FBox mark;//deklarerar en instans av klassen Fbox



void setup() {
  size(800, 800);

  Fisica.init(this); //Initierar fisicas fysikmotor.
  world = new FWorld(); //Här skapas den faktiska instansen av FWorld. Denna klass fungerar likt en ArrayList och håller reda på de olika fysikobjekten.
  world.setEdges(); //Bestämmer att "världen" i detta fall skall ha kanter.
  world.setGravity(0, 200); //Här sätts gravitationen, detta värde kontrollerar till stor del svårighetsgraden i spelet.

  player1 = new PlayerKlass(width/2, 50, "player1"); //En instans av PlayerKlass skapas, ges en startposition och döps.
  hp1 = new Hitpoints(100, 150, 50);//En instans av klassen hitpoints skapas, ges statposition och totala Hitpoints, som representeras som "Hull" i programmet.
  score1 = new Scoreboard(100, 100, 0); //En instans av klassen Scoreboard skapas, ges startposition och startvärde.
  ast1 = new Asteroid(random(100,700),random(100,700),random(30,100));//Skapar en instans av Asteroids och ger den tre parametrar. De två första är dess position i x och y. Den tredje är en parameter för objektets storlek.
  ast2 = new Asteroid(random(100,700),random(100,700),random(30,100));//Skapar en instans av Asteroids och ger den tre parametrar. De två första är dess position i x och y. Den tredje är en parameter för objektets storlek.
  ast3 = new Asteroid(random(100,700),random(100,700),random(30,100));//Skapar en instans av Asteroids och ger den tre parametrar. De två första är dess position i x och y. Den tredje är en parameter för objektets storlek.
  ast4 = new Asteroid(random(100,700),random(100,700),random(20,100));//Skapar en instans av Asteroids och ger den tre parametrar. De två första är dess position i x och y. Den tredje är en parameter för objektets storlek.
  ast5 = new Asteroid(random(100,700),random(100,700),random(20,100));//Skapar en instans av Asteroids och ger den tre parametrar. De två första är dess position i x och y. Den tredje är en parameter för objektets storlek.
  ast6 = new Asteroid(random(100,700),random(100,700),random(20,100));//Skapar en instans av Asteroids och ger den tre parametrar. De två första är dess position i x och y. Den tredje är en parameter för objektets storlek.
  mark = new FBox(width, 10);//Instansen av FBox skpas.
  mark.setName("mark");//FBox instansen för namnet "mark" för att fungera som ett kollisionsobjekt.
  mark.setPosition(width/2, height);//"mark" får en startposition.
  mark.setStatic(true);//denna funktion bestämmer at "mark" skall vara ett statiskt objekt.
  mark.setNoFill();//det bestäms att "mark" skall vara genomskinlig.
  mark.setNoStroke();//det bestäms att mark inte skall ha någon konturlinje.

  world.add(player1);//PlayerKlass-instansen player1 läggs till i FWorld.
  world.add(ast1);//Lägger till instansen av Asteroids i FWorld.
  world.add(ast2);//Lägger till instansen av Asteroids i FWorld.
  world.add(ast3);//Lägger till instansen av Asteroids i FWorld.
  world.add(ast4);//Lägger till instansen av Asteroids i FWorld.
  world.add(ast5);//Lägger till instansen av Asteroids i FWorld.
  world.add(ast6);//Lägger till instansen av Asteroids i FWorld.
  world.add(mark);//FBox instansen "mark" läggs till i FWorld.
  stars = new ArrayList<Stars>();//ArrayListan för klassen Stars skapas.
  for (int i = 0; i<900; i++) {//Denna loop bestämmer att så länge som att i är mindre än 900, så skall ett nytt objekt läggas till i ArrayListan stars.
    stars.add(new Stars(random(0.5, 3)));//En konstruktor för de specifika objekten i ArrayList stars. Dessa ges ett slumpässigt värde mellan 0.5 och 3 för att variera stjärnorars storlekar.
  } 
}
void draw() {
  background(20);
  for (Stars s : stars) {//En loop som säger till ArrayListan stars att rita upp alla objekt i sin lista.
    s.display(); //anropar funktionen display() från Stars.
    s.update(); //anropar funktionen update() från Stars.
  }

  world.step(); //Här stegar vi fram fysiksimulerinen et steg. Här körs alla matematiska beräkningar av hur objeken ska falla och studsa
  world.draw(); //Här ritas de nya positionerna för alla Fisica-objekten upp


  hp1.display(); //display() funktionen i Hitpoints hämtas. Denna ritar upp objektet.
  score1.display(); //display() funktionen i Scoreboard hämtas. denna visas som "'speed'+score" när programmet körs.
  float elevation = player1.getY();//hämtar player1 objektets y-värde.
  float life = hp1.getHP();//hämtar värdet av variabeln hp i Hitpoints funktionen.
  if (life >= 0 && elevation <= 750) { 
    score1.increaseScore();
  }//Hämtar funktionen increaseScore från Scoreboard. Denna funktion ökar värdet av variabeln score i Scoreboard-klassen med varje frame av draw().
  if (elevation >= 750) {//Denna if-sats undersöker om player1 objektets höjd, om dess höjd är över 750 aktiveras if-satsen. 
    if (life >=0) {//Denna if sats aktiveras om värdet av variabeln life är lika med eller mindre än 0. 
      score1.decreaseScore();//Anropar funktionen decreaseScore, denna funktion minskar värdet av variabeln score med varje frame av draw().
    }
  }
  if (life <= 0) {//Denna if-sats undersöker om värdet av variabeln hp är mindre än eller lika med noll.
    fill(255);//bestämmer att textfärgen skall vara vit.
    textAlign(CENTER);//Säger till texten att centrera sig runt koordinaterna.
    textSize(45);//sätter textSize av det första textelementet till 45.
    text("Game Over!", width/2, height/2);//Skriver ut frasen "Game Over! i mitten av skärmen.
    textSize(30);//Sätter textSize tilldet andra textelementet till 30.
    text("Tryck R för att pröva igen", width/2, height/2+50);//Skriver ut texten "Tryck R för att pröva igen" strax under det första textblocket.
  }
}


void keyPressed() {//skapar en keypressed funktion.
  try {//try används i samband med catch för att hantera udantag i programmet/koden. I detta fall de olika else if-satserna.
    if (keyCode == LEFT) {//Om den vänstra pilknappen trycks ned.
      player1.rot2(-100);//Anropas funktionen rot2() som får player1-objektet att rotera åt vänster.
    } else if (keyCode == RIGHT) {//Om den högra pilknappen trycks ned.
      player1.rot1(100);//Anropas funktionen rot1() som får player1-objektet att rotera åt höger.
    } else if (keyCode == UP) {//om pilknappen uppåt trycks ned.
      player1.thrust(75);//Anripas funktionen thrust() som får objektet att röra sig i nosens riktning.
    }
  } 
  catch (Exception e) {//catch används i samband med try för att hantera udantag i programmet/koden. I detta fall de olika else if-satserna.
  }
  int k = keyCode;//deklarerar en lokal int-variabel som får värdet keyCode

  switch(k) {//Fungerar litk en if-sats men är lättare för att använda i samband med knapptryck.
  case 82://ett case som aktiveras när r-tangenten trycks ned. 82 är tangentkoden för bokstaven r på tangentbordet.
    setup();//när r-tangenten trycks ned återvänder programmet till setup().
    break;//Avslutar switch-funktionen och förhindrar att ytterligare case aktiveras.
  }
}
void keyReleased() {//skapar en keyReleased funktion.
  try {//try används i samband med catch för att hantera udantag i programmet/koden. I detta fall de olika else if-satserna.
    if (keyCode == LEFT) {//Om den vänstra pilknappen trycks ned.
      player1.rot2(0);//Anropas funktionen rot2() i detta fall återställs rotationskraften.
    } else if (keyCode == RIGHT) {//Om den högra pilknappen trycks ned.
      player1.rot1(0);//Anropas funktionen rot1() i detta fall återställs rotationskraften.
    }
  } 
  catch (Exception e) {//catch används i samband med try för att hantera udantag i programmet/koden. I detta fall de olika else if-satserna.
  }
}
void contactStarted(FContact c) {//Skapar en funktion som använder sig utav klassen FContact i Fisica för att hålla reda på kollisioner i FWorld. 

  FBody b1 = null; //Två FBody instanser, b1 och b2 deklareras med ett null-värde.
  FBody b2 = null;

  if (c.getBody1().getName() == "player1") {//Om den första kroppen i kollisionen heter "player1" ges b1 värdet från funktionen getBody1(). b2 för värdet av funktionen getBody2().
    b2 = c.getBody2(); 
    b1 = c.getBody1();
  }
  if (c.getBody2().getName() == "player1") {//Om den andra kroppen i kollisionen heter "player1" ges b1 värdet från funktionen getBody2(). b2 för värdet av funktionen getBody1().
    b1 = c.getBody2(); 
    b2 = c.getBody1();
  }//På detta vis har kan man alltid utgå från att b1 har värdet av "player1".



  if (b2 != null) {//Om b2 inte saknar värde.
    if (b2.getName() == "mark") {//undersöks hurvida namnet på värde/objekt är "mark".
      hp1.damage();//om det är fallet aktiveras klassen damage som minskar värdet på hp-variabeln i klassen Hitpoints
    }
    if (b1 != null) {//Om b1 inte saknar värde.
      if (b1.getName() == "mark") {//undersöks hurvida namnet på värde/objekt är "mark".
        hp1.damage();//om det är fallet aktiveras klassen damage som minskar värdet på hp-variabeln i klassen Hitpoints
      }
    }
  }
}  




//Den här metoden anropas när två Fisica-objekt krockar. FContact-objektet håller reda på vilka två objekt deet var som krockade


/********************************************   
 Här nedan ska ni reflektera över uppgiften och även besvara några konkreta frågor  
 * Reflektera över när det kan vara användbart att använda klasser. Redogör för skilladen mellan klasser och instanser. Lista alla klasser ni använder i ert program. Vilka definieras i det här programmet? 
 * Vilka kommer från Fisica? och vilka kommer från Java eller Processing? 
 I mitt program används klasserna: Hitpoints, PlayerKlass, Scoreboard, Stars, FWorld, FBox, och FPoly.
 Klassen PlayerKlass är en extention av FPoly och använder FPoly (Och dess förälder FBody) klassernas funktioner för att både rita upp den faktiska formen, men också för att detta objekt skall röra sig som ett fysikobjekt i world
 Hitpoints och Scoreboard är självstående klasser och har varsin instans i programmet, de änvänder sig av returvärden från varandra och från PlayerKlass för att hantera Hull(Liv) och Score.
 Till sist finns i programmet 900 instanser i en arraylist av klassen Star. Jag skapade klassen Star och dess arrayList för att kunna rita upp många objekt liknande eller likadana objekt från samma klass utan att behöva göra det manuellt. Så från min erfarenhet av arraList funktionen i samband med klasser anser jag att klasser och objektorienterad programmering är oerhört viktigt för om man vill skapa flera av samma objekt. Till exempel som i en stjärnhimmel eller ett partikelsystem.
 
 Skillnaden mellan en klass och en instans är som skillnaden mellan ett pajrecept och den färdiga pajen. I denna liknelse är klassen och dess konstruktor recpet och instruktionerna, deklarationen och skapandet av instansen är vad bagaren gör när hen följer receptet. Den färdiga pajen är sedan av som anropas från klassens funktioner.
 Alltså är instansen/objektet vad som skapas (och med vilka parametra ifall konstruktorn ber om sådana när instansen skapas). Och klassen är vad som faktiskt skapar objektet.
 
 * Reflektera kort över processen med uppgiften. Om ni körde fast, hur kom ni vidare? Har ni tittat i huvudsak på exempel, videotutorials, eller i boken? Vad hade ni problem med? Vad ägnade ni den mesta tiden åt?
 I denna uppgift körde jag fast i början med steg-för-steg uppgiften. Samt hade jag svårt att komma exakt hur jag skulle få Objektet från min PlayerKlass att röra sig på det sättet jag ville. För att uppnå detta fick jag till stor del hjälp under handledningstillfällen, men jag tittade även på andra liknande processing program och arbetade utifrån dem.
 Den mesta tiden gick åt till att få PlayerKlass objektets rörelsemönster att bete sig som jag ville att det skulle.
 
 * Reflektera kort över kommentarer ni fick från designkritiken - har ni gjort några ändringar baserat på kritiken?
 Överlag var responsen på mitt spel att det var kul att spela och välgjort när det gällde själva mekaniken, men jag upplevde att de som gav mig kritik upplevde det lite tomt eller slätstruket.
 Från vad jag observerade upplevde öven flera användare att skeppet i spelet avar trögt att kontrollera, något jag rättat till genom att minska skeppets massa och på så sätt gjort det mer responsivt att kontrollera.
 Utöver detta fick jag även förslag på att ha någon form av startskärm med instruktioner för hur spelet fungerar och som också inte bara kastar in spelaren i spelet.
 För att ge spelet en mer interaktiv spelvärd har jag skapat klassen Asteroids som lägger till statiska objekt ärvda från FCircle. Dessa är till för att göra navigeringen i spelvärlden svårare.
 *******************************************/