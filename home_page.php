<?php 
error_reporting(0);
session_start();
require ('include/connect.php');
?>
<!DOCTYPE html>
<html>
<head>
<title>Home Page</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<form action="home_page.php" method="post" enctype="multipart/form-data">
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
  <li><a href="customer_signup.php">Sign-Up</a></li>
</ul>
</td>
</tr>
</table>
<table align="center" cellpadding="15">
<?php
  $select="SELECT p.* FROM product p,category c
          WHERE p.category_category_id=c.category_id AND p.status='In Stock'
          ORDER BY release_date ASC";
  $ret=mysqli_query($con,$select);
  $count7=mysqli_num_rows($ret);
  for($i=0;$i<$count7;$i+=3)
  {
    $select1="SELECT * FROM product p,category c WHERE p.category_category_id=c.category_id AND p.status='In Stock'
        ORDER BY product_id ASC
        LIMIT $i,3";
        
    $ret1=mysqli_query($con,$select1);
    $count8=mysqli_num_rows($ret1);
    echo "<tr>";
    for($x=0;$x<$count8;$x++)
    {
      $row=mysqli_fetch_array($ret1);
      $productid=$row['product_id'];
      $categoryid=$row['category_category_id'];
      $productname=$row['product_name'];
      $price=$row['product_price'];
      $image1=$row['image1'];  
      //list($width,$height)=getimagesize($productimg2);
      //$w=$width/2;
      //$h=$height/2;
?>
      <td align="center" class="bar1">
        <a href="product_detail.php?productid=<?php echo $row['product_id'] ?>">
        <img src="/productimages/<?php echo $image1 ?>" />
        </a>    
        <b><h3><?php echo $productname ?> </h3></b>
        <b><h5>£ <?php echo $price ?></h5></b>
      </td>
    <td></td>
    <?php
    }
    echo "</tr>";
  }

?>
</table>
</form>
</body>
</html>
