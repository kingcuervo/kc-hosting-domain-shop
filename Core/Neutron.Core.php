<?php error_reporting(0);
require "classes/Neutron.Configuration.php";
require "Neutron.Config.php";
require "classes/Neutron.MySQL.php";
require "classes/Neutron.Users.php";
require "classes/Neutron.Catalogue.php";
require "classes/Neutron.Services.php";
require "classes/Neutron.Support.php";
require "classes/Neutron.Templates.php";
$MysqlDb->connect('localhost','pgmca','pgm082013','pgm');
session_start();
?>