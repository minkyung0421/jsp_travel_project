<%@ page language="java" contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>파일 업로드 폼</title>
</head>
 
<body>
 <script type="text/javascript">
function submit1(f){
	var text = f.subject.value;
	f.action="fileUpload.jsp?text="+text;
	f.submit();
}
</script>

<form name="formUpload" method="post" enctype="multipart/form-data">
아이디(만들어질 폴더명) : <input type="text" name="ccount"><br />
업로드 이미지 : <input type="file" name="upload" /><input type="button" value="입력" onclick="submit1(this.form)" />
</form>
</body>
</html>

