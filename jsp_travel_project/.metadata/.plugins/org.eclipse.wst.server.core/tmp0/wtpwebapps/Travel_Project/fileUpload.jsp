<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*"%> 
//아래 2줄은 파일업로드에 필요한 라이브러리(아래 첨부파일 참고)
<%@ page import="com.oreilly.servlet.MultipartRequest"%> 
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%> 

<% 
    request.setCharacterEncoding("UTF-8");
    String text = request.getParameter("text");	//만들어질 폴더명(회원별)을 받는다

    String root = pageContext.getServletContext().getRealPath("/"); 
    String savePath = root + File.separator + "image" + File.separator + "savaFile" + File.separator + text;	 //경로
    File dir = new File(savePath); 

    if (!dir.exists()) 
        dir.mkdirs(); //경로에 폴더가 없으면 해당폴더를 만든다(mkdirs() 는 부모까지 만드는 기능을 함)

    String encType = "UTF-8"; 

    int maxFileSize = 5 * 1024 * 1024; 

    MultipartRequest req = null; 

    req = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy()); 
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>
<fieldset> 
	<legend>정보</legend>
	<%=req.getParameter("subject")%>,
	<%
	String filename = req.getFilesystemName("upload");
	out.print(filename);
	%>,
	<%=request.getContextPath()+"/image/savaFile/"+text+"/"+filename%>
</fieldset>

<img src="<%=request.getContextPath()+"/image/savaFile/"+text+"/"+filename%>" border="0"/> //이미지 출력
</body>
</html>
