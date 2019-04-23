<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Add category</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<form name="frmCategory" action="category.php" method="post" enctype="multipart/form-data">
	<table align="center" cellpadding="5">

<br>
<br>
    <table align="center" class="bar1" cellpadding="5">
      	<tr>
	        <td><input type="hidden" name="txtbrandid" value="<?php if(isset($brandid)){echo $brandid;}else{echo AutoID('brand','brandid','B-',6);}?>" ></td>
     	</tr>
    	<tr>
        	<td>Category Name</td>
            <td><input type="text" class="textboxd3" name="txtbrandname"/></td>
        </tr>
        <tr>
		<td>Status</td>
		<td>
		<input type="radio" name="rdostatus" value="Active" checked/>Active
		<input type="radio" name="rdostatus" value="InActive"/>InActive
		</td>
		</tr>
        <tr>
        	<td></td>
		<td>
		<?php 
			if(isset($_GET['Mode']))
			{
				echo "<input type='submit' class='btnd3' name='btnupdate' value='Update'/>";
			}
			else
			{
				echo "<input type='submit' class='btnd3' name='btnsave' value='Save'/>";
			}
		?>
		<input type="reset" class='btnd3' value="Clear"/>
		</td>
	</tr>
        </table>
    </li>
</ul>
</tr>
</table>
</form>
</body>
</html>
