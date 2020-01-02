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
  String pwd=request.getParameter("pwd");
  String blood=request.getParameter("blood");
  String birth=request.getParameter("birth");
  String[] hobby=request.getParameterValues("hobby"); // hobby는 2개 이상이므로 배열로 가져옴
  String hob=""; // 저장할값 => 1,3,4
  for(int i=0;i<hobby.length;i++)
	  hob=hob+hobby[i]+",";
  
  //db에 있는 비밀번호를 읽어오기
  String sql="select * from gesipan where id="+id;
  ResultSet rs=stmt.executeQuery(sql);
  rs.next();
  
  //비밀번호가 맞는지 검사
  if(pwd.equals(rs.getString("pwd")))
		  {
  //비밀번호가 맞을 때
  //쿼리 작성
   sql="update gesipan set title='"+title+"', content='"+content+"'";
   sql=sql+", blood="+blood+", birth='"+birth+"', hobby='"+hob+"'";
   sql=sql+" where id="+id;
  //쿼리 실행
   stmt.executeUpdate(sql);
  //content.jsp로 이동
   response.sendRedirect("content.jsp?id="+id);
		  }
  //비밀번호가 틀릴 때
  else
  { 
	  %>
	  <script>
	  alert("비밀번호가 틀립니다");
	  location="update.jsp?id="+<%=id%>;
	  </script>
	  <% 
  //content.jsp로 이동
  response.sendRedirect("content.jsp?id="+id);
  }
  %>  