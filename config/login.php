<?php
   include("config.php");
   session_start();
   if($_SERVER["REQUEST_METHOD"] == "POST") {
      // username and password sent from form 
      if (empty($_POST['email'])) {
         $errEmail = 'Please enter your email';
      }  else if (empty($_POST['password']) || (preg_match("/^.*(?=.{8,})(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).*$/", $_POST["password"]) === 0)) {
         $errPass = 'Password must be at least 8 characters and must contain at least one lower case letter, one upper case letter and one digit';
      } else {
         $email = mysqli_real_escape_string($conn,$_POST['email']);
         $mypassword = mysqli_real_escape_string($conn,$_POST['password']); 

         $sql = "SELECT id FROM Customers WHERE Email = '$email' and Credential_pass = '$mypassword'";
         $result = mysqli_query($conn,$sql);
         
         if($result)
         {
            while($row = mysqli_fetch_array($result))
            {
               if($row == 1) {
                  session_register("myusername");
                  $_SESSION['login'] = $email;
                  
                  header("location: welcome.php");
               }else {
                  $error = "Your Login Name or Password is invalid";
               }
            }
         }
      }
      

      
   }
   
   CloseCon($conn);
?>
	
<div class="login">
<form role="form" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
      <div class="form-group row">
        <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
        <div class="col-sm-10 col-md-3">
          <input type="email" class="form-control" id="inputEmail" name="email" placeholder="Email">
          <?php if(isset($errEmail)) echo $errEmail; ?>
        </div>
      </div>
      <div class="form-group row">
        <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
        <div class="col-sm-10 col-md-3">
          <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Password">
          <?php if(isset($errPass)) echo $errPass; ?>
        </div>
      </div>
      <div class="form-group row">
        <div class="offset-sm-2 col-sm-10">
          <input type="submit" value="Login" name="submit" class="btn btn-primary"/>
        </div>
      </div>
    </form>
</div>
