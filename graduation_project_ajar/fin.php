<?php
define("MB", 1048576);

function filterRequst($requstname){
    return htmlspecialchars(strip_tags($_POST[$requstname]));
}

function imageUpload($imageRequest){
    global $msgError;
    $imagename = rand(1, 10000) . $_FILES[$imageRequest]['name'];
    $imagetmp = $_FILES[$imageRequest]['tmp_name'];
    $imagesize = $_FILES[$imageRequest]['size'];
    $allowEXt = array("jpg", "png");
    $strToArray = explode(".", $imagename);
    $ext = end($strToArray);
    $ext = strtolower($ext);
    if(!empty($imagename) && !in_array($ext, $allowEXt)){
        $msgError[] = "Ext";

    }
    if($imagesize > 7 * MB){
        $msgError[] = "size";
    }
    if(empty($msgError)){
        move_uploaded_file($imagetmp, "upload/" . $imagename);
        return $imagename;
    }
    else{
        return "fail";
    }
}
?>