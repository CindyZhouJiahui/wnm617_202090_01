<?php
include "./phps.php";
session_start();
$type = $_POST['type'];
$phps = new phps();

if(!isset($_SESSION['username'])){
    $rt = [
        "code" => -1,
        "msg" => "error",
        "data" => ""
    ];
    echo json_encode($rt);
    die;
}
switch ($type)
{
    case "edit_pass":
        echo $phps->edit_pass();
        break;
    case "edit_info":
        echo $phps->edit_info();
        break;
    case "addEif":
        echo $phps->addEif();
        break;
    case "editEif":
        echo $phps->editEif();
        break;
    case "getList":
        $types = $_POST['types'];
        echo $phps->getList($types);
        break;
    case "search":
        $search = $_POST['search'];
        echo $phps->search($search);
        break;
    case "show":
        $id = $_POST['id'];
        echo $phps->show($id);
        break;
    case "del":
        $id = $_POST['id'];
        echo $phps->del($id);
        break;
    default:
        $rt = [
            "code" => 0,
            "msg" => "error"
        ];
        echo json_encode($rt);
        break;
}