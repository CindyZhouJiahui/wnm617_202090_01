<?php
session_start();
include "./phps.php";

$usernames = $_POST['username'];
$email = $_POST['email'];
$passwords = md5($_POST['password']);

$phps = new phps();

$sql = "select * from user_tracking where username = \"$usernames\"";
$result = $phps->db->query($sql);
$is =  mysqli_fetch_array($result, MYSQLI_ASSOC);
if($is){
    $rt = [
        "code" => 0,
        "msg" => "username has been registered, please change to another username"
    ];
    echo json_encode($rt);
    return;
}

$sql = "INSERT INTO user_tracking ( username, email, password )
                       VALUES
                       ( \"$usernames\", \"$email\", \"$passwords\" )";

$result = $phps->db->query($sql);

if ($result) {
    $rt = [
        "code" => 1,
        "msg" => "success"
    ];
    
    echo json_encode($rt);
    return;
}else{
    $rt = [
        "code" => 0,
        "msg" => "error"
    ];
    echo json_encode($rt);
    return;
}

?>