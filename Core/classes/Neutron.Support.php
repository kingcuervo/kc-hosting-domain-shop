<?php error_reporting(0);
class Database
{
	static $database = array();
	public static function get($page,$data) {
	$sqlCode = "SELECT * FROM `pages` WHERE `page` LIKE"." "."'".$page."'";
	$query = mysql_query($sqlCode) or die (mysql_error());
	$dataQuery = mysql_fetch_assoc($query);
	echo $dataQuery[$data];
	}
	}
?>