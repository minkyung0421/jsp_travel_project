<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
@font-face{font-family: amaticsc-bold; src:url('font/AmaticSC-Bold.ttf')}

body{
	background-image: url(image/travel2.jpg);
	background-size: 100%;
}
table{
	display: inline;
}
.effect{
	display: inline-block;
	box-shadow: 0px 0px 20px -2px rgba(0,0,0,0.8);
}

.font{
	font-family: amaticsc-bold;
	font-size: 3em;
}

.font2{
	font-family: amaticsc-bold;
	font-size: 4em;
	color: white;
	margin-top: 2%;
}


</style>
<body>
<center>
	<div style = "background-color:black; margin: 2%; padding: 0.5px">
		<p class = "font2"> my Travel diary</p>
	</div>
</center>

<a style ="display:scroll; position:fixed; bottom:3%; left:50%;" href = "insertForm.jsp" title="������">
	<img src = "image/add.png" width="15%" height="15%">
</a>

<table border = "0" style = "margin:2%">
	<tr>
		<td><img src = "image/1.jpg" width = "250" height = "250" class = "effect" id = "img1"></td>
	</tr>
	<tr height="10%" style = "background-color: white;">
		<td>
			<center><p class = "font">Incheon</p></center>
		</td>
	</tr>
</table>

<table border = "0" style = "margin:2%">
	<tr>
		<td><img src = "image/2.jpg" width = "250" height = "250" class = "effect" id = "img1"></td>
	</tr>
	<tr height="10%" style = "background-color: white;">
		<td>
			<center><p class = "font">Tokyo</p></center>
		</td>
	</tr>
</table>

</body>
</html>