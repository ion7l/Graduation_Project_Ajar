<?php

	include 'conn.php';
	include 'fin.php';
	
	$id = filterRequst("id");

	
	$Sele = $connect->prepare("SELECT * FROM document WHERE ID = ?");
	$Sele->execute(array($id));
    $data = $Sele->fetch(PDO::FETCH_ASSOC);

    $SeleNameTenant = $connect->prepare("SELECT name FROM users WHERE ID = ?");
	$SeleNameTenant->execute(array($data["Id_user_tenant"]));
    $dataNameTenant = $SeleNameTenant->fetch(PDO::FETCH_ASSOC);

    $SeleNameLessor= $connect->prepare("SELECT name FROM users WHERE ID = ?");
	$SeleNameLessor->execute(array($data["Id_user_lessor"]));
    $dataNameLessor = $SeleNameLessor->fetch(PDO::FETCH_ASSOC);

	if(count($data) > 0) {
		echo json_encode(array("status" => "success", "Data" => $data, "DataTenant" => $dataNameTenant, "DataLessor" => $dataNameLessor));
	}else {
		echo json_encode(array("status" => "fail"));
	}
?>