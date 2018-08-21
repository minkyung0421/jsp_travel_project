<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.sql.Timestamp, java.io.*, java.util.*, java.sql.*"%>
<%@page import="com.jsp.project.travel.TravelDBBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "travel" scope = "page" class = "com.jsp.project.travel.TravelBean">
</jsp:useBean>

<%


	String realFolder = "";
	String filename = "";
	MultipartRequest mr = null;
	
	String saveFolder = "imageFile";
	String encType = "utf-8";
	int maxSize = 2*1024*1024;
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);

	try{
		
		mr = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		
		
		String place = mr.getParameter("desti");
		String place_e = mr.getParameter("e_desti");
		String s_date = mr.getParameter("s_day");
		String e_date = mr.getParameter("e_day");
		String money = mr.getParameter("money");
		String[] trans1 = mr.getParameterValues("move");
		String people = mr.getParameter("who");
		String course = mr.getParameter("course");
		String trnas = Arrays.toString(trans1);
		String concept = mr.getParameter("concept");
		
		
		Enumeration files = mr.getFileNames();
		
		while(files.hasMoreElements()){
			String name = (String)files.nextElement();
			
			filename = mr.getFilesystemName(name);
		}
		
		
		travel.setTitle_img(filename);
		travel.setConcept(concept);
		travel.setPlace(place);
		travel.setPlace_e(place_e);
		travel.setS_date(s_date);
		travel.setE_date(e_date);
		travel.setMoney(money);
		travel.setTrans(trnas);
		travel.setPeople(people);
		travel.setCourse(course);
		travel.setAdd_date(new Timestamp(System.currentTimeMillis()));
		

	}catch(Exception e){
		e.printStackTrace();
	}

		TravelDBBean travelProcess = TravelDBBean.getInstance();
		travelProcess.insertTravel(travel);
		
		response.sendRedirect("index.jsp");
%>

<%
// request.getRealPath("상대경로") 를 통해 파일을 저장할 절대 경로를 구해온다.
// 운영체제 및 프로젝트가 위치할 환경에 따라 경로가 다르기 때문에 아래처럼 구해오는게 좋음
/* String uploadPath = request.getRealPath("/uploadFile");
out.println("절대경로 : " + uploadPath + "<br/>");
 
int maxSize = 1024 * 1024 * 10; // 한번에 올릴 수 있는 파일 용량 : 10M로 제한
 
String name = "";
String title_img = "";
 
String fileName1 = ""; // 중복처리된 이름
String originalName1 = ""; // 중복 처리전 실제 원본 이름
long fileSize = 0; // 파일 사이즈
String fileType = ""; // 파일 타입
 
MultipartRequest multi = null;

try{
    // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
    multi = new MultipartRequest(request,uploadPath,maxSize,"eu-ckr",new DefaultFileRenamePolicy());
     
    // form내의 input name="name" 인 녀석 value를 가져옴
    name = multi.getParameter("name");
    // name="subject" 인 녀석 value를 가져옴
    title_img = multi.getParameter("upload");
     
    // 전송한 전체 파일이름들을 가져옴
    Enumeration files = multi.getFileNames();
     
    while(files.hasMoreElements()){
        // form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
        String file1 = (String)files.nextElement(); // 파일 input에 지정한 이름을 가져옴
        // 그에 해당하는 실재 파일 이름을 가져옴
        originalName1 = multi.getOriginalFileName(file1);
        // 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
        // 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
        fileName1 = multi.getFilesystemName(file1);
        // 파일 타입 정보를 가져옴
        fileType = multi.getContentType(file1);
        // input file name에 해당하는 실재 파일을 가져옴
        File file = multi.getFile(file1);
        // 그 파일 객체의 크기를 알아냄
        fileSize = file.length();
    }
}catch(Exception e){
    e.printStackTrace();
} */


%>
<%

/* String place = request.getParameter("desti");
String place_e = request.getParameter("e_desti");
String s_date = request.getParameter("s_day");
String e_date = request.getParameter("e_day");
String money = request.getParameter("money");
String[] trans1 = request.getParameterValues("move");
String people = request.getParameter("who");
String course = request.getParameter("course");
String trans = Arrays.toString(trans1);
String concept = request.getParameter("concept"); */


/* Class.forName("com.mysql.jdbc.Driver");
Connection conn = null;
String url = "jdbc:mysql://localhost:3306/mydb";
conn = DriverManager.getConnection(url, "root", "1234");
Statement stmt;
stmt = conn.createStatement();

String query;
int nrows;
query = "insert into travel values(";
query += 1 + "'"+title_img+"',"+ "'"+concept+"',"+"'"+place+"',"+"'"+place_e+"',"+"'"+s_date+"',"+"'"+e_date+"',"+"'"+money+"',";
query += "'"+trans+"',"+"'"+people+"',"+"'"+course+"',"+ new Timestamp(System.currentTimeMillis())+")";
nrows = stmt.executeUpdate(query);
stmt.close();
conn.close(); */
%>


</body>
</html>