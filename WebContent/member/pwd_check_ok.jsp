<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<%
String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
String bb="root"; 
String cc="1234"; 
Connection conn = DriverManager.getConnection(aa,bb,cc);
Statement stmt = conn.createStatement(); 

//폼에 입력된 값 가져오기
 String pwd=request.getParameter("pwd");

//아이디와 비밀번호를 가지고 member 테이블에서 검색 (레코드가 있는지)
String sql="select * from member where userid='"+session.getAttribute("userid")+"' and pwd='"+pwd+"'";

//쿼리를 실행해서 결과를 ResultSet으로 가져오기
ResultSet rs=stmt.executeQuery(sql);

//레코드가 있는 경우와 없는 경우의 실행 작성
if(rs.next()) // 레코드가 있으면 true, 없으면 false가 됨
	response.sendRedirect("update.jsp");
else
{
	response.sendRedirect("pwd_check.jsp");
}

rs.close();
stmt.close();
conn.close();

%>