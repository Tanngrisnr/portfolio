<!DOCTYPE html>
<html lang="sv">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Bungee+Shade" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway:900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel="stylesheet" href="stil.css">
    <title>Radera</title>
    </head>
<body>
<header><h1>Superpartiet</h1></header>
<main>
<nav>
    <header><h2>Om denna sida</h2></header>
    <ul>
        <li><a href="style.html">Front-end Style Guide</a></li>
        <li><a href="http://validator.w3.org/check/referer">Validera HTML</a></li>
        <li><a href="http://jigsaw.w3.org/css-validator/check/referer"> Validera CSS</a></li>
    </ul>
</nav>
<article>
    <header><h2>Gå ur partiet</h2></header>
<div>
    <section>
<?php
require('db.php');
    
    if (!$mysqli->set_charset("utf8")) {
        echo "Teckentabell kunde inte ställas in utf8:%s\n". $mysqli->error;
}
    if ($mysqli->connect_errno) {
        echo "Kunde inte ansluta till MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}
 //Hämtar uppgifter om användare svarat ja i formuläret.
    if(isset($_POST['ja'])){
        $pnumr = $_GET['pnumr'];
        
        //sql-fråga för själva raderingen
        $sql = "DELETE FROM namnlista WHERE Personnummer=$pnumr";
        
        //sqlfråga körs och tabellen med Personnummer=$pnumr som PRIMARY KEY raderas från databasen.
        $mysqli->query($sql);
        
        echo "Namnet är raderat från listan.";
        echo "<a href='index.php'>Tillbaka till listan</a>";
    }
    //Hämtar information om användaren svarar nej i formuläret.
    elseif(isset($_POST['nej'])) {
        //Inga ändringar görs till databasen och användaren ombeds återvända till startsidan
        echo "Radering avbruten.";
        echo "<a href='index.php'>Tillbaka till startsida</a>";
    }
    
    else {
        //När sidan laddas innan användaren klickat på Ja eller Nej hämtas querystring-informationen till variabeln $pnumr från tabelllänken i index.php.
        $pnumr = $_GET['pnumr'];
        
        //Informationen från variabeln $pnumr används för att hämta information från tabellen 'namnlista ' i kollumerna 'Förnamn' och 'Efternamn'.
        $sql = "SELECT Förnamn, Efternamn FROM namnlista WHERE Personnummer=$pnumr";
        
        //sql frågan körs och informationen från tabellkollumerna 'Förnamn' och 'Efternamn' för att informera användaren om vilken person som kommer tas bort från listan om de svarar Ja i formuläret.
        $result = $mysqli->query($sql);
        $myRow = $result->fetch_array();
        echo "<header><h2>" . $myRow['Förnamn'] . " " . $myRow['Efternamn'] . "</h2></header>";
        echo "Är du säker på att du vill gå ur partiet?<br>";
            
    }
?>
    <form action="radera.php?pnumr=<?php echo $pnumr ?>" method="post">
        <input type="submit" name="ja" value="Ja">
        <input type="submit" name="nej" value="Nej">
    </form>
    </section>
</div>
</article>
</main>
    </body>
</html>