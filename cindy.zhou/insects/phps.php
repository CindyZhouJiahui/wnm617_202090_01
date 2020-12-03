<?php


class phps
{
    public $servername = "127.0.0.1";
    public $username = "insects";
    public $password = "insects";
    public $dbname = "insects_sql";
    public $db;

    public function __construct()
    {
        #Connect to database
        $this->db = new mysqli($this->servername,$this->username,$this->password,$this->dbname);
        $this->db->query("SET NAMES UTF8");
    }

    public function getUser(){
        $usernames = $_SESSION['username'];
        $sql = "select * from user_tracking where username = \"$usernames\"";
        $result = $this->db->query($sql);
        $user =  mysqli_fetch_array($result, MYSQLI_ASSOC);

        return $user;
    }

    public function setUser(){
        if($_POST){
            $id = $_POST["id"];
            $nickname = $_POST["nickname"];
            $head = $_POST["head"];
            $age = $_POST["age"];
            $sex = $_POST["sex"];

            $sql = "UPDATE user_tracking SET nickname='".$nickname."', head='".$head."', age= '".$age."', sex= '".$sex."' WHERE id=".$id;

            $result = $this->db->query($sql);

            if ($result) {
                $rt = [
                    "code" => 1,
                    "msg" => "success",
                    "data" => ""
                ];
                echo json_encode($rt);
                die;
            }else{
                $rt = [
                    "code" => 0,
                    "msg" => "error",
                    "data" => ""
                ];
                echo json_encode($rt);
                die;
            }
        }
    }

    public function addEif(){
        if($_POST){
            $img = $_POST["img"];
            $title = $_POST["title"];
            $des = addslashes($_POST["des"]);
            $coordinate = $_POST["coordinate"];
            $characters = $_POST["characters"];
            $types = $_POST["types"];

            $conn = mysqli_connect($this->servername, $this->username, $this->password, $this->dbname);
            $sql = "INSERT INTO insect_tracking ( title, img, des, types, characters )
                        VALUES
                        ( '$title', '$img', '$des', '$types', '$characters' )";
            $result = mysqli_query($conn, $sql);

            if ($result) {
                $id = mysqli_insert_id($conn);
                $sql = "INSERT INTO trancking_location ( insect_tracking_id, coordinate)
                        VALUES
                        ( '$id', '$coordinate')";
                mysqli_query($conn, $sql);

                $rt = [
                    "code" => 1,
                    "msg" => "success",
                    "data" => ""
                ];
                return json_encode($rt);
            }else{
                $rt = [
                    "code" => 0,
                    "msg" => "error",
                    "data" => ""
                ];
                return json_encode($rt);
            }
        }else{
            $rt = [
                "code" => 0,
                "msg" => "error",
                "data" => ""
            ];
            return json_encode($rt);
        }
    }

    public function getList($types){
        $conn = mysqli_connect($this->servername, $this->username, $this->password, $this->dbname);

        if($types){
            $sql = "SELECT * FROM insect_tracking where types like '%$types%'";
        }else{
            $sql = "SELECT * FROM insect_tracking";
        }

        $result = mysqli_query($conn, $sql);
        mysqli_close($conn);

        $data = [];
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $data[] = $row;
            }
        }

        if ($result) {
            $rt = [
                "code" => 1,
                "msg" => "success",
                "data" => $data
            ];
            return json_encode($rt);
        }else{
            $rt = [
                "code" => 0,
                "msg" => "error",
                "data" => ""
            ];
            return json_encode($rt);
        }
    }

    public function show($id){
        $sql = "select * from insect_tracking where id = '$id'";
        $result = $this->db->query($sql);
        $is =  mysqli_fetch_array($result, MYSQLI_ASSOC);

        if($is){
            $rt = [
                "code" => 1,
                "msg" => "success",
                "data" => $is
            ];
            return json_encode($rt);
        }else{
            $rt = [
                "code" => 0,
                "msg" => "error",
                "data" => ""
            ];
            return json_encode($rt);
        }
    }

    public function del($id){
        $sql = "DELETE FROM insect_tracking
	        WHERE id = ".$id;
        $result = $this->db->query($sql);

        if($result){
            $rt = [
                "code" => 1,
                "msg" => "success",
                "data" => ""
            ];
            return json_encode($rt);
        }else{
            $rt = [
                "code" => 0,
                "msg" => "error",
                "data" => ""
            ];
            return json_encode($rt);
        }
    }

    public function edit(){
        if($_POST){
            $id = $_POST["id"];
            $img = $_POST["img"];
            $title = $_POST["title"];
            $des = $_POST["des"];
            $coordinate = $_POST["coordinate"];
            $types = $_POST["types"];

            $sql = "UPDATE insect_tracking SET img='".$img."', title='".$title."', des= '".$des."', coordinate= '".$coordinate."', types= '".$types."' WHERE id=".$id;

            $result = $this->db->query($sql);

            if ($result) {
                $rt = [
                    "code" => 1,
                    "msg" => "success",
                    "data" => ""
                ];
                echo json_encode($rt);
                die;
            }else{
                $rt = [
                    "code" => 0,
                    "msg" => "error",
                    "data" => ""
                ];
                echo json_encode($rt);
                die;
            }
        }
    }

    public function search($search){
        $conn = mysqli_connect($this->servername, $this->username, $this->password, $this->dbname);

        $sql = "SELECT it.*, tl.coordinate FROM insect_tracking it 
                    LEFT JOIN trancking_location tl ON it.id = tl.insect_tracking_id AND it.title LIKE  '%$search%'";

        $result = mysqli_query($conn, $sql);
        mysqli_close($conn);

        $data = [];
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                $data[] = $row;
            }
        }

        if ($result) {
            $rt = [
                "code" => 1,
                "msg" => "success",
                "data" => $data
            ];
            return json_encode($rt);
        }else{
            $rt = [
                "code" => 0,
                "msg" => "error",
                "data" => ""
            ];
            return json_encode($rt);
        }
    }

    public function edit_pass(){
        $old_password = $_POST['old_password'];
        $new_password = $_POST['new_password'];

        $user = $this->getUser();
        if($user["password"] !== md5($old_password)){
            $rt = [
                "code" => 0,
                "msg" => "Password error"
            ];
            return json_encode($rt);
        }

        $sql = "UPDATE user_tracking SET password='".md5($new_password)."' WHERE id=".$user["id"];
        $result = $this->db->query($sql);
        if ($result) {
            $rt = [
                "code" => 1,
                "msg" => "success",
                "data" => ""
            ];
            return json_encode($rt);
        }else{
            $rt = [
                "code" => 0,
                "msg" => "error",
                "data" => ""
            ];
            return json_encode($rt);
        }
    }

    public function edit_info(){
        $user = $this->getUser();

        if(isset($_POST["nickname"])){
            $sql = "UPDATE user_tracking SET nickname='".$_POST["nickname"]."', head='".$_POST["head"]."',
             age='".$_POST["age"]."', sex='".$_POST["sex"]."', email='".$_POST["email"]."', 
             location='".$_POST["location"]."', status='".$_POST["status"]."' WHERE id=1";

            $result = $this->db->query($sql);
            if ($result) {
                $rt = [
                    "code" => 1,
                    "msg" => "success",
                    "data" => ""
                ];
                return json_encode($rt);
            }else{
                $rt = [
                    "code" => 0,
                    "msg" => "error",
                    "data" => ""
                ];
                return json_encode($rt);
            }
        }

        unset($user["password"]);
        $rt = [
            "code" => 1,
            "msg" => "success",
            "data" => $user
        ];
        return json_encode($rt);
    }
}