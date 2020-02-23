/*
Namn: Fredrik Wintzell
 
 Uppgift 2 - Skapa ett interaktivt konstverk - "the art of repetition"
 I denna uppgift ska ni skapa ett intressant grafiskt uttryck genom att rita upp och repetera grafiska former
 Uttrycket skall också vara interaktivt, och förändras baserat på musklick eller rörelser med muspekaren. Uppgiften ska också innehålla metoder som ni gjort själva och som ni använder i koden.
 
 Steg 0 - Byt namn på filen och sätt dit era egna namn
 Steg 1 - Prova att rita upp olika grafiska element som cirklar, rektanglar, linjer m.m. Utgå från funktionerna under rubriken "2D Primitives", "3D Primitives", och "Curves" bland Processingmetoderna: https://processing.org/reference/
 Steg 2 - Kombinera några olika element (cirklar, rektanglar, m.m.) så att funktionen ritaEnGrej, ritar upp ett litet sammansatt objekt på den plats på skärmen som anges av variablerna xpos, och ypos 
 Steg 3 - Gör en "for-loop" som ritar upp en vågrät rad med objekt från ena kanten på skärmen till den andra genom att anropa ritaEnGrej med en uppräknande variabel som första parameter  
 Steg 4 - Gör en dubbel loop genom att lägga ovanstående loop innuti en ny loop som ritar upp rader av objekt uppifrån fönstrets topp till dess botten. Hela fönstret ska med andra ord fyllas av objekt
 Steg 5 - Gör en ny funktion ritaOchVrid(int xpos, int ypos, float rotate), som ritar upp och roterar objektet, mha funktionen rotate() och translate(). Obs - detta är svårare än man tror. Läs i boken, och titta på exempel om rotation. OBS2 - använd pushMatrix() och popMatrix() (läs på om dessa)
 Steg 5 - Skapa ett intressant uttryck baserat på repetition. Börja om från början och rita upp enkla former som repeteras och varieras på intressanta sätt. Uttrycket skall vara interaktivt, och förändras baserat på musklick eller rörelser med muspekaren
 Utgå från ovanstående steg, men ni har stora friheter att skapa ett eget uttryck. Detta är uppgiften som lämnas in
 
 Tips 1 - använd funktionen map(), för att låta muspekaren (mouseX, och mouseY) styra någon variabel. Titta på examplen här: https://processing.org/reference/map_.html
 Tips 2 - använd funktionerna random() eller noise() för att variera uttrycket och göra det mer intressant. Läs om funktionerna här: https://processing.org/reference/
 Tips 3 - prova verktyget Tools->Shape Sketch för att rita upp figurer "manuellt" och sedan översätta ritningen till kod
 
 Upgiften bedöms både baserat på visad förståelse i kommentarerna i koden, samt på kvaliteten hos det färdiga uttrycket (t.ex. komplexitet, gestaltning, originalitet) 
 
 OBS! När ni lämnar in uppgiften ska ni zippa ihop hela mappen genom att välja Tools->archive sketch . Ni hittar mappen om ni väljer "Sketch"->"show sketch folder"
 
 OBS! Lös den här uppgiften enbart med hjälp av Processings inbyggda funktioner. (Dvs, utan externa bibliotek). 
 
 OBS! Varje rad kod ska kommenteras!!!
 
 Bonusutmaningar (ger tokens) - om ni får tid över, prova att översätta filen till javascript. Lägg i så fall till ett "mode" för javascript i menyn längst upp till höger. "Add Mode.."->"p5.js Mode". Växla mode och skriv om syntaxen (ersätt bla alla variabeltyper med var). 
 En annan bonusutmaning är att försöka köra programmet på en Androidtelefon. Lägg i så fall till "Android Mode" på samma sätt som ovan. Ni behöver då också ladda ner en Android SDK. Läs instruktioner på Processing-webben
 */
//float v = 0.0;//Deklarerar variabeln float v och ger den värdet 0.
//float vfart = 1;//Deklarerar variabeln vfart och ger den värdet 1.



float spacing;//Deklarerar variabeln spacing.
int kollumn;//Deklarerar variabeln kollumn.
int rad;//Deklarerar variabeln rad;
void setup () {
  noCursor();//Talar om för Processing att musen inte skall visas i fönstret.
  fullScreen();//Talar om för Processing att sketchen skall vara i fullskärmsstorlek. 
  spacing = 60;//Ger variabeln spacing ett värde.
  kollumn = int(width/spacing);//Ger variabeln kollumn värdet width/spacing. Detta värde sätter gränsen för hur många former som kan skapas i x-led.
  rad = int(height/spacing);//Ger variabeln rad värdet height/spacing. Detta värde sätter gränsen för hur många former som kan skapas i y-led.
}

