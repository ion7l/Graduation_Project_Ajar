<?php

	include 'conn.php';
	include 'fin.php';
	
    $idItme = filterRequst("idItme");
	$name = filterRequst("nameItme");
	$idLessor = filterRequst("idUserLessor");
	$idTenant = filterRequst("idUserTenant");

    $stmt = $connect->prepare("INSERT INTO `document`(`Id_Item`, `name`, `Id_user_lessor`, `Id_user_tenant`) VALUES (?,?,?,?)");
    $stmt->execute(array($idItme, $name, $idLessor, $idTenant));

    $count = $stmt->rowCount();

    if($count > 0) {
        $Update = $connect->prepare("UPDATE `porducts` SET `condit`= 1 WHERE ID = ?");
        $Update->execute(array($idItme));
        echo json_encode(array("status" => "success"));
    }
    else {
        echo json_encode(array("status" => "fail"));
    }
?>