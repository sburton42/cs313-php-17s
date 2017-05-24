<?php

$movie = htmlspecialchars($_GET['movie']);


$user = 'the_critic';
$pass = 'password1';
$dbName = 'movies';
$dbHost = 'localhost';
$dbPort = '5432';

try {
	$db = new PDO("pgsql:host=$dbHost;port=$dbPort;dbname=$dbName", $user, $pass);
	$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

} catch (PDOException $ex) {
	echo "Error connecting to the db. Details: $ex";
	die();

}

//$query = 'SELECT name, birthday, pictureUrl FROM actor';

$query = 'SELECT name, birthday, pictureUrl FROM actor a INNER JOIN movieActor ma ON a.id = ma.actorId INNER JOIN movie m ON m.id = ma.movieId WHERE m.title = :movie_title';

$statement = $db->prepare($query);
$statement->bindValue(":movie_title", $movie, PDO::PARAM_STR);
$statement->execute();

$results = $statement->fetchAll(PDO::FETCH_ASSOC);


?><!DOCTYPE html>
<html>
<head>
	<title>Actors</title>
</head>
<body>
	<h1>Actors for movie <?php echo $movie; ?></h1>

	<ul>
	<?php
		foreach ($results as $row) {
			echo "<li><p>" . $row['name'] . "</p></li>";
		}
	?>
	</ul>


</body>
</html>





