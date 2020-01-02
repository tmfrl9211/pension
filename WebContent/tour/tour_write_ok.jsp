<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>   
<%@page import="java.util.Date" %> 
<%@page import="java.text.SimpleDateFormat"%> 
<%@ page import= "com.oreilly.servlet.MultipartRequest" %>
<%@ page import= "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
String path="C:/eclipse-workspace(web/pension/WebContent/tour";
int max=1024*1024*10;
MultipartRequest multi=new MultipartRequest(request,path,max
		   ,"utf-8",new DefaultFileRenamePolicy());

// write_ok.jsp
  // DB 연결및 쿼리를 사용할수 있는환경
  // Connection , Statement 
  String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
  String bb="root";
  String cc="1234";
  Connection conn = DriverManager.getConnection(aa,bb,cc);
  Statement stmt=conn.createStatement();

  // 입력값 가져오기
  request.setCharacterEncoding("utf-8");
  Date today=new Date();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
  String writeday= sdf.format(today);
  
  // 파일과 입력값 읽어오기		
  String name=multi.getParameter("name");
  String title=multi.getParameter("title");
  String content=multi.getParameter("content");
  String fname=multi.getOriginalFileName("fname"); // 원래 이름
  
  // 쿼리 작성
  String sql="insert into tour(name,title,content,fname,";
  sql=sql+"writeday) values('"+name+"','"+title;
  sql=sql+"','"+content+"','"+fname+"','"+writeday+"')";

  // 쿼리 실행
  stmt.executeUpdate(sql);
  // list.jsp로 이동
  response.sendRedirect("list.jsp");
  stmt.close();
  conn.close();
%>  