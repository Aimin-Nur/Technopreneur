<?php

include "koneksi.php";
session_start();

if (isset($_POST['login'])){
    $username = $_POST['username'];
    $password = $_POST['password'];
    $query = mysqli_query($koneksi, "SELECT * from admin_kalla WHERE username = '$username' AND kata_sandi ='$password'");
    if(mysqli_num_rows($query) !== 0){
        $get = mysqli_fetch_array($query);
        $level = $get['tingkat'];
        $nama = $get['username'];
        $_SESSION['usernamae'] = $nama;
        $_SESSION['tingkat'] = "admin";
        if($level == "admin"){
            echo "<script type='text/javascript'>alert('Selamat datang $nama'); location.href=\"tables.php\"</script>";
        }else if($level == "User"){
            echo "<script type='text/javascript'>alert('Selamat datang $nama'); location.href=\"index.php\"</script>";
       }
    }else{
        echo "Login gagal";
    }
}else{
    echo "akses gagal, ini halaman admin!!!";
}

?>
