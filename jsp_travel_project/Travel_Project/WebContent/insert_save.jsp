<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%> 
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String upload = request.getParameter("upload");
		String desti = request.getParameter("desti");
		String s_day = request.getParameter("s_day");
		String e_day = request.getParameter("e_day");
		String money = request.getParameter("money");
		String[] move = request.getParameterValues("move");
		String who = request.getParameter("who");
		String imgname = request.getParameter("img");
	%>
</body>
</html>