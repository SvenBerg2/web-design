<?php 
error_reporting(0);
session_start();
require('include/connect.php');
if (isset($_POST['btncreateaccount'])) 
{
	if (strcmp($_SESSION['code'], $_POST['code'])!=0) 
	{
		echo "<script>window.alert('Code Does Not Match')</script>";
	}
	else
	{
		$txtfirstname=$_POST['txtfirstname'];
		$txtlastname=$_POST['txtlastname']; 
		$txtemail=$_POST['txtemail'];
		$txtpassword=$_POST['txtpassword'];
		$txtphone=$_POST['txtphone'];
		$txtaddress=$_POST['txtaddress'];
//----------Check Email---------------------------------------------------
		$checkemail="SELECT * FROM customer WHERE email=$txtemail";
		$ret=mysqli_query($con,$checkemail);
		$count=mysqli_num_rows($ret);
		if ($count !=0) 
		{
			echo "<script>window.alert('Email Address Already Exist')</script>";
			echo "<script>window.location='Customer_Registration.php'</script>";
		}
		else
		{
			$insert="INSERT INTO customer (first_name,last_name,address,city,country,post_code,phone_number,email,password)
					VALUES ('$txtfirstname','$txtlastname','$txtaddress','$txtcity','$txtcountry','$txtpostcode','$txtphone','$txtemail','$txtpassword')";
			$ret=mysql_query($InsertCustomer);

			if ($ret) 
			{
				echo "<script>window.alert('Customer Account Successfully Created')</script>";
				echo "<script>window.location='Customer_Login.php'</script>";
			}
			else
			{
				echo "<p>Error in Customer Registration :".mysql_error()."</p>";
			}
		}
	}
}

?><!DOCTYPE html>
<html>
<head>
	<title>Sign-up</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body> 
<form action="customer_signup.php" method="post" enctype="multipart/form-data">
<table align="center">
<tr>
<td>
  <ul class="menu cf">
  <li><a href="home_page.php">CD World</a></li>
  <li>
    <a href="">Movies</a>
    <ul class="submenu">
      <li><a href="">Action</a></li>
      <li><a href="">Animation</a></li>
      <li><a href="">Comedy</a></li>
      <li><a href="">Crime</a></li>
      <li><a href="">Documentary</a></li>
      <li><a href="">Drama</a></li>
      <li><a href="">Fantasy</a></li>
      <li><a href="">Foreign</a></li>
      <li><a href="">Horror</a></li>
      <li><a href="">Romantic</a></li>
      <li><a href="">Sci-Fi</a></li>
      <li><a href="">Thriller</a></li>
      <li><a href="">War</a></li>
      <li><a href="">Western</a></li>
    </ul>     
  </li>
  <li><a href="">Music</a>
    <ul class="submenu">
      <li><a href="">Alternative</a></li>
      <li><a href="">Blues</a></li>
      <li><a href="">Classical</a></li>
      <li><a href="">Country</a></li>
      <li><a href="">Dance & Electronic</a></li>
      <li><a href="">Folk</a></li>
      <li><a href="">Heavy Metal</a></li>
      <li><a href="">Jazz</a></li>
      <li><a href="">Pop</a></li>
      <li><a href="">R&B</a></li>
      <li><a href="">Rap & Hip-Hop</a></li>
      <li><a href="">Reggae</a></li>
      <li><a href="">Rock</a></li>
      <li><a href="">Soundtracks</a></li>
    </ul> 
    </li>
  <li><a href="">Games</a>
    <ul class="submenu">
      <li><a href="">Action</a></li>
      <li><a href="">Adventrue</a></li>
      <li><a href="">Fighting</a></li>
      <li><a href="">Horror</a></li>
      <li><a href="">Rhythm & Dance</a></li>
      <li><a href="">Platformer</a></li>
      <li><a href="">Puzzle</a></li>
      <li><a href="">Racing</a></li>
      <li><a href="">Role Playing</a></li>
      <li><a href="">Shooter</a></li>
      <li><a href="">Simulation</a></li>
      <li><a href="">Sport</a></li>
      <li><a href="">Strategy</a></li>
    </ul>   
  </li>
  <li><a href="">ABOUT</a></li>
  <li><a href="customer_signin.php">Sign-In</a></li>
</ul>
</td>
</tr>
</table>
	<table align="center" cellpadding="10">
	<tr>
		<td><h1>Account Sign-Up</h1></td>
	</tr>
	<tr>
		<td>First Name</td>
		<td>Last Name</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="txtfirstname" placeholder="Enter Your First Name" class="" requried/>
		</td>
		<td>
			<input type="text" name="txtlastname" placeholder="Enter Your Last Name" class="" requried/>
		</td>
	</tr>
	<tr>
		<td>Email Address</td>
		<td>Confrim Email Address</td>
	</tr>
	<tr>
		<td><input type="email" name="txtemail" placeholder="Enter Your Email" class="" requried/></td>
		<td><input type="email" name="txtreemail" placeholder="Retype Your email" class="" requried/></td>
	</tr>
	<tr>
		<td>Password</td>
		<td>Confirm Password</td>
	</tr>
	<tr>
		<td><input type="password" name="txtpassword" placeholder="Enter Your Password"></td>
		<td><input type="password" name="txtrepassword" placeholder="Retype Your Password"></td>
	</tr>
	<tr>
		<td>Address</td>
		<td>Town/City</td>
	</tr>
	<tr>
		<td><textarea name="txtaddress" style="width:170px;" class="" placeholder="Flat,building,floor,street name" required/></textarea></td>
		<td><input type="text" name="txtcity" placeholder="City or town name" required/></td>
	</tr>
	<tr>
		<td>Postcode</td>
		<td>Country</td>
	</tr>
	<tr>
		<td><input type="text" name="txtpostcode" placeholder="Enter your post code" required/></td>
		<td><input type="text" name="txtcountry" value="United Kingdom" required/></td>
	</tr>
	<tr>
		<td>Phone Number</td>
		<td>Security Answer</td>
	</tr>
	<tr>
		<td><input type="text" name="txtphone" placeholder="Enter Your Phone Number" required/></td>
		<td><input type="text" name="code" placeholder="Enter Security Code" class="search" required/></td>
	</tr>
	<tr> 
		<td colspan="2" align="center">
		<img src="generatecaptcha.php?rand=<?php echo rand(); ?>" id='captchaimg'/>
		<a href='javascript: refreshCaptcha();'>Refresh</a>
		<script Language='Javascript' type='text/javascript'>
		function refreshCaptcha()
		{
			var img=document.images['captchaimg'];
			img.src=img.src.substring(0,img.src.lastIndexOf("?"))+"?rand="+Math.random()*1000;
		}
		</script>
		</td>
	</tr>
	<tr>
		<td><input type="submit" name="btncreateaccount" value="Create Account"/>
		<input type="reset" name="btnclear" value="Clear"/></td>
	</tr>
	</table>
</form>
</body>
</html>
