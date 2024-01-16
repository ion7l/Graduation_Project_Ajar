<?php

	include 'conn.php';
	include 'fin.php';
	
	$name = filterRequst("name");
    $descrep = filterRequst("descrep");
    $type = filterRequst("type");
    $loc = filterRequst("loc");
    $prise = filterRequst("prise");
    $idUser = filterRequst("idUser");


    $imagename = imageUpload("file");

	if($imagename != 'fail') {
		$stmt = $connect->prepare("INSERT INTO `porducts`(`name`, `description`, `type`, `region`, `price`, `pahtImg`, `idUser`) VALUES (?,?,?,?,?,?,?)");
		$stmt->execute(array($name, $descrep, $type, $loc, $prise, $imagename, $idUser));

		$count = $stmt->rowCount();

		if($count > 0) {
			echo json_encode(array("status" => "success"));
		}
		else {
			echo json_encode(array("status" => "fail"));
		}
	}
	else {
		echo json_encode(array("status" => "inTo"));
	}
?>