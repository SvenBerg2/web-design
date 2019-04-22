<html>
<head>
<title>Home</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<ul>
  <li><a href="home.php">CD World.COM</a></li>
  <li style="float:left;"><a href="#home">Blueray</a></li>
  <li style="float:center;"><a href="#news">DVD</a></li>
  <li style="float:center;"><a href="#contact">Music</a></li>
  <li style="float:right"><a class="active" href="#about">About</a></li>
  <li><a><input type="text" class="txtsearchd3" name="txtsearch" placeholder="Search"></a></li>
  <li><a><input type="submit" name="btnsearch" value="Search"></a></li>
</ul>
<div class="w3-content w3-display-container">
  <img class="mySlides" src="1.jpg" style="width:100%">
  <img class="mySlides" src="2.jpg" style="width:100%">
  <img class="mySlides" src="3.jpg" style="width:100%">

  <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
  <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
</div>

<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>
</body>
</html>

