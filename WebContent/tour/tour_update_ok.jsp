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
  
  //수정할 레코드의 값 읽어오기
  request.setCharacterEncoding("utf-8");
  String id=request.getParameter("id");
  String title=request.getParameter("title");
  String content=request.getParameter("content");
  
  //db에 있는 비밀번호를 읽어오기
  String sql="select * from tour where id="+id;
  ResultSet rs=stmt.executeQuery(sql);
  rs.next();
  

  //쿼리 작성
   sql="update tour set title='"+title+"', content='"+content+"'";
   sql=sql+" where id="+id;
  //쿼리 실행
   stmt.executeUpdate(sql);
  //content.jsp로 이동
   response.sendRedirect("tour_content.jsp?id="+id);
		  
  
  %> 