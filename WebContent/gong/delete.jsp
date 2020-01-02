<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>    
<%
String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
String bb="root"; 
String cc="1234"; 
Connection conn = DriverManager.getConnection(aa,bb,cc);
Statement stmt = conn.createStatement(); 

//삭제하고자 하는 레코드의 id값을 가져오기
String id=request.getParameter("id"); // get으로 보낸값

//삭제쿼리 작성
String sql="delete from gongji where id="+id;

//삭제 실행
stmt.executeUpdate(sql);

//gong_list.jsp로 이동
response.sendRedirect("gong_list.jsp");

//close();
stmt.close();
conn.close();

%>

