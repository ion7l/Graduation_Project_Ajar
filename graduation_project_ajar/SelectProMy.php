<?php

	include 'conn.php';
	include 'fin.php';
	
	$id = filterRequst("id");

	
	$Sele = $connect->prepare("SELECT ID, name, description, price, pahtImg FROM porducts WHERE idUser = ? and condit = 0");
	$Sele->execute(array($id));
    $data = $Sele->fetchAll(PDO::FETCH_ASSOC);

	if(count($data) > 0) {
		echo json_encode(array("Data" => $data));
	}else {
		echo json_encode(array("status" => "fail"));
	}
?>