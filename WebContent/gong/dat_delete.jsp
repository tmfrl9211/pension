<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>  
<%@page import="java.util.Date" %>  
<%@page import="java.text.SimpleDateFormat" %>
<%
  // DB 연결및 쿼리를 사용할수 있는환경
  // Connection , Statement 
  String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
  String bb="root";
  String cc="1234";
  Connection conn = DriverManager.getConnection(aa,bb,cc);
  Statement stmt=conn.createStatement();
  
  String id=request.getParameter("id");
  String sql="delete from gong_dat where id="+id;
  
  stmt.executeUpdate(sql);
  out.println("ok");
  %>