<%-- 
    Document   : randpwd
    Created on : Dec 23, 2016, 9:42:06 PM
    Author     : tyron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://mistonline.in/wp/demo/jquery-1.2.3.min.js"></script>
<title>Random password generator</title>

<script type="text/javascript">
//script from Mistonline.in (Please dont remove this line)
function password(length, special) {
  var iteration = 0;
  var password = "";
  var randomNumber;
  if(special == undefined){
      var special = false;
  }
  while(iteration < length){
    randomNumber = (Math.floor((Math.random() * 100)) % 94) + 33;
    if(!special){
      if ((randomNumber >=33) && (randomNumber <= 47)) { continue; }
      if ((randomNumber >=58) && (randomNumber <= 64)) { continue; }
      if ((randomNumber >=91) && (randomNumber <= 96)) { continue; }
      if ((randomNumber >=123) && (randomNumber <= 126)) { continue; }
    }
    iteration++;
    password += String.fromCharCode(randomNumber);
  }
  document.getElementById('pwd').innerHTML=password;
}
</script>
 
</script></head>
<body>
<div class="left">
<h1>Random password generator</h1>
The New Password is <font color="red"><div id="pwd"></div></font>
<form>
  <input onclick="password(8)" type='button' value="Generate Random Password Now" id="submit"/>
</form>
</div></body>
</html>