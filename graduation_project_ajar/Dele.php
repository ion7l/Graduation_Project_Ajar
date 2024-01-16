<?php

	include 'conn.php';
	include 'fin.php';
	
	$id = filterRequst("id");
    $img = $connect->prepare("SELECT pahtImg FROM porducts WHERE ID = ?");
    $img->execute(array($id));
    $data = $img->fetch(PDO::FETCH_ASSOC);

	
    $Sele = $connect->prepare("DELETE FROM porducts WHERE ID = ?");
    $Sele->execute(array($id));
    $count = $Sele->rowCount();

	if($count > 0) {
        unlink("upload/".$data["pahtImg"]);
		echo json_encode(array("status" => "success"));
	}else {
		echo json_encode(array("status" => "fail"));
	}
?>