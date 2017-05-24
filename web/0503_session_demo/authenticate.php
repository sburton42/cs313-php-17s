<?php
session_start();


$username = htmlspecialchars($_POST["username"]);
$password = $_POST["password"];

if ($password == "5678") {
	$_SESSION["username"] = $username;
	echo "correct password";
	header("Location: home.php");
	die();
} else {
	header("Location: login.php");
	die();
}


