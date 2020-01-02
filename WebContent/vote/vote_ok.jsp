<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.sql.*" %>  
<%
  String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
  String bb="root";
  String cc="1234";
  Connection conn = DriverManager.getConnection(aa,bb,cc);
  Statement stmt=conn.createStatement();
  
  //선택된 값을 가져오기
  String anju=request.getParameter("anju");
  
  // 투표가 된 안주 필드의 값을 1 증가
  String sql="";
  switch(anju)
  {
  case "1" : sql="update vote set a1=a1+1 where id=1"; break;
  case "2" : sql="update vote set a2=a2+1 where id=1"; break;
  case "3" : sql="update vote set a3=a3+1 where id=1"; break;
  case "4" : sql="update vote set a4=a4+1 where id=1"; break;
  case "5" : sql="update vote set a5=a5+1 where id=1"; break;
  case "6" : sql="update vote set a6=a6+1 where id=1"; break;
  case "7" : sql="update vote set a7=a7+1 where id=1"; break;
  }
  
  //쿼리실행
  stmt.executeUpdate(sql);
  response.sendRedirect("vote_view.jsp");
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>