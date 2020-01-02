<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.sql.*" %>  
    <%@page import="java.util.Date" %> 
    <%@page import="java.text.SimpleDateFormat" %>
<% 
  String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
  String bb="root";
  String cc="1234";
  Connection conn = DriverManager.getConnection(aa,bb,cc);
  Statement stmt=conn.createStatement();
  
//폼입력양식에서 입력된 값을 가져오기
request.setCharacterEncoding("utf-8");
Date today=new Date();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
String writeday= sdf.format(today);
String name=request.getParameter("name"); // form name=name
String title=request.getParameter("title");  // form name=title
String content=request.getParameter("content"); // form name=content
String email=request.getParameter("email");
String sung=request.getParameter("sung");
String[] food=request.getParameterValues("food");
String juso=request.getParameter("juso");

String foo="";
for(int i=0;i<food.length;i++)
	foo=foo+food[i]+",";

String sql="insert into test_board(name, title, content, email, sung, food, juso, writeday) ";
sql=sql+"values('"+name+"','"+title+"','"+content+"','"+email+"',"+sung+",'"+foo+"','"+juso+"','"+writeday+"')";

stmt.executeUpdate(sql); //쿼리문 실행

response.sendRedirect("list.jsp");
stmt.close();
conn.close();
  %>