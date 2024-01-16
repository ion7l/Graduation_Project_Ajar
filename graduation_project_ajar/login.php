<?php

	include 'conn.php';
    include 'fin.php';
	
	$email = filterRequst("email");
	$pass = md5(filterRequst("pass"));
	
	$stmt = $connect->prepare("SELECT ID FROM `users` WHERE `password` = ? AND `email` = ?");
	$stmt->execute(array($pass, $email));
    $conut = $stmt->rowCount();

    if($conut > 0){
        $Sele = $connect->prepare("SELECT ID FROM users WHERE email = ?");
        $Sele->execute(array($email));
        $data = $Sele->fetch(PDO::FETCH_ASSOC);
        echo json_encode(array("status" => "success", "Data" => $data));
    }else{
        echo json_encode(array("status" => "fail"));
    }
?>