void draw() {//deklarerar draw() metoden.
  background(random(65,70), random(165,170), 227);//Sätter bakgrunden till en skiftande nyans av ljusblått.
  //v += vfart;//En ekvation som räknar ut farten för rotationen i metoden ritaOchVrid.
  //här ska ni skriva era for-loopar som omsluter metodanropet
  for (int l = 0; l < kollumn; l++) {//En for loop som säger: Om variabeln int l är lika med 0, samt har ett lägre värde än variabeln kollumn, så skall int l inkrementeras.
    for (int j = 0; j < rad; j++) {//En for loop som säger: Om variabeln int j är lika med 0, samt har ett lägre värde än variabeln rad, så skall int j inkrementeras.
      art(l*spacing, j*spacing);//metoden art hämtas, variablerna int l och int j multpipleceras här med variabeln spacing. Detta berättar att bredden och höjden av uttrycket skall vara lika med höjden och bredden av fönstret genom att nullifera divisionen med variabeln spacing som skedde i setup(). för funktionen ritaOchVrid används även variabeln v som ett tredje värde.
    }
  }
}
void art(float x, float y) {//deklarerar metoden art(), samt hämter variablerna float x och float y som tar emot de numeriska värden som produceras i de dubbla for-looparna.
  PVector pos;//Deklarerar en ny PVector och döper den till pos.
  pos = new PVector(x, y);//Bestämmer att PVector pos skall använda värdena från x och y.
  PVector riktning;//Deklarear en ny PVector och döper den till riktning
  riktning = new PVector(mouseX, mouseY);//Bestämmer at PVector riktning skall vara en vektor mellan mouseX och MouseY, detta innebär att denna vektor alltid kommer följa musens position.
  riktning.sub(pos);//Subtraherar värdet av vektoren pos från PVector riktning. Differensen skapar en sorts gömd vektor mellan PVector pos och PVector riktning. Denna avgör i vilken riktning som kontrollpunkten i bezierkurvan kommer sträcka sig efter.
  riktning.mult(-1);//Multiplicerar PVector riktning med -1, detta leder till att pseudovektorn från differensen mellan PVector pos, och PVector riktning, kommer peka bort från PVector Riktning.
  pushMatrix();//pushMatrix skapar som ett eget koordinatsystem för varje kurva som ritas. Vilket innebär att det kan röra sig och placera sig i fönstret oberoende av varandra.
  translate(pos.x, pos.y);//Använder X och Y komponenterna av PVector pos för att avgöra positionen av kurvan i fönstret genom translate.
  riktning.normalize();//Förändrar vektorn riktnings längd så den är lika med 1. Utan att förändra vektorns riktning.
  riktning.mult(65);//Förändrar vektorns längd(men inte magnitud) till 50, men eftersom den har blivit normaliserad kan längden av det vi ser inte bli längre än 50.
  fill(random(65,70), random(165,170), 227);//Fyller kurvan med samma skiftande nyanser som bakgrunden.
  stroke(random(215,200),225,255);//Fyller kurvans linje med en skiftande nyans av ljust ljust blåvitt.
  strokeWeight(5); //Sätter strokeWeight till 5 pixlar.
  bezier(0,35,riktning.x,riktning.y,40,65, 60,35);//Ritar upp bezierkurvan som utgör vågorna i verket. Den andra kontrolpunkten i kurvan kontrolleras med PVector riktning.
  popMatrix();//popMatrix återställer translate värdet till 0,0 detta innebär att för varje kurva som ritas återställs koordinatsystemet till sin ursprungliga position för att sedan flyttas och läggas i Matrix-stapeln av pushMatrix.
}
/*void ritaEnGrej(float xpos, float ypos) {//Skapar metoden ritaEnGrej och deklarerar variablerna xpos, och ypos. Dessa tar emot uppgifter från for-looparna.
 
 rect(xpos, ypos, 100, 100);//ritar en rektangel med xpos och ypos som bestämmmer värdet.
 }*/
