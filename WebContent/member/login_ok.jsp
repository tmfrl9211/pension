<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>    
<%
String aa="jdbc:mysql://localhost:3307/pension?useSSL=false";
String bb="root"; 
String cc="1234"; 
Connection conn = DriverManager.getConnection(aa,bb,cc);
Statement stmt = conn.createStatement(); 

//입력양식의 값을 가져오기
request.setCharacterEncoding("utf-8");

String userid=request.getParameter("userid");
String pwd=request.getParameter("pwd");

// 아이디, 비밀번호를 조건으로 검색하는 쿼리문 작성
String sql="select * from member where userid='"+userid+"'";
sql=sql+" and pwd='"+pwd+"'";

ResultSet rs=stmt.executeQuery(sql);

if(rs.next()) //레코드가 있으면 true, 없으면 false
{ // 로그인에 성공하면 세션변수를 만든다..
	//int a=100;
    session.setAttribute("userid",rs.getString("userid"));
    session.setAttribute("name",rs.getString("name"));
        // 세션변수만드는 메소드 (변수명,값)
        
    response.sendRedirect("../main/index.jsp");
  }
else
	response.sendRedirect("login.jsp");
%>