<!DOCTYPE html>
<html lang="sv">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Superpartiet</title>
    <link href="https://fonts.googleapis.com/css?family=Bungee+Shade" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway:900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel="stylesheet" href="DataTables/datatables.min.css">
    <!-- CSS för datatables valideras inte som korrekt, stil.css valideras som korrekt -->
    <link rel="stylesheet" href="stil.css">
    <script src="jquery-3.2.0.min.js"></script>
    <script src="DataTables/datatables.min.js"></script>
    <script>

           $(document).ready(function() {
    $('#table').DataTable( {
        "order": [[ 2, "desc" ]]
    } );
} );
    </script>
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
        <li><a href="index.php">Startsida</a></li>
    </ul>
</nav>
<article>
<div>
    <header><h2>Partiet</h2></header>
    <section>
    <h3>Partimedlemmar</h3>
        <table id="table" class="display">
    <?php
    require('db.php');
        //SQL fråga som hämtar all information från databasen namnlista.
        $sql = "SELECT * FROM namnlista";
        //Kontrollerar att teckentabellen hittas och att databasen ansluts till korrekt. Om inte visas ett felmedelande.
        if (!$mysqli->set_charset("utf8")) {
            echo "Teckentabell kunde inte ställas in utf8:%s\n". $mysqli->error;
        }
        if ($mysqli->connect_errno) {
            echo "Kunde inte ansluta till MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
        }
            
        //En lyckad SQL-fråga ställs mot databasen och lagras.    
        $result = $mysqli->query($sql);
        echo "<thead><tr>";
            
        //Funktionen mysqli_num_fields räknar antallet kolummer i tabellen, for-loopen genererar sedan nya kollumer i html-tabellen med samma namn som kollumen i databastabellen med hjälp av funktionen mysqli_fetch_field_direct.
        for ($i=0; $i < mysqli_num_fields($result); $i++)     {
            echo "<th>" . 
            mysqli_fetch_field_direct($result, $i)->name ."</th>";
            }
            echo "<th></th><th></th>";
            echo "</tr></thead><tbody>";
            
            //Nya rader i tabllen läggs till genom att hämta poster från databasen.
        while($myRow = $result->fetch_array()) {
            echo "<tr>";
            echo "<td>" . $myRow['Personnummer'] . "</td>";
            echo "<td>" . $myRow['Förnamn'] . "</td>";
            echo "<td>" . $myRow['Efternamn'] . "</td>";
            
            //Samtidigt som posterna från databasen skrivs ut skapas querystring-länkar med databasen PRIMARY KEY för databasen 'namnlista'.
            echo "<td><a href='andra.php?pnumr=" . $myRow['Personnummer'] . "'>Ändra</a></td>";
            echo "<td><a href='radera.php?pnumr=" . $myRow['Personnummer'] . "'>Radera</a></td>";
            echo "</tr>";
            }
            echo "</tbody>";
    
            ?>
        </table>
    </section>
    <section>
        <h3>Våra ideal</h3>
        <div class="center">
        <table>
             <?php
    require('db.php');

        $sql = "SELECT * FROM ideal";
    
        if (!$mysqli->set_charset("utf8")) {
            echo "Teckentabell kunde inte ställas in utf8:%s\n". $mysqli->error;
        }
        if ($mysqli->connect_errno) {
            echo "Kunde inte ansluta till MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
        }
        $result = $mysqli->query($sql);
            echo "<thead><tr>";
            echo "<th></th>";
            echo "</tr></thead><tbody>";
            
         while($myRow = $result->fetch_array()) {
            echo "<tr>";
            echo "<td>" . $myRow['Ideal'] . "</td>";
            echo "</tr>";
         }
            echo "</tbody>";
            ?>
        </table>
        </div>
    </section>
    </div>
</article>
<aside>
    <header><h2>Engagera dig!</h2></header>
    <section>
    <h3>Bli medlem</h3>    
        <?php
                require('db.php');
	   if (!$mysqli->set_charset("utf8")) {
    	echo "Fel vid inställning av teckentabell utf8: %s\n". $mysqli->error;
	}

	if ($mysqli->connect_errno) {
	    echo "Misslyckades att ansluta till MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
	}

	if(isset($_POST['spara'])){

		// Hämta in värden från formulär med hjälp av POST.
        $pnumr = $_POST['pnumr'];
		$fnamn = $_POST['fnamn'];
		$enamn = $_POST['enamn'];
        
		//Fråga som skapar nya databaskollumer och ger dem samma värden som variablerna $pnumr, $fnamn, och $enamn.
		$sql = "INSERT INTO namnlista (Personnummer,Förnamn,Efternamn) VALUES ('$pnumr','$fnamn','$enamn')";

		//SQL-frågan körs och ett medelande om att en ny person lagts till i databasen skrivs ut.
		$mysqli->query($sql);
		echo "Tack för ditt engageman då är nu medlem i Superpartiet!<br>";
	}
		?>
        <form action="index.php" method="post">
        Förnamn<br><input type="text" name="fnamn"><br>
        Efternamn<br><input type="text" name="enamn"><br>
        Personnummer<br><input type="text" name="pnumr"><br>
        <input type="submit" name="spara" value="Gå med">
        </form>
    </section>
    <section>
    <h3>Pågående uppdrag:</h3>
        <ul>
            <li><h4>Pride 2017</h4></li>
            <li><h4>Befria datorerna</h4></li>
            <li><h4>Valet 2018</h4></li>
            <li><h4>EU valet 2019</h4></li>
        </ul>
    </section>
        </aside>
    </main>
    </body>
</html>