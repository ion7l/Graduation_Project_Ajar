<?php

	include 'conn.php';
	include 'fin.php';
	
	$id = filterRequst("idItem");

	
    $Sele = $connect->prepare("SELECT * FROM porducts WHERE ID = ?");
    $Sele->execute(array($id));
    $data = $Sele->fetch(PDO::FETCH_ASSOC);

	if(count($data) > 0) {
		echo json_encode(array("status" => "success" ,"Data" => $data));
	}else {
		echo json_encode(array("status" => "fail"));
	}
?>