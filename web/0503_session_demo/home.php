<?php

session_start();

if (!isset($_SESSION["username"])) {
	header("Location: login.php");
	die();
}

$username = htmlspecialchars($_SESSION["username"]);

?>

<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
</head>
<body>

<?php
echo "<h1>Welcome $username</h1>";
?>

</body>
</html>