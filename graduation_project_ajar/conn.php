<?php

$dsn = "mysql:host=localhost;dbname=ajar";
$user = "root";
$pass = "";
$option = array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8");

try{
	$connect = new PDO($dsn, $user, $pass, $option);
	$connect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}catch(PDOException $e){
	echo $e->getMessage();
}
