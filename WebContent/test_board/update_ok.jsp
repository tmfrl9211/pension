<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>    
<%
  // DB 연결및 쿼리를 사용할수 있는환경
  // Connection , Statement 
  String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
  String bb="root";
  String cc="1234";
  Connection conn = DriverManager.getConnection(aa,bb,cc);
  Statement stmt=conn.createStatement();
  

  
  request.setCharacterEncoding("utf-8");
  String id=request.getParameter("id");
  String name=request.getParameter("name");
  String title=request.getParameter("title");
  String content=request.getParameter("content");
  String email=request.getParameter("email");
  String sung=request.getParameter("sung");
  String juso=request.getParameter("juso");
  String[] food=request.getParameterValues("food");
  String foo="";
   for(int i=0;i<food.length;i++)
   {
	   foo=foo+food[i]+",";
   }
   
   
   String sql="update test_board set title='"+title+"', content='";
   sql=sql+content+"', email='"+email+"', sung="+sung+",";
   sql=sql+"juso='"+juso+"', food='"+foo+"' where id="+id;
   
   stmt.executeUpdate(sql);
   response.sendRedirect("content.jsp?id="+id);
   
   stmt.close();
  %>