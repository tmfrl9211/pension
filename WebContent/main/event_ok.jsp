<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>   
<%@page import="java.util.Date" %> 
<%@page import="java.text.SimpleDateFormat"%> 
<% // content.jsp
  String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
  String bb="root";
  String cc="1234";
  Connection conn = DriverManager.getConnection(aa,bb,cc);
  Statement stmt=conn.createStatement();
  // 입력값 가져오기
  request.setCharacterEncoding("utf-8");
  String name=request.getParameter("name");
  String phone=request.getParameter("phone");
  // 날짜 생성
  Date today=new Date();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
  String writeday= sdf.format(today);
  // 쿼리 생성
  String sql="insert into event(name,phone,writeday)";
  sql=sql+" values('"+name+"','"+phone+"','"+writeday+"')";
  // 쿼리 실행
  stmt.executeUpdate(sql);
  // close()
  stmt.close();
  conn.close();
  // index.jsp로 이동
  response.sendRedirect("../main/index.jsp");
 
%>  














