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
  
  // 수정할 레코드의 입력값 읽어오기
  request.setCharacterEncoding("utf-8");
  String id=request.getParameter("id");
  String title=request.getParameter("title");
  String content=request.getParameter("content");
  String name=request.getParameter("name");
  String pwd=request.getParameter("pwd"); // 폼에 입력한 비밀번호
  String Page=request.getParameter("page");
  
  // DB에 있는 비밀번호를 읽어오기 (현재 수정하고자 하는 레코드의 pwd)
  String sql="select * from qna where id="+id;
  ResultSet rs=stmt.executeQuery(sql);
  rs.next();
  // 비밀번호가 맞는지 검사
  if(pwd.equals(rs.getString("pwd")))
  {		  
  // 1. 비밀번호가 맞을때
    // 수정할 쿼리를 작성
    sql="update qna set title='"+title+"', content='"+content+"'";
    sql=sql+", name='"+name+"' where id="+id;
    // 쿼리 실행
    //out.println(sql);
    stmt.executeUpdate(sql);
    // content.jsp로 이동
    response.sendRedirect("content.jsp?id="+id+"&page="+Page);
  }
  else
  {
  // 2. 비밀번호가 틀릴때
    // conent.jsp로 이동
%>
    <script>
      alert("비밀번호가 틀립니다");
      location="update.jsp?id="+<%=id%>+"&page="+<%=Page%>;
    </script>
<% 
  }
  stmt.close();
  conn.close();
%>  
