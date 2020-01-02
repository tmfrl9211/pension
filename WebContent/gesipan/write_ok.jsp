<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>   
<%@page import="java.util.Date" %> 
<%@page import="java.text.SimpleDateFormat"%> 
<%// write_ok.jsp
  // DB 연결및 쿼리를 사용할수 있는환경
  // Connection , Statement 
  String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
  String bb="root";
  String cc="1234";
  Connection conn = DriverManager.getConnection(aa,bb,cc);
  Statement stmt=conn.createStatement();

  // 입력값 가져오기
  request.setCharacterEncoding("utf-8");
  Date today=new Date();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
  String writeday= sdf.format(today);
  String title=request.getParameter("title");
  String name=request.getParameter("name");
  String pwd=request.getParameter("pwd");
  String content=request.getParameter("content");
  String blood=request.getParameter("blood"); // 선택된 radio의 value
  String birth=request.getParameter("birth"); // 선택된 option의 value
  // checkbox는 값이 1개 이상
  String[] hobby=request.getParameterValues("hobby");
  String hob=""; // 저장할값
  
  for(int i=0;i<hobby.length;i++)
	  hob=hob+hobby[i]+",";
  // 쿼리작성
  String sql="insert into gesipan(name,title,pwd,content,blood,hobby";
  sql=sql+",birth,writeday) values('"+name+"','"+title+"','"+pwd;
  sql=sql+"','"+content+"',"+blood+",'"+hob+"','"+birth+"','";
  sql=sql+writeday+"')";
  // 쿼리 실행
  stmt.executeUpdate(sql);
  // list.jsp로 이동
  response.sendRedirect("list.jsp");
  stmt.close();
  conn.close();
%>  


