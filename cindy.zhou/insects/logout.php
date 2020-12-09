<?php
#启动session
session_start();

#清除session
unset($_SESSION["username"]);

#重定向
header("location:sign_in.html");
?>