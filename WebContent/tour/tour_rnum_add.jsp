<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>    
<%
String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
String bb="root"; 
String cc="1234"; 
Connection conn = DriverManager.getConnection(aa,bb,cc);
Statement stmt = conn.createStatement(); 

// gong_content.jsp => 1개의 레코드만 가져와서 전부 보여준다

// 가져올 레코드의 id값 가져오기
String id=request.getParameter("id");
// 조회수 추가
String sql="update tour set rnum=rnum+1 where id="+id;
stmt.executeUpdate(sql);
response.sendRedirect("tour_content.jsp?id="+id);

%>