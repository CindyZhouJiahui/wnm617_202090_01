<?php
include "./phps.php";

session_start();

if(isset($_SESSION['username'])){
    $rt = [
        "code" => 1,
        "msg" => "Login successful"
    ];
    echo json_encode($rt);
    return;
}
if(!$_POST){
    $rt = [
        "code" => 0,
        "msg" => "error"
    ];
    echo json_encode($rt);
    return;
}

$usernames = $_POST['username'];
$passwords = md5($_POST['password']);

$phps = new phps();

$sql = "select * from user_tracking where username = \"$usernames\" and password = \"$passwords\"";
$result = $phps->db->query($sql);
$is =  mysqli_fetch_array($result, MYSQLI_ASSOC);

if(!$is){
    $rt = [
        "code" => 0,
        "msg" => "Wrong countant or password"
    ];
    echo json_encode($rt);
    return;
}

$rt = [
    "code" => 1,
    "msg" => "Login successful"
];
$_SESSION['username'] = $is["username"];
echo json_encode($rt);
return;

?>