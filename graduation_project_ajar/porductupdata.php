<?php

	include 'conn.php';
	include 'fin.php';
	
	$name = filterRequst("name");
    $descrep = filterRequst("descrep");
    $type = filterRequst("type");
    $loc = filterRequst("loc");
    $prise = filterRequst("prise");
    $id = filterRequst("id");


    if(!empty($_FILES['file'])){
        $imagename = imageUpload("file");
    }
    else{
        $imagename = 'fail';
    }

	if($imagename != 'fail') {
		$img = $connect->prepare("SELECT pahtImg FROM porducts WHERE ID = ?");
		$img->execute(array($id));
		$data = $img->fetch(PDO::FETCH_ASSOC);
		$stmt = $connect->prepare("UPDATE `porducts` SET `name`= ?,`description`= ?,`type`= ?,`region`= ?,`price`= ?,`pahtImg`= ? WHERE ID = ?");
		$stmt->execute(array($name, $descrep, $type, $loc, $prise, $imagename, $id));

		$count = $stmt->rowCount();

		if($count > 0) {
			unlink("upload/".$data["pahtImg"]);
			echo json_encode(array("status" => "success"));
		}
		else {
			echo json_encode(array("status" => "fail"));
		}
	}
	else {
		$stmt = $connect->prepare("UPDATE `porducts` SET `name`= ?,`description`= ?,`type`= ?,`region`= ?,`price`= ? WHERE ID = ?");
		$stmt->execute(array($name, $descrep, $type, $loc, $prise, $id));

		$count = $stmt->rowCount();

		if($count > 0) {
			echo json_encode(array("status" => "success"));
		}
		else {
			echo json_encode(array("status" => "fail"));
		}
	}
?>