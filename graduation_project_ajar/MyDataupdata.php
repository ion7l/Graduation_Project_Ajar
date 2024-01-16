<?php

	include 'conn.php';
	include 'fin.php';
	
	$id = filterRequst("id");
	$name = filterRequst("name");

	
	$Sele = $connect->prepare("UPDATE `users` SET `name`= ? WHERE ID = ?");
	$Sele->execute(array($name, $id));
    $count = $Sele->rowCount();

    if($count > 0) {
		echo json_encode(array("status" => "success"));
	}else {
		echo json_encode(array("status" => "fail"));
	}
?>