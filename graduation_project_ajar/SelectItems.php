<?php

	include 'conn.php';
	include 'fin.php';
	
	$Sel = filterRequst("Sel");

	
	if($Sel === "*"){
        $Sele = $connect->prepare("SELECT ID, name, type, region, price, pahtImg FROM porducts WHERE condit = 0");
        $Sele->execute(array());
        $data = $Sele->fetchAll(PDO::FETCH_ASSOC);
    }
    else{
        $Sele = $connect->prepare("SELECT ID, name, type, region, price, pahtImg FROM porducts WHERE type = ? and condit = 0");
        $Sele->execute(array($Sel));
        $data = $Sele->fetchAll(PDO::FETCH_ASSOC);
    }

	if(count($data) > 0) {
		echo json_encode(array("Data" => $data));
	}else {
		echo json_encode(array("status" => "fail"));
	}
?>