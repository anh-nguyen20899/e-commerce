<?php
   include('config.php');
   session_start();
   
   $user_check = $_SESSION['login'];
   
   $ses_sql = mysqli_query($db,"select email from customers where email = '$user_check' ");
   
   $row = mysqli_fetch_array($ses_sql,MYSQLI_ASSOC);
   
   $login_session = $row['email'];
   
   if(!isset($_SESSION['login'])){
      header("location:login.php");
      die();
   }
?>