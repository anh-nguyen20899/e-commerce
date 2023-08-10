<?php
   include("config.php");
   
   if($_SERVER["REQUEST_METHOD"] == "POST") {
      // username and password sent from form 
      
      $myusername = mysqli_real_escape_string($conn,$_POST['username']);
      $mypassword = mysqli_real_escape_string($conn,$_POST['password']); 
      echo $myusername;
   }
   CloseCon($conn);
?>
	
<div class="login">
   <form method="post" class="row g-3">
      <div class="col-auto">
         <label for="email" class="col-sm-2 col-form-label">Email</label>
         <div class="col-sm-10">
            <input type="text" class="form-control" name="username">
         </div>
      </div>
      <div class="col-auto">
         <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
         <div class="col-sm-10">
            <input type="password" class="form-control" id="inputPassword" name="password">
         </div>
      </div>
      <div class="col-auto">
         <div class="col-sm-12">
            <input type="submit" class="form-control" value="Submit">
            </div>   
         </div>     
   </form>
</div>
