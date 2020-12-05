<?php

        if($_FILES["img"]["name"]) {
            $allowedExts = array("gif", "jpeg", "jpg", "png");
            $temp = explode(".", $_FILES["img"]["name"]);
            $extension = end($temp);
            if ((($_FILES["img"]["type"] == "image/gif")
                    || ($_FILES["img"]["type"] == "image/jpeg")
                    || ($_FILES["img"]["type"] == "image/jpg")
                    || ($_FILES["img"]["type"] == "image/pjpeg")
                    || ($_FILES["img"]["type"] == "image/x-png")
                    || ($_FILES["img"]["type"] == "image/png"))
                && ($_FILES["img"]["size"] < 204800000)
                && in_array($extension, $allowedExts)) {
                if ($_FILES["img"]["error"] > 0) {
                    $rt = [
                        "code" => 0,
                        "msg" => "error：: " . $_FILES["file"]["error"],
                        "data" => ""
                    ];
                    echo json_encode($rt);
                    return;
                } else {
                    $img = "upload/" . time() . "." . $extension;
                    move_uploaded_file($_FILES["img"]["tmp_name"], $img);

                    $rt = [
                        "code" => 1,
                        "msg" => "success",
                        "data" => $img
                    ];
                    echo json_encode($rt);
                    return;
                }
            } else {
                $rt = [
                    "code" => 0,
                    "msg" => "Illegal file format",
                    "data" => ""
                ];
                echo json_encode($rt);
                return;
            }
        }

?>