/*void ritaOchVrid(float x, float y, float r) {//Skapar metoden ritaOchVrid, samt tre variabler som tar emot värden från for-looparna.
 PVector pos;////Deklarerar en ny PVector och döper den till pos.
 pos = new PVector(x, y);//Bestämmer att PVector pos skall använda värdena från x och y.
 pushMatrix();//pushMatrix skapar som ett eget koordinatsystem för varje ruta som ritas. Vilket innebär att det kan röra sig och placera sig i fönstret oberoende av varandra.
 rectMode(CENTER); //Bestämmer att rutans x och y koordinater skall vara i rutans mitt.
 fill(33);//Bestämmer rutans färg.
 translate(pos.x, pos.y);//Använder X och Y komponenterna av PVector pos för att avgöra positionen av rutan i fönstret genom translate.
 rotate(radians(r));//roterar rutan med värdet ur variabeln r som konverteras från grader till radians genom funktionen radians().
 rect(0 ,0 , 20, 20);//ritar en kvadrat.
 popMatrix();//popMatrix återställer translate värdet till 0,0 detta innebär att för varje ruta som ritas återställs koordinatsystemet till sin ursprungliga position för att sedan flyttas och läggas i Matrix-stapeln av pushMatrix.
 }*/
//Här nedanför ska ni definiera en ny metod som tar tre parametrar: xpos, ypos, och rotate

/********************************************   
 Här nedan ska ni reflektera över uppgiften och även besvara några konkreta frågor  
 * Förklara varför det står void innan deklarationen av metoden ritaEngrej. Hade det kunnat stå något annat? Till exempel vad, och vad hade det inneburit?
 Termen void indikerar för processing att denna metod inte kommer resultera i ett returvärde, till skillnad från t.ex. int() ger ett returvärde i heltal. 
 Utöver detta skulle metoden kunna konverteras till ett objekt genom class funktionen. Dock skulle detta innebära att man byger flera metoder i sin class. Bland annat en kosntruktor, samt en funktion för att faktiskt rita upp objektet.
 
 
 
 * Förklara vad som är intressant med ert uttryck. Hur knyter det t.ex. an till andra uttryck från konst, film eller spel? Har ni inspirerats av något? Kan ni hitta ord eller begrepp som är lämpliga för att beskriva ert uttryck?
 Uttrycket jag ådstakom var designat för att interaktionen skulle vara integralt till hur verket upplevdes utav användra. Själva utrycket, vita vågor mot en ljusblå bakgrund var inspirerat minimalism och op art. Jag hittade ett sätt att ge bilden böljande vågor genom enbart färg och rörelse. 
 Men utöver detta vart jag inspirerad av de metoder som använts i spel med pixelgrafik för att simulera vatten. Ett par konkreta exempel skulle kunna hur hav och vattenfall representerats i Super Mario World, och Yoshi's Island till Game Boy Advanced. 
 
 
 * Reflektera kort över processen med uppgiften. Om ni körde fast, hur kom ni vidare? Har ni tittat i huvudsak på exempel, videotutorials, eller i boken? Vad hade ni problem med? Vad ägnade ni den mesta tiden åt?
 Uppgiften var ett utmärkt sätt att lära sig om positionering av objekt samt hur loopar fungerar. Utöver detta har jag fått flera kunskaper om mer komplicerade metoder för att räkna ut och bestämma position i processing. PVector formated har till exempel varit väldigt användbart för att manipulera position, och skapa en starkare interaktion.
 Jag körde delvis fast i hur jag ville utrycka mig, då jag hittat en rolig interaktiv metod så viste jag inte hur jag skulle skapa ett roligt utryck från den interaktiva metoden jag hittat. Jag löste detta genom att brainstorma lite för mig själv och bolla idéer med klasskamrater tills jag kom framt till att använda bezier kurvan för att skapa ett vågmönster.
 Utöver detta problem med inspiration så körde jag delvis fast på grund av att jag inte förstod exakt hur translate() och pushMatrix()/popMatrix() fungerade. Detta remiderade jag genom att läsa från boken, kolla på processings hemsida, samt följa några av Daniel Shiffmans tutorials på youtube.
 
 * Reflektera kort över kommentarer ni fick från designkritiken - vad har ni gjort för ändringar baserat på kritiken?
 Kritiken jag fick under kritikseminariet var överväldigande positivi, och jag fick intrycket av att mitt verk också var väldigt minnesvärt då flera av de som kritiserade min design nämnde att de lagt märke till den under den snabba utställningen från början av seminariumet.
 Den positiva kritiken handlade främst om att designen var harmonisk, minimialistiskt, och lugn. Flera upplevde även interaktion som tillfredställande.
 Den kritiken jag fick handlade främst om min interaktion, och hur flera kritiker efterfrågade en mer radikal förädnring när man rörde musen över vågorna. Förslag som att förändra färgen vid interaktion, eller göra vågorna större vid musrörelse.
 För att inkorporera denna kritik i min design valde jag att förändra skalan av pseudovektorn mellan PVector riktning och PVector pos för att göra rörelserna av vågorna mer dramatiska, samt så ändrade jag kurvornas längd och kontrollpunkter för att göra vågorna större.
 
 *******************************************/