<?php

	include 'conn.php';
	include 'fin.php';
	
	$name = filterRequst("name");
	$email = filterRequst("email");
	$pass = md5(filterRequst("pass"));
	

	
	$Sele = $connect->prepare("SELECT email FROM users WHERE email = ?");
	$Sele->execute(array($email));
    $data = $Sele->fetch(PDO::FETCH_ASSOC);

	if(count($data) <= 0) {
		$stmt = $connect->prepare("INSERT INTO `users`(`name`, `email`, `password`) VALUES (?,?,?)");
		$stmt->execute(array($name, $email, $pass));

		$count = $stmt->rowCount();

		if($count > 0) {
			$Sele = $connect->prepare("SELECT ID FROM users WHERE Email = ?");
			$Sele->execute(array($email));
			$data = $Sele->fetch(PDO::FETCH_ASSOC);
			echo json_encode(array("status" => "success", "Data" => $data));
		}
		else {
			echo json_encode(array("status" => "fail"));
		}
	}
	else {
		echo json_encode(array("status" => "inTo"));
	}
?>