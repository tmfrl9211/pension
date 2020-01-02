<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>   
<% 
  String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
  String bb="root";
  String cc="1234";
  Connection conn = DriverManager.getConnection(aa,bb,cc);
  Statement stmt=conn.createStatement();
  
  // id값 읽어오기
  String id=request.getParameter("id");
  String Page=request.getParameter("page");
  // 조회수 증가 쿼리 작성
  String sql="update qna set rnum=rnum+1 where id="+id;
  // 쿼리 실행
  stmt.executeUpdate(sql);
  // content.jsp로 이동
  response.sendRedirect("content.jsp?id="+id+"&page="+Page);
  
  stmt.close();
  conn.close();
%>  