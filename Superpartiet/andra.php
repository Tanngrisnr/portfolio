<!DOCTYPE html>
<html lang="sv">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link href="https://fonts.googleapis.com/css?family=Bungee+Shade" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Raleway:900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
        <link rel="stylesheet" href="stil.css">
        <title>Ändra namn</title>
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
    <header><h2>Ändra namn</h2></header>
<div>
    <section>
<?php
    
    require('db.php');
    
    if (!$mysqli->set_charset("utf8")) {
    	echo "Fel vid inställning av teckentabell utf8: %s\n". $mysqli->error;
    }
	if ($mysqli->connect_errno) {
	    echo "Misslyckades att ansluta till MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
	}
    if(isset($_POST['spara'])){
        $pnumr = $_GET['pnumr'];
        $fnamn = $_POST['fnamn'];
        $enamn = $_POST['enamn'];
        
        $sql = "UPDATE namnlista SET Förnamn='$fnamn', Efternamn='$enamn' WHERE Personnummer=$pnumr";
        
        $mysqli->query($sql);
        
        echo "Namnet är nu ändrat<br>";
    }
    else {
        //När sidan laddas innan användaren ändrat Förnamn eller Efternamn hämtas querystring-informationen till variabeln $pnumr från tabelllänken i index.php.
        $pnumr = $_GET['pnumr'];
        
        //information för namnet som skall ändras hämtas med hjälp av variabeln $pnumr som korresponderar med ett av värdena i databastabellens PRIMARY KEY Personnummer.
        $sql = "SELECT * FROM namnlista WHERE Personnummer=$pnumr";
        
        $result = $mysqli->query($sql);
        
        $myRow = $result->fetch_array();
    }
?>
        <!--genom $myRow variabeln ekas information från databaskollumerna Förnamn och Efternamn ut i input type="text" fälten för att ändras av användaren. -->
    <form action="andra.php?pnumr=<?php echo $pnumr ?>" method="post">
        <h3>Ändra förnamn</h3>
        <input type="text" name="fnamn" value="<?php echo $myRow[1]; ?>"><br>
        <h3>Ändra Efternamn</h3>
        <input type="text" name="enamn" value="<?php echo $myRow[2]; ?>"><br>
        <input type="submit" name="spara" value="Spara ändringar"><br>
    <a href="index.php">Tillbaka till namnlistan</a>
    </form>
    </section>
    </div>
    </article>
    </main>
    </body>
</html>