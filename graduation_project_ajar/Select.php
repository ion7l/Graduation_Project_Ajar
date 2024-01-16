<?php

	include 'conn.php';
	include 'fin.php';
	
	$id = filterRequst("id");

	
	$Sele = $connect->prepare("SELECT name FROM users WHERE ID = ?");
	$Sele->execute(array($id));
    $data = $Sele->fetch(PDO::FETCH_ASSOC);

	if(count($data) > 0) {
		echo json_encode(array("status" => "success", "Data" => $data));
	}else {
		echo json_encode(array("status" => "fail"));
	}
?>