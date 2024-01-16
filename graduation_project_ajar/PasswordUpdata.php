<?php

	include 'conn.php';
	include 'fin.php';
	
	$id = filterRequst("id");
    $pass = md5(filterRequst("password"));
	$passNew = md5(filterRequst("passwordnew"));

    
    $passDB = $connect->prepare("SELECT password FROM users WHERE ID = ?");
    $passDB->execute(array($id));
    $data = $passDB->fetch(PDO::FETCH_ASSOC);

    if($data["password"] == $pass){
        $Sele = $connect->prepare("UPDATE `users` SET `password`= ? WHERE ID = ?");
        $Sele->execute(array($passNew, $id));
        $count = $Sele->rowCount();

        if($count > 0) {
            echo json_encode(array("status" => "success"));
        }else {
            echo json_encode(array("status" => "fail"));
        }
    }else {
        echo json_encode(array("status" => "fail"));
    }
?>