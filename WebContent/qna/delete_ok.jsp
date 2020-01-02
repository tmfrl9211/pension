<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>   
<% 
  String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
  String bb="root";
  String cc="1234";
  Connection conn = DriverManager.getConnection(aa,bb,cc);
  Statement stmt=conn.createStatement();
  
  // 삭제하고자 하는 레코드의 id,pwd를 읽어오기
  String id=request.getParameter("id");
  String pwd=request.getParameter("pwd");
  
  // 방금입력pwd  와 DB에 있는 비밀번호가 비교를 하기위해 DB를 읽어오기
  String sql="select * from qna where id="+id;
  ResultSet rs=stmt.executeQuery(sql);
  rs.next();
  
  // 입력된비번과 DB에 있는 비번을 확인후 작업
  if(pwd.equals(rs.getString("pwd"))) 
  { // 비밀번호가 맞을때
	  sql="delete from qna where id="+id;
      stmt.executeUpdate(sql);
      response.sendRedirect("list.jsp");
  }
  else
  { // 비밀번호 서로 틀릴때
	  response.sendRedirect("content.jsp?id="+id);
  }
  stmt.close();
  conn.close();
%>  



