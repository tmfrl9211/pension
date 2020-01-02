<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>  
<% 
  String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
  String bb="root";
  String cc="1234";
  Connection conn = DriverManager.getConnection(aa,bb,cc);
  Statement stmt=conn.createStatement();
  
  String id=request.getParameter("id");
  
  String sql="delete from test_board where id="+id;
  stmt.executeUpdate(sql);
  response.sendRedirect("list.jsp");
  
  stmt.close();
  %>