<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>  
<% 
  String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
  String bb="root";
  String cc="1234";
  Connection conn = DriverManager.getConnection(aa,bb,cc);
  Statement stmt=conn.createStatement();
  
  //삭제하고자 하는 레코드의 id, pwd 읽어오기
  String id=request.getParameter("id");
  String pwd=request.getParameter("pwd");
  
  //방금입력한 pwd와 DB에 있는 비밀번호를 비교하기 위해 DB 읽어오기
  String sql="select * from gesipan where id="+id;
  ResultSet rs=stmt.executeQuery(sql);
  rs.next();
  
  if(pwd.equals(rs.getString("pwd")))
		  { // 비밀번호가 맞을 때
	  sql="delete from gesipan where id="+id;
		  stmt.executeUpdate(sql);
		  response.sendRedirect("list.jsp");
		  }
  else
  { // 비밀번호가 틀릴 때
	  response.sendRedirect("content.jsp?id="+id);
  }
  stmt.close();
  conn.close();
  %>