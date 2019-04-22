<html>
<head>
	<title>Home</title>
</head>
<form action="Product_Display.php" method="post">
<body>
		<input type="text" name="txtdata" placeholder="Search Here..." class="search1" />
		<input type="submit" name="btnsearch" Value="Search" class="button" />
	<ul><li class="active"><b><a href="#">Home</a></b></li>
		<li><b><a href="#">Category</a></b></li>
		<li><b><a href="#">About</a></b></li>
		<li><b><a href="#">Contact</a></b></li>
		<?php if (!isset($_SESSION['CustomerID']))
		        {
		        	echo "<li><b><a href='Customer_Login.php'>Login</a></b></li>";
		        	echo "<li><b><a href='Customer_Registration.php'>Register</a></b></li>";
				} 
				else
				{
					echo "<li><b><a href='Logout.php'>Logout</a></	b></li>";	
				}?>
	</ul></div>
	<div id="page">
		<div id="left-sidebar">
			<div class="box" id="box1">
				<h2 class="title">Category</h2>
				<div class="entry">
					<ul class="list1"><li><a href="#">Vero eos et accusamus</a></li>
						<li><a href="#">Neque porro quisquam </a></li>
						<li><a href="#">Molestias excepturi</a></li>
						<li><a href="#">Voluptatibus maiores </a></li>
					</ul></div>
			</div>
		</div>
		<div id="content">
			<div class="box" id="box3">
				<fieldset>
					<legend>Product List :</legend>
					<table align="center" width="75%">
					<?php 
					if (isset($_POST['btnsearch'])) 
					{
						$data=$_POST['txtdata'];
						$searchdata="
										Select p.*
										from product p,category c
										where p.CategoryID=c.CategoryID
										and p.Status='Active'
											and p.ProductName like '%$data%'
										order by p.Price desc
						";
						$ret=mysql_query($searchdata,$connection);
						$num_result=mysql_num_rows($ret);

						if ($num_result==0) 
						{
							echo "<p>No Match Found</p>";
						}
						else
						{
							for ($a=0; $a < $num_result; $a++) 
							{ 
								$product="  Select *
											from product p,category c
											where p.CategoryID=c.CategoryID
											and p.Status='Active'
											and p.ProductName like '%$data%'
											order by p.Price desc			
											LIMIT $a,4";
								$retp=mysql_query($product);
								$num_resultp=mysql_num_rows($retp);

								echo "<tr>";
								for ($b=0; $b < $num_resultp; $b++) 
								{ 
									$row=mysql_fetch_array($ret);
									$image=$row['Image1'];
									list($width, $height, $type, $attr)=getimagesize($image);
									$w=$width/3;
									$h=$height/3;
									?>
									<td height="339">
										<img src="<?php echo $image ?>" width='<?php echo $w ?>' height='<?php echo $h ?>'/>
										<br>
										<b><?php echo $row['ProductName']; ?></b>
										<br>
										<b><?php echo $row['Price']; ?>MMK</b>
										<br><br>
										<a href="Product_Detail.php?ProductID=<?php echo $row['ProductID'] ?>">Detail</a>
									</td>
									<?php
								}
								echo "</tr>";
							}
						}
					}
					//check
					else
					{
						$searchdata="
										Select *
										from product p,category c
										where p.CategoryID=c.CategoryID
										and p.Status='Active'
						";
						$ret=mysql_query($searchdata,$connection);
						$num_result=mysql_num_rows($ret);

							for ($a=0; $a < $num_result; $a++) 
							{ 
								$product="  Select *
											from product p,category c
											where p.CategoryID=c.CategoryID
											and p.Status='Active'			
											LIMIT $a,4";
								$retp=mysql_query($product);
								$num_resultp=mysql_num_rows($retp);
								echo "<tr>";
								for ($b=0; $b < $num_resultp; $b++) 
								{ 
									$row=mysql_fetch_array($ret);
									$image=$row['Image1'];
									list($width, $height, $type, $attr)=getimagesize($image);
									$w=$width/3;
									$h=$height/3;
									?>
									<td height="339">
										<img src="<?php echo $image ?>" width='<?php echo $w ?>' height='<?php echo $h ?>'/>
										<br>
										<b><?php echo $row['ProductName']; ?></b>
										<br>
										<b><?php echo $row['Price']; ?> MMK</b>
										<br><br>
					<?php if (!isset($_SESSION['CustomerID'])): ?>
					<?php elseif (isset($_SESSION['CustomerID'])): ?>
					<a style="text-decoration:none;background-color:red; padding:10px 20px 10px 20px; border-radius:10px;" href="Product_Detail.php?ProductID=<?php echo $row['ProductID'] ?>">Detail</a>
					<?php endif ?>
									</td>
									<?php
								}
								echo "</tr>";
							}	
					}//end else
					?>
					</table>
				</fieldset>		
			</div>
		</div>
	</div>
	<div style="clear: both; margin-bottom: 20px;"></div>
		<div id="wrapper">
			<div id="footer">
			<p class="logo"><img src="images/img12.jpg" alt=""></p>
			<p class="legal">
				Copyright © 2017 WebsiteName. All Rights Reserved. | <a href="#">Privacy Policy</a>
			</p>
			</div>
		</div>
</body>
</form>
</html>
