<?php

	include 'conn.php';
	include 'fin.php';
	
	$id = filterRequst("id");

	
	$Sele = $connect->prepare("SELECT * FROM document WHERE Id_user_lessor = ? or Id_user_tenant = ?");
	$Sele->execute(array($id, $id));
    $data = $Sele->fetchAll(PDO::FETCH_ASSOC);

	if(count($data) > 0) {
		echo json_encode(array("Data" => $data));
	}else {
		echo json_encode(array("status" => "fail"));
	}
?>