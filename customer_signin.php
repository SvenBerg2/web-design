<html>
<head>
	<title>Sign In</title>
</head>
<body>
<form action="customer_signin.php" method="POST" enctype="multipart/form-data"></form>
	<table align="center" cellpadding="10">
		<tr>
			<td>Email Address</td>
			<td>: <input type="email" name="txtemail" placeholder="Email address..." class="search" required></td>
		</tr>
		<tr>
			<td>Password</td>
			<td>: <input type="password" name="txtpass" placeholder="Password..." class="search" required></td>
		</tr>
		<tr>
			<td><input type="submit" name="btnsignin" value="Sign In"></td>
		</tr>	
		<tr>
			<td></td>
			<td><a href="#">Forgotten your password?</a> <a href="customer_registration.php">Don't Have an Account?</a></td>
		</tr>
	</table>
</body>
</html>
