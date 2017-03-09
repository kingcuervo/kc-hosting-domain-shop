<?php error_reporting(0);
class Users
{
	static $users = array();
	public static function verification($data) {
	$sqlCode = "SELECT * FROM `users` WHERE `username` LIKE"." "."'".$_POST["username"]."'"." "."AND  `password` LIKE"." "."'".md5($_POST["password"])."'";
	$query = mysql_query($sqlCode) or die (mysql_error());
	$userQuery = mysql_fetch_assoc($query);
	session_start();
	$_SESSION["username"] = $userQuery[$data];
	header("Location: index.php");
	}
	}
class UserDetails
{
	static $userdetails = array();
	public static function get($data) {
	$sqlCode = "SELECT * FROM `users` WHERE `username` LIKE"." "."'".$_SESSION["username"]."'";
	$query = mysql_query($sqlCode) or die (mysql_error());
	$userQuery = mysql_fetch_assoc($query);
	echo $userQuery[$data];
	}
	}
